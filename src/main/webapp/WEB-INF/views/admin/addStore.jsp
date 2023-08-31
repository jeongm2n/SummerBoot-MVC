<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
    <title>상품등록</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${path}/resources/assets/js/daumPostcode.js"></script>
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06a1b9ec0da85dcbc94968ce7bd3be22&libraries=services"></script>
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
		<%@ include file="./common/sidebar.jsp" %>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
			<%@ include file="./common/topbar.jsp" %>
			
				<div class="container-fluid">
		            <!-- DataTales Example -->
		            <div class="card shadow mb-4">
		                <div class="card-header py-3">
		                    <h6 class="m-0 font-weight-bold text-washboot">지점등록</h6>
		                </div>
		                <div class="card-body pl-5">
							<form class="col-md-8" method="post" id="storeForm" action="addStore" enctype="multipart/form-data">
				            	<div class="input-group mb-3">
					                <label for="inputsubject" class="title">지점 사진</label>
					                <div id="imgTag" style="height: 100px; width: 100px; display:none; margin-right:2%"></div>
				                    <input type="file" class="form-control mt-1" id="file" name="file" onchange="loadFile(this)">
				                </div>
				            	<div class="input-group mb-3">
					                <label for="inputsubject" class="title">지점명</label>
				                    <input type="text" class="form-control mt-1" id="name" name="name" placeholder="Wash Boot OOO점 형식으로 입력해주세요">
				                </div>
				                <div class="input-group mb-3">
				                    <label for="inputname" class="title">주소</label>
				                    <button type="button" class="btn btn-washboot mt-1 search" onclick="execDaumPostcode();">주소찾기</button>
				                </div>
								<div class="input-group mb-3">
									<label for="inputsubject" class="title"></label>
									<div class="addr">
										<label class="addr-label">도로명 주소</label>
										<input type="text" class="form-control mt-1 addr-text" id="road_addr" name="road_addr" placeholder="도로명 주소" title="도로명 주소" required>
									</div>
								</div>
								<div class="input-group mb-3">
									<label for="inputsubject" class="title"></label>
									<div class="addr">
										<label class="addr-label">나머지 주소</label>
										<input type="text" class="form-control mt-1 addr-text" id="rest_addr" name="rest_addr" placeholder="나머지 주소">
									</div>
								</div>
				                <div class="input-group mb-3">
				                    <label for="inputemail" class="title">세차가능구역</label>
				                    <input type="text" class="form-control mt-1" id="sites" name="sites">
				                </div>
				                <div class="input-group mb-3">
				                    <label for="inputsubject" class="title">전화번호</label>
				                    <input type="text" class="form-control mt-1" id="tel" name="tel" placeholder="OO-OOOO-OOOO 형식으로 입력해주세요">
				                </div>
				                <div class="input-group mb-3">
				                    <label for="inputsubject" class="title">운영시간</label>
				                    <input type="time" class="form-control mt-1" id="open_time" name="open_time">
				                    <span style="padding: 1% 1%;">~</span>
				                    <input type="time" class="form-control mt-1" id="end_time" name="end_time">
				                </div>
				                <div class="row">
				                    <div class="col text-center mt-2">
				                    	<input type="text" name="lat" id="lat" style="display:none;">
				                    	<input type="text" name="lon" id="lon" style="display:none;">
				                        <button type="button" class="btn btn-washboot btn-lg px-3" id="add">지점등록</button>
				                    </div>
				                </div>
				            </form>
		                </div>
		            </div>
	            </div>
                <!-- /.container-fluid -->
			</div>
		</div>
	</div>
	<div id="map" style="width:100%;height:350px;display:none;"></div>
	<%@ include file="./common/footer.jsp" %>
</body>
</html>

<script>
	$(document).ready(function() {
	    var message = "${msg}";
	    if (message == 4) {
	    	alert("오류로 지점 등록에 실패하였습니다.");
	    }else if (message == 888) {
	    	alert("새 지점이 등록되었습니다.");
	        location.href="${path }/admin/store/storeList";
	    }
	});

	function loadFile(input) {
		var file = input.files[0];
		$('#imgTag').show();
		$('#imgTag').html("<img src='"+URL.createObjectURL(file)+"' style='max-height:100px; max-width:100px;'/>");
	}
	
	function fn_overlapped(){
	    if($("#name").val().length == 0){
	   	 alert("지점명을 입력하세요");
	   	 return;
	    }
	    
	    var _name = $("#name").val();
	    var res = false;
	    
	    $.ajax({
	       type:"post",
	       async:false,  
	       url:"${path}/admin/store/overlappedName",
	       dataType:"text",
	       data: {name:_name},
	       success:function (data){
	    	  $(".notice_id").show();
	          if(data=='not_usable'){
	        	  alert("이미 존재하는 지점명입니다.");
	        	  res = false;
	          } else {
	        	  res = true;
	          }
	       },
	       error:function(request, error){
				alert("에러가 발생했습니다.");
				console.log("code : " + request.status + "\n" + "message : " + request.responseText +"\n" + "error : " + error	);
			}
	    });
	    
	    return res;
	 }
	
	$(document).on('click', '#add' , function() {
		if(!$("#file").val()) {
			alert("상품사진을 선택해주세요.");
	   		return;
	   	} else if(!fn_overlapped()) {
	   		return;
	   	} else if($("#road_addr").val().length == 0) {
	   		alert("주소를 입력하세요.");
	   		return;
	   	} else if($("#sites").val().length == 0){
	   		alert("세차가능구역을 입력하세요.");
	   		return;
	   	} else if($("#tel").val().length == 0) {
	   		alert("전화번호를 입력하세요.");
	   		return;
	   	} else if($("#open_time").val().length == 0) {
	   		alert("운영시작시간을 입력하세요.");
	   		return;
	   	} else if($("#end_time").val().length == 0) {
	   		alert("운영종료시간을 입력하세요.");
	   		return;
	   	} else if($("#end_time").val().length == 0) {
	   		alert("운영종료시간을 입력하세요.");
	   		return;
	   	} else {
	   		var geocoder = new kakao.maps.services.Geocoder();
			var address = $("#road_addr").val() + " " + $("#rest_addr");
			
			geocoder.addressSearch(address, function(result, status) { // 입력한 주소의 좌표를 구하기
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        var lat = result[0].y;
					var lon = result[0].x;
					
					$("#lat").val(lat);
					$("#lon").val(lon);
			    } 
		   		document.getElementById("storeForm").submit();
			});
	   	}
	});
</script>
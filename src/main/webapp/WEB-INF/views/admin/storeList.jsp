<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
    <title>지점리스트</title>
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
</head>

<body id="page-top">
	<c:set var="file_repo" value="/summerboot2/resources/assets/img/"/>
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
                            <h6 class="m-0 font-weight-bold text-washboot">지점리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered store" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>지점</th>
                                            <th>주소</th>
                                            <th>세차가능구역</th>
                                            <th>전화번호</th>
                                            <th>운영시간</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>지점</th>
                                            <th>주소</th>
                                            <th>세차가능구역</th>
                                            <th>전화번호</th>
                                            <th>운영시간</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                        </tr>
                                    </tfoot>
                                    <tbody class="store">
                                   		<c:choose>
	                                    	<c:when test="${empty washList }">
	                                    		<tr>
		                                    		<td colspan="5" style="text-align:center;">등록된 세차장이 없습니다.</td>
	                                    		</tr>
	                                    	</c:when>
	                                    	<c:when test="${!empty washList }">
			                            		<c:forEach var="list" items="${washList }">
				                            		<c:set var="time" value="${fn:split(list.time,'~')}" />
				                            		<fmt:parseDate var="open_time" value="${time[0]}" pattern="HH:mm" />
				                            		<fmt:parseDate var="end_time" value="${time[1]}" pattern="HH:mm" />
			                                        <tr class="item">
			                                            <td>${list.name }</td>
			                                            <td>${list.address }</td>
			                                            <td>${list.sites }</td>
			                                            <td>${list.tel }</td>
			                                            <td><fmt:formatDate value="${open_time}" pattern="aa hh:mm"/> ~ <fmt:formatDate value="${end_time}" pattern="aa hh:mm"/></td>
			                                            <td class="store-update">수정</td>
			                                            <td class="store-delete" onclick="store_delete(${list.no}, '${list.name}')">삭제</td>
			                                        </tr>
			                                        <tr class="store-hide">
			                                        	<td colspan="7">  
										                    <div class="card-body pl-5">
																<form id="storeForm${list.no}" method="post" enctype="multipart/form-data">
													            	<div class="upBody">
														                <div>
															            	<div class="input-group mb-3">
																                <label for="inputsubject" class="title">지점명</label>
															                    <input type="text" class="form-control mt-1" id="name" value="${list.name }" disabled>
															                </div>
															                <div class="input-group mb-3">
															                    <label for="inputname" class="title">주소</label>
																				<input type="text" class="form-control mt-1 addr-text" id="address" name="address" value="${list.address }">
															                </div>
															                <div class="input-group mb-3">
															                    <label for="inputemail" class="title">세차가능구역</label>
															                    <input type="text" class="form-control mt-1" id="sites" name="sites" value="${list.sites }">
															                </div>
															                <div class="input-group mb-3">
															                    <label for="inputsubject" class="title">전화번호</label>
															                    <input type="text" class="form-control mt-1" id="tel" name="tel" value="${list.tel }">
															                </div>
															                <div class="input-group mb-3">
															                    <label for="inputsubject" class="title">운영시간</label>
															                    <input type="time" class="form-control mt-1" id="open_time" name="open_time" value="${time[0] }">
															                    <span style="padding: 1% 1%;">~</span>
															                    <input type="time" class="form-control mt-1" id="end_time" name="end_time" value="${time[1] }">
															                </div>
														                </div>
														            	<div class="input-group mb-3 storeImg">
														                	<img src="${file_repo }${list.img}" id="imgTag${list.no }" style="height: 80%; width: 80%;">
														                	<input type="file" name="img" id="img" onchange="loadFile(this, ${list.no })" style="width: 80%;">
														                </div>
													                </div>
													                <div class="row">
													                    <div class="col text-center mt-2">
													                    	<input type="hidden" value="${list.no }" name="store_no">
													                    	<input type="hidden" value="${list.name }" name="name">
													                        <button type="button" class="btn btn-washboot btn-lg px-3" onclick="validate(${list.no })">수정하기</button>
													                    </div>
													                </div>
													            </form>
											                </div>
										                </td>  
			                                        </tr>
				                            	</c:forEach>
			                            	</c:when>
		                            	</c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
			</div>
		</div>
	</div>
	<%@ include file="./common/footer.jsp" %>
</body>
</html>

<script>  
	$(document).ready(function() {
		var message = "${msg}";
		if (message == 4) {
			alert("오류로 지점 정보 수정에 실패하였습니다.");
			location.href="${path }/admin/store/storeList";
		} else if (message == 888) {
			alert("지점정보가 수정되었습니다.");
			location.href="${path }/admin/store/storeList";
		}
	});

	$(function(){
		var article = (".store .store-show");
		
		$(".store .item .store-update").click(function() {  
			var myArticle =$(this).parents().next("tr");  
			if($(myArticle).hasClass('store-hide')) {
				$(article).removeClass('store-show').addClass('store-hide');  
				$(myArticle).removeClass('store-hide').addClass('store-show');  
			} else {  
				$(myArticle).addClass('store-hide').removeClass('store-show');  
			}  
		});  
	});
	
	function store_delete(no, name) {
		if(confirm(name + "을 삭제하시겠습니까?")) {
			$.ajax({
				type:"post",
				enctype:"multipart/form-data",
				url:"${path}/admin/store/deleteStore",
				dataType:"text",
				data: {store_no : no},
				success:function (data){
					alert(name + "에 대한 정보를 삭제했습니다");
					document.location.reload();
				},
				error:function(request, error){
					alert("에러가 발생했습니다.");
					console.log("code : " + request.status + "\n" + "message : " + request.responseText +"\n" + "error : " + error	);
				}
			});
		} else {
			return;
		}
	}
	
	function validate(no) {
		if($("#address").val().length==0) {
			alert("주소를 입력해주세요");
			return;
		} else if($("#sites").val().length==0) {
			alert("세차가능구역를 입력해주세요");
			return;
		} else if($("#tel").val().length==0) {
			alert("전화번호를 입력해주세요");
			return;
		} else if($("#open_time").val().length==0) {
			alert("오픈시간을 입력해주세요");
			return;
		} else if($("#end_time").val().length==0) {
			alert("마감시간을 입력해주세요");
			return;
		} else {
			update(no);
		}
	}

	function update(no) {
		var storeForm = $("#storeForm" + no);
		storeForm.attr("action", "updateStore");
		storeForm.submit(	);
	}

	function loadFile(input, no) {
		var file = input.files[0];
		$('#imgTag' + no).attr("src", URL.createObjectURL(file));
	}
</script> 

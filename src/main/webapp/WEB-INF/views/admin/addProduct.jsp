<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
    <title>상품등록</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
	    $(document).ready(function() {
	        var message = "${msg}";
	        if (message == 4) {
	        	alert("오류로 상품 등록에 실패하였습니다.");
	        }else if (message == 888) {
	        	alert("상품이 등록되었습니다.");
	            location.href="${path }/admin/productList";
	        }
	    });
    </script>
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
		                    <h6 class="m-0 font-weight-bold text-washboot">상품등록</h6>
		                </div>
		                <div class="card-body pl-5">
							<form class="col-md-8" method="post" id="productForm" action="addProduct" enctype="multipart/form-data">
				            	<div class="input-group mb-3">
					                <label for="inputsubject" class="title">상품 사진</label>
					                <div id="imgTag" style="height: 100px; width: 100px; display:none; margin-right:2%"></div>
				                    <input type="file" class="form-control mt-1" id="file" name="file" onchange="loadFile(this)">
				                </div>
				            	<div class="input-group mb-3">
					                <label for="inputsubject" class="title">상품 코드</label>
				                    <input type="text" class="form-control mt-1" id="product_id" name="product_id">
				                </div>
				                <div class="input-group mb-3">
				                    <label for="inputname" class="title">상품명</label>
				                    <input type="text" class="form-control mt-1" id="name" name="name">
				                </div>
				                <div class="input-group mb-3">
				                    <label for="inputemail" class="title">수량</label>
				                    <input type="text" class="form-control mt-1" id="amount" name="amount">
				                </div>
				                <div class="input-group mb-3">
				                    <label for="inputsubject" class="title">가격</label>
				                    <input type="text" class="form-control mt-1" id="price" name="price">
				                </div>
				                <div class="row">
				                    <div class="col text-center mt-2">
				                        <button type="button" class="btn btn-washboot btn-lg px-3" id="add">상품등록</button>
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
	<%@ include file="./common/footer.jsp" %>
</body>
</html>

<script>
	function loadFile(input) {
		var file = input.files[0];
		$('#imgTag').show();
		$('#imgTag').html("<img src='"+URL.createObjectURL(file)+"' style='max-height:100px; max-width:100px;'/>");
	}
	
	$(document).on('click', '#add' , function() {
		if(!$("#file").val()) {
			alert("상품사진을 선택해주세요.");
	   		return;
		} else if($("#product_id").val().length == 0){
	   		alert("상품코드를 입력하세요.");
	   		return;
	   	} else if($("#name").val().length == 0) {
	   		alert("상품명를 입력하세요.");
	   		return;
	   	} else if($("#amount").val().length == 0){
	   		alert("수량을 입력하세요.");
	   		return;
	   	} else if($("#price").val().length == 0) {
	   		alert("가격을 입력하세요.");
	   		return;
	   	} else {
			document.getElementById("productForm").submit();
	   	}
	});
	
</script>
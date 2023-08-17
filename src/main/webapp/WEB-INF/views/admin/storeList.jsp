<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
    <title>지점리스트</title>
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
                                    <tbody>
                                   		<c:choose>
	                                    	<c:when test="${empty washList }">
	                                    		<tr>
		                                    		<td colspan="5" style="text-align:center;">등록된 세차장이 없습니다.</td>
	                                    		</tr>
	                                    	</c:when>
	                                    	<c:when test="${!empty washList }">
			                            		<c:forEach var="list" items="${washList }">
			                                        <tr class="item">
			                                            <td>${list.name }</td>
			                                            <td>${list.address }</td>
			                                            <td>${list.sites }</td>
			                                            <td>${list.tel }</td>
			                                            <td>${list.time }</td>
			                                            <td class="update">수정</td>
			                                            <td>삭제</td>
			                                        </tr>
			                                        <tr class="hide">
			                                        	<td colspan="7">  
										                    <div class="card-body pl-5">
																<form method="post" id="${list.no }" action="addStore" enctype="multipart/form-data">
													            	<div style="display:grid; grid-template-columns : 2fr 1fr;">
														                <div>
															            	<div class="input-group mb-3">
																                <label for="inputsubject" class="title">지점명</label>
															                    <input type="text" class="form-control mt-1" id="name" name="name" value="${list.name }">
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
															                    <input type="time" class="form-control mt-1" id="open_time" name="open_time" pattern="[0-2][0-9]:[0-5][0-9]">
															                    <span style="padding: 1% 1%;">~</span>
															                    <input type="time" class="form-control mt-1" id="end_time" name="end_time" pattern="[0-2][0-9]:[0-5][0-9]">
															                </div>
														                </div>
														            	<div class="input-group mb-3">
														                	<img src="${file_repo }${list.img}" style="height: 80%; width: 80%; margin:0 auto">
														                </div>
													                </div>
													                <div class="row">
													                    <div class="col text-center mt-2">
													                        <button type="button" class="btn btn-washboot btn-lg px-3" id="${list.no }" onclick="update(${list.no})">수정하기</button>
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

<style>
	body {
		font-family : Nunito !important;
	}
	.show {
		display : table-row;
	}
	.hide {
		display : none;
	}
	.update{
		cursor:pointer;
	}
</style>

<script>  
	$(function(){  
	    var article = (".recruit .show");  
	    $(".store .item .update").click(function() {  
	        var myArticle =$(this).parents().next("tr");  
	        if($(myArticle).hasClass('hide')) {  
	            $(article).removeClass('show').addClass('hide');  
	            $(myArticle).removeClass('hide').addClass('show');  
	        }  
	        else {  
	            $(myArticle).addClass('hide').removeClass('show');  
	        }  
	    });  
	});
	
	function update(no) {
		alert(no);
	}
</script> 


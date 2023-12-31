<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
    <title>회원리스트</title>
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
                            <h6 class="m-0 font-weight-bold text-washboot">회원리스트</h6>
                        </div>
                        <div class="card-body">
                        	<div class="flex-sm-fill searchG" style="margin-bottom:2%;width:35%;">
								<div style="margin-right:10px;">
									<select class="form-control" id="searchCon" name="searchCon" style="height:40px;">
										<option value="0">검색조건</option>
										<option value="id" <c:if test="${searchCon eq 'id'}">selected</c:if>>아이디</option>
										<option value="name" <c:if test="${searchCon eq 'name'}">selected</c:if>>이름</option>
										<option value="addr" <c:if test="${searchCon eq 'addr'}">selected</c:if>>주소</option>
									</select>
								</div>
								<div class="input-group">
									<input type="text" class="form-control" id="inputMobileSearch" placeholder="Search" name="search" <c:if test="${search ne 'none'}"> value="${search }"</c:if>>
									<div class="input-group-text" id="search" style="cursor:pointer;">
										<i class="fa fa-fw fa-search"></i>
									</div>
								</div>
							</div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>
	                                            <select id="E_YN" name="E_YN" style="padding:0;border:none;color: #858796;font-weight: bolder;">
													<option value="0">Email_YN</option>
													<option value="Y" <c:if test="${E_YN eq Y}">selected</c:if>>Email_Y</option>
													<option value="N" <c:if test="${E_YN eq N}">selected</c:if>>Email_N</option>
												</select>
                                            </th>
                                            <th>Address</th>
                                            <th>Point</th>
                                            <th>탈퇴</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>Email_YN</th>
                                            <th>Address</th>
                                            <th>Point</th>
                                            <th>탈퇴</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:choose>
	                                    	<c:when test="${empty users }">
	                                    		<tr>
		                                    		<td colspan="5" style="text-align:center;">등록된 회원이 없습니다.</td>
	                                    		</tr>
	                                    	</c:when>
	                                    	<c:when test="${!empty users }">
			                            		<c:forEach var="list" items="${users }">
			                            		<c:set var="address" value="${fn:split(list.address,'/')}" />
			                                        <tr>
			                                            <td>${list.id }</td>
			                                            <td>${list.mem_name }</td>
			                                            <td>${list.tel }</td>
			                                            <td>${list.email }</td>
			                                            <td width="5%">${list.email_yn }</td>
			                                            <td>${address[0]} ${address[1]} ${address[2]}</td>
			                                            <td align="right" width="5%"><fmt:formatNumber value="${list.point }" pattern="#,###" /></td>
			                                            <td onclick="user_delete('${list.id}')" style="cursor:pointer; text-decoration:underline;">탈퇴</td>
			                                        </tr>
				                            	</c:forEach>
			                            	</c:when>
                                    	</c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="row">
							<ul class="pagination pagination-lg justify-content-center">
								<c:set var="current" value="${page }"/>
								<c:forEach var="page" begin="1" end="${pages }" step="1">
									<li class="page-item">
										<a class='page-link rounded-0 mr-3 border-top-0 border-left-0 <c:if test="${page eq current}">disabled</c:if>' onclick="page(${page});">${page}</a>
									</li>
								</c:forEach>
							</ul>
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
	.row {
		justify-content: center;
	}
</style>
<script>
	function user_delete(id) {
		alert(id);
		if(confirm(id + "님을 탈퇴처리하시겠습니까?")) {
			$.ajax({
				type:"post",
				enctype:"multipart/form-data",
				url:"${path}/admin/deleteUser",
				dataType:"text",
				data: {user_id : id},
				success:function (data){
					if(data=='delete') {
						alert(id + "님의 탈퇴처리가 완료되었습니다.");
						document.location.reload();
					} else if(data=='fail') {
						alert("오류로 탈퇴처리에 실패했습니다");
					}
				},
				error:function(request, error){
					console.log("code : " + request.status + "\n" + "message : " + request.responseText +"\n" + "error : " + error	);
				}
			});
		} else {
			return;
		}
	}
	
	$(document).on('click', '#search', function search() {
		var E_YN = $("#E_YN").val();
		var searchCon = $("#searchCon").val();
		var search = $("#inputMobileSearch").val();
		var path = "${path}/admin/userList?search="+search + "&searchCon=" + searchCon;
		
		if(E_YN != 0) {
			path += "&E_YN=" + E_YN;
		}
		
		location.href=path;
	});
	
	$(document).on('change', '#E_YN', function() {
		var E_YN = $("#E_YN").val();
		var searchCon = $("#searchCon").val();
		var search = $("#inputMobileSearch").val();
		
		var path = "${path}/admin/userList?E_YN=" + E_YN;
		if(search.length > 0) {
			path += "&search=" + search + "&searchCon=" + searchCon;
		}
		location.href=path;
	});
	
	function page(page) {
		var E_YN = $("#E_YN").val();
		var searchCon = $("#searchCon").val();
		var search = $("#inputMobileSearch").val();
		
		var path = "${path}/admin/userList?page=" + page;
		if(search.length > 0) {
			path += "&search=" + search + "&searchCon=" + searchCon;
		}
		if(E_YN != 0) {
			path += "&E_YN=" + E_YN;
		}
		location.href=path;
	}
</script>
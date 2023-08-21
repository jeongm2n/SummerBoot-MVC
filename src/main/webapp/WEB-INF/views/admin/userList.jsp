<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
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
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>Point</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>Point</th>
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
			                                            <td>${address[0]} ${address[1]} ${address[2]}</td>
			                                            <td>${list.point }</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
    <title>지점리스트</title>
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
                            <h6 class="m-0 font-weight-bold text-washboot">지점리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>지점</th>
                                            <th>주소</th>
                                            <th>세차구역</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>지점</th>
                                            <th>주소</th>
                                            <th>세차구역</th>
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
			                                            <td >수정</td>
			                                            <td>삭제</td>
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
</style>
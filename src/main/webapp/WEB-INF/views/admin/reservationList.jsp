<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./common/head.jsp"%>
<title>예약 관리 페이지</title>
</head>
<body id="page-top">

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
                            <h6 class="m-0 font-weight-bold text-washboot">예약리스트</h6>
                        </div>
	                    <div class="card-body">
	                    	<div class="table-responsive">
	                            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
	                            <thead>
	                            <tr><th>예약자 ID</th><th>예약날짜</th><th>세차구역</th><th>예약시간</th><th>사용시간</th><th></th></tr>
	                            </thead>
	                            <tbody>
	                            <c:choose>
		                            <c:when test="${empty resList }">
		                            	<tr><td colspan=6>예약 정보가 없습니다.</td></tr>
		                            </c:when>
		                            <c:when test="${!empty resList }">
		                            <c:forEach var="data" items="${resList }">
		                            	<tr>
		                            		<td>${data.member_id }</td><td>${data.res_date }</td><td>${data.site }</td>
		                            		<td>${data.startTime }</td><td>${data.useTime }</td>
		                            		<th>삭제</th>
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
			</div>
        </div>
	</div>
</body>
</html>
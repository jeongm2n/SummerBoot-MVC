<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

    <head>
        <meta charset="UTF-8">
        <title>wash_review</title>

        <link rel="stylesheet" href="${path}/resources/assets/css/custom_ryu.css">
        <jsp:include page="/WEB-INF/views/common.jsp" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </head>
    <body style="padding: 1.5rem;">
        <div class="card text-center">
            <div class="card-header">
                <h4 style="margin:0">세차장 리뷰</h4>
            </div>
            <div class="rvForm">
                <table class="table" style="padding: 20px;">
                    <thead style="position:sticky;top:0;background:white;">
                        <tr style="text-align: left">
                            <th style="width: 150px;">별점</th>
                            <th style="width: 150px;">아이디</th>
                            <th>내용</th>
                            <th>작성날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
	                    	<c:when test="${empty list}">
		                        <tr>
		                            <td colspan=4 style="text-align:center;">등록된 리뷰가 없습니다</td>
		                        </tr>
	                    	</c:when>
                    	<c:when test="${!empty list}">
                    	<c:forEach var="list" items="${list }">
	                        <tr>
	                            <td id="reviewStar">
	                            	<c:forEach begin="1" end="${list.point }" step="1">
		                            	<i class="text-warning fa fa-star"></i>
	                            	</c:forEach>
	                            </td>
	                            <td>${list.member_id }</td>
	                            <td id="reviewText">${list.contents}</td>
	                            <td>${list.date}</td>
	                        </tr>
                    	</c:forEach>
                    	</c:when>
                    	</c:choose>
                    </tbody>
                </table>
            </div>
        </div>

    </body>

<style>
	table, h4 {font-family: 'IBM Plex Sans KR', sans-serif;	}
</style>
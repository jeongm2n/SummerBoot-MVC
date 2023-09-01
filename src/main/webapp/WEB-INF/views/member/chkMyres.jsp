<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common.jsp"%>
<meta charset="UTF-8">
<title>나의 예약정보</title>
<%@ include file="../common/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/assets/css/custom_seo.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="container" style="margin-bottom:30px">
	<div class="card">
	<h1>나의 예약현황</h1>
		<div class="card">사용 전
			<div class="card-body beforediv" style="text-align:center">
			<table>
				<tr><th class="table-hover">예약번호</th><th>지점명</th><th>예약날짜</th><th>선택자리</th><th>예약시간</th></tr>
				<tbody class="restbody">
					<c:forEach var="data" items="${beforeres }">
					<tr><td>${data.order_num }</td><td>${data.shop }</td><td>${data.res_date }</td><td>${data.site }</td>
					<td>${data.startTime } ~ ${data.endTime }</td></tr>
					</c:forEach>
				</tbody></table>
			</div>
		</div>
		
		<div class="card">사용 완료
			<div class="card-body afterdiv" style="text-align:center">
			<table>
				<tr><th>예약번호</th><th>지점명</th><th>예약날짜</th><th>선택자리</th><th>예약시간</th></tr>
				<tbody class="restbody">
					<c:forEach var="data" items="${afterres }">
					<tr><td>${data.order_num }</td><td>${data.shop }</td><td>${data.res_date }</td><td>${data.site }</td>
					<td>${data.startTime } ~ ${data.endTime }</td></tr>
					</c:forEach>
				</tbody></table>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
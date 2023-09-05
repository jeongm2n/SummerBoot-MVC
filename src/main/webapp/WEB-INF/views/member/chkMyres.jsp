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
	<script>
		function showQR(qrCode){
			var url = "${path}/file/showqr?qrCode="+qrCode;
			var status = "width=400,height=400,top=100,left=200,location=no,scrollbars=no";
			window.open(url,qrCode,status)
		}
	</script>
</head>
<body>
<div class="container" style="margin-bottom:30px">
	<div class="card">
	<h1 style="color:#FD8008"><b>나의 예약현황</b></h1>
		<div class="card"><b style="color:#FD8008">사용 전</b>
			<div class="beforediv" style="text-align:center">
			<table class="table restable">
				<tr><th>예약번호</th><th>지점명</th><th>예약날짜</th><th>선택자리</th><th>예약시간</th></tr>
				<tbody>
					<c:forEach var="data" items="${beforeres }">
					<tr class="restr"><td class="restd" onclick="showQR('${data.qr_img}')">${data.order_num }</td><td>${data.shop }</td><td>${data.res_date }</td><td>${data.site }</td>
					<td>${data.startTime } ~ ${data.endTime }</td></tr>
					</c:forEach>
				</tbody></table>
			</div>
		</div>
		
		<div class="card"><b style="color:#FD8008">사용 완료</b>
			<div class="afterdiv" style="text-align:center">
			<table class="table restable">
				<tr><th>예약번호</th><th>지점명</th><th>예약날짜</th><th>선택자리</th><th>예약시간</th></tr>
				<tbody>
					<c:forEach var="data" items="${afterres }">
					<tr class="restr"><td>${data.order_num }</td><td>${data.shop }</td><td>${data.res_date }</td><td>${data.site }</td>
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
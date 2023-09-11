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
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
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
	<div class="container" style="margin-bottom:7em;margin-top:10%;">
		<div class="bg">
			<div class="myresdiv">
				<h1>📆나의 예약현황</h1>
				<div class="card cutcard" style="padding-bottom: 1.5%;box-shadow: 2px 3px 6px 0px #B9B4C7;">
					<div class="beforediv" style="text-align:center;">
						<div>
							<h3>📍사용 전</h3>
						</div>
						<div class="beforeTb">
							<table class="table restable">
								<thead style="position:sticky;top:0;background:white;border-top:2px solid black;">
									<tr><th>예약번호</th><th>지점명</th><th>예약날짜</th><th>선택자리</th><th>예약시간</th></tr>
								</thead>
								<tbody>
									<c:forEach var="data" items="${beforeres }">
										<tr class="restr"><td class="restd" onclick="showQR('${data.qr_img}')" style="cursor:pointer;">${data.order_num }</td><td>${data.shop }</td><td>${data.res_date }</td><td>${data.site }</td>
										<td>${data.startTime } ~ ${data.endTime }</td></tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="myresdiv" style="margin-top:6em;">
				<div class="card cutcard" style="padding-bottom: 1.5%;box-shadow: 2px 3px 6px 0px #B9B4C7;">
					<div class="afterdiv">
						<div>
							<h3>📍사용 완료</h3>
						</div>
						<div class="afterTb">
							<table class="table restable" style="text-align:center;">
								<thead style="position:sticky;top:0;background:white;border-top:2px solid black;">
									<tr><th>예약번호</th><th>지점명</th><th>예약날짜</th><th>선택자리</th><th>예약시간</th><th>리뷰</th></tr>
								</thead>
								<tbody>
									<c:forEach var="data" items="${afterres }" varStatus="i">
										<tr class="restr">
											<td>${data.order_num }</td><td>${data.shop }</td><td>${data.res_date }</td><td>${data.site }</td>
											<td>${data.startTime } ~ ${data.endTime }</td><td id="review">리뷰작성</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>

<style>
	table{
		font-family: 'IBM Plex Sans KR', sans-serif;
		border-collapse: separate;
		border-spacing: 0;
	}
	tbody, td, tfoot, th, thead, tr{border-width:inherit;}
	th, td {
		background-color:transparent;
		cursor: default;
	}
	h1, h3 {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 2.5em;
		font-weight: 600 !important;
	}
	h1{text-align:center;}
	h3 {
	    margin-top: 1%;
		font-size: 1.5em;
		font-weight: 600 !important;
		text-align:left;
		padding-left:1%;
	}
	#review{cursor:pointer;}
</style>
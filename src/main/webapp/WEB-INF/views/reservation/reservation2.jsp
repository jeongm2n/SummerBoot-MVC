<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ page import="java.util.List" %>
<%
 	String shopName = (String)request.getParameter("shopName");
%> 
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
   	<%@ include file="../common/header.jsp" %>
    <link rel="stylesheet" href="../resources/assets/css/custom_seo.css">
	<title>자리선택</title>
	<script>
		function goRes_pay(site){
			location.href="${path}/pay/reservation_pay/${no},${date},${startTime},${useTime},"+site+",${endTime}";
		}
	</script>
</head>
<body>
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  -->
	<section class="container py-5" style="margin-top:10%;">
		<div id="wrapper" style="text-align:center;">
		<!-- 	패딩 제거 패딩으로 가운데 맞추기보단 align을 사용하시는게 좋아요! 위에 text-align 속성이 있고 아래 div 엔 inline-block이 있어 자동으로 가운데 정렬이 되요! -->
			<div class="border border-4 div-margin">
		    	<table class="table table-borderless" style="margin-bottom:0;">
		    	<tr><th>지점명</th><th>선택날짜</th><th>예약시간</th><th>이용시간</th></tr>
		    	<tr><td><%=shopName %></td><td>${date}</td><td>${startTime} ~ ${endTime}</td><td>${useTime}</td></tr>
		    	</table>
		    </div>
		    
			<div style="margin-top:3%"> <!-- padding-left:100px;padding-right:100px; -->
				<div style="width:100%;display:inline-block;margin-bottom:1%;">
					<img class="float-end" id="ableImg" src="${path}/resources/assets/img/legend2.png">
				</div>
		<!-- 		div안에 무엇을 넣을땐 꼭 div 크기가 안에 들어가는것보다 크게! 안그러면 튀어나가버려요! height를 44px로! -->
				<div style="display:grid;">
					<div style="display:flex;">
						<div style="border-left:10px solid #D8D9DA;width: 10em;margin: 0 auto;"></div>
						<c:forEach var="site" items="${sites }" begin="1" end="4" varStatus="status">
							<div class="carSeat">
								<c:if test="${site==0}">
									<img src="${path}/resources/assets/img/car_white.png" style="width: 8em;" onclick="goRes_pay(${status.index})">
								</c:if>
								<c:if test="${site==1}">
									<img src="${path}/resources/assets/img/car_orange.png" style="width: 8em;">
								</c:if>
								<h4 style="margin-bottom:2rem;">SEAT ${status.index }</h4>
							</div>
						</c:forEach>
					</div>
					<div style="height:8em;"><h2 style="text-align:left;width:1em;font-family: 'Jua', sans-serif;margin: 1em 0.3em;">입구</h2></div>
					<div style="display:flex;">
						<div style="border-left:10px solid #D8D9DA;width: 10em;margin: 0 auto;"></div>
						<c:forEach var="site" items="${sites }" begin="5" end="8" varStatus="status">
							<div class="carSeat">
								<c:if test="${site==0}">
									<img src="${path}/resources/assets/img/car_white.png" style="width: 8em;" onclick="goRes_pay(${status.index})">
								</c:if>
								<c:if test="${site==1}">
									<img src="${path}/resources/assets/img/car_orange.png" style="width: 8em;">
								</c:if>
								<h4 style="margin-bottom:2rem;">SEAT ${status.index }</h4>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
		</div>
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>

<style>
	table {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 20px;
	}
	h3{
		 font-size:30pt;
		 margin:0;
	}
	#ableImg {
	    width: 6em;
		padding:0;
	}
	.div-height{height:20em;}
	
	@media (max-width: 1160px) {
		h3 {font-size:20pt;}
		.div-margin{width:80%;}
		.div-height{height:6em;}
	}
	@media (max-width: 750px) {
		h3 {font-size:15pt;}
		.div-margin{width:90%;}
		#ableImg {width:5em;}
	}
	@media (max-width: 576px) {
		.container, .container-sm {max-width: 80%;}
		table, h3, h2 {font-size:12pt;}
		.div-margin{width:100%;}
		.div-height{height:3em;}
		#ableImg {width:3em;}
	}
	.carSeat {
		width: 15em;
	    height: 18em;
	    padding: 3%;
        padding-top: 6%;
	    border: 1px solid #D8D9DA;
	}
</style>
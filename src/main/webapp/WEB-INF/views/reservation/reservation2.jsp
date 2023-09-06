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

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   	<%@ include file="../common/header.jsp" %>
    <link rel="stylesheet" href="../resources/assets/css/custom_seo.css">
	<title>자리선택</title>
	<script>
		function goRes_pay(site){
			location.href="${path}/pay/reservation_pay/${no},${date},${startTime},${useTime},"+site;
		}
	</script>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
	<section class="container py-5">
		<div id="wrapper" style="text-align:center;">
		<!-- 	패딩 제거 패딩으로 가운데 맞추기보단 align을 사용하시는게 좋아요! 위에 text-align 속성이 있고 아래 div 엔 inline-block이 있어 자동으로 가운데 정렬이 되요! -->
			<div class="border border-4 div-margin">
		    	<table class="table table-borderless" style="margin-bottom:0;">
		    	<tr><th>지점명</th><th>선택날짜</th><th>예약시간</th><th>이용시간</th></tr>
		    	<tr><td><%=shopName %></td><td>${date}</td><td>${startTime}</td><td>${useTime}</td></tr>
		    	</table>
		    </div>
		    
			<div style="margin-top:3%"> <!-- padding-left:100px;padding-right:100px; -->
				<div style="width:100%;display:inline-block;margin-bottom:1%;">
					<img class="float-end" id="ableImg" src="${path}/resources/assets/img/legend2.png">
				</div>
		<!-- 		우측 margin을 제거하지 않아 좌우 길이가 맞지 않았어요! margin-right 0px !important로 제거! -->
				<div class="row" style="margin-bottom:2%;align-items: center;">
					<div class="col-5"><img style="width:100%" src="${path}/resources/assets/img/Line.png"/></div>
					<div class="col-2" style="padding:0"><h3>Entrance</h3></div>
					<div class="col-5"><img style="width:100%;padding-right:0;" src="${path}/resources/assets/img/Line.png"/></div>
				</div>
		<!-- 		div안에 무엇을 넣을땐 꼭 div 크기가 안에 들어가는것보다 크게! 안그러면 튀어나가버려요! height를 44px로! -->
				<div style="display:grid;grid-template-columns:1fr 2fr 1fr;">
		<!-- 			왜 자꾸 모양이 이상해지나 했는데 padding때문이였던것같아요! padding을 제거하고 이미지들을 묶을 div 생성! 좌측 정렬! 혹시 이게 수직이 아니라 2줄로 늘어나고 막 그런걸 원하시라면 말해주세요! -->
					<!-- <div style="width:50%;height:100%;float:left">
					<div style="width:200px;height:100%;float:left"> -->
					<%-- <c:forEach var="site" items="${sites }" begin="1" end="4" varStatus="status">
						<div class="float-start" style="width:200px">
						<c:if test="${site==0}">
						<img src="${path}/resources/assets/img/car_white.png" style="width:14em" onclick="goRes_pay(${status.index})">site ${status.index }
						</c:if>
						<c:if test="${site==1}">
						<img src="${path}/resources/assets/img/car_orange.png" style="width:14em">site ${status.index }
						</c:if>
						</div>
					</c:forEach>
					<!-- </div>
					</div> -->
		<!-- 			얘도 동일하게 div하나 추가하고 padding 삭제! 개인적으로는 이미지 크기가 커서 특정 px아래로 가면 확 이미지 크기가 줄었으면 해요! <- 아거 원하시면 말해주세요! 금방해요!-->
					<!-- <div style="width:50%;height:100%;float:right;"> -->
						<c:forEach var="site" items="${sites }" begin="5" end="8" varStatus="status">
							<div style="width:200px">
							<c:if test="${site==0}">
							<img src="${path}/resources/assets/img/car_white.png" style="width:14em" onclick="goRes_pay(${status.index})">site ${status.index }
							</c:if>
							<c:if test="${site==1}">
							<img src="${path}/resources/assets/img/car_orange.png" style="width:14em">site ${status.index }
							</c:if>
							</div>
						</c:forEach> --%>
					<!-- </div> -->
					<div style="display:flex;flex-direction: column;">
						<c:forEach var="site" items="${sites }" begin="1" end="3" varStatus="status">
							<div>
								<c:if test="${site==0}">
									<img src="${path}/resources/assets/img/car_white.png" style="width:76%" onclick="goRes_pay(${status.index})">
								</c:if>
								<c:if test="${site==1}">
									<img src="${path}/resources/assets/img/car_orange.png" style="width:76%">
								</c:if>
								<h2 style="margin-bottom:2rem;">SEAT ${status.index }</h2>
							</div>
						</c:forEach>
					</div>
					<div style="display:flex;justify-content: space-evenly;align-items: flex-end;">
						<c:forEach var="site" items="${sites }" begin="4" end="5" varStatus="status">
							<div>
								<c:if test="${site==0}">
									<img src="${path}/resources/assets/img/car_white.png" style="width:76%" onclick="goRes_pay(${status.index})">
								</c:if>
								<c:if test="${site==1}">
									<img src="${path}/resources/assets/img/car_orange.png" style="width:76%">
								</c:if>
								<h2>SEAT ${status.index }</h2>
							</div>
						</c:forEach>
					</div>
					<div style="display:flex;flex-direction: column-reverse;">
						<div class="div-height"></div>
						<c:forEach var="site" items="${sites }" begin="6" end="8" varStatus="status">
							<div>
								<c:if test="${site==0}">
									<img src="${path}/resources/assets/img/car_white.png" style="width:76%" onclick="goRes_pay(${status.index})">
								</c:if>
								<c:if test="${site==1}">
									<img src="${path}/resources/assets/img/car_orange.png" style="width:76%">
								</c:if>
								<h2 style="margin-bottom:2rem;">SEAT ${status.index }</h2>
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
		font-size: 26px;
	}
	h3{
		 font-size:30pt;
		 margin:0;
	}
	#ableImg {
		width:12%;
		padding:0;
	}
	.div-height{height:10em;}
	
	@media (max-width: 1160px) {
		h3 {font-size:20pt;}
		.div-margin{width:80%;}
		.div-height{height:6em;}
	}
	@media (max-width: 750px) {
		h3 {font-size:15pt;}
		.div-margin{width:90%;}
		#ableImg {width:15%;}
	}
	@media (max-width: 576px) {
		.container, .container-sm {max-width: 80%;}
		table, h3, h2 {font-size:12pt;}
		.div-margin{width:100%;}
		.div-height{height:3em;}
		#ableImg {width:18%;}
	}
</style>
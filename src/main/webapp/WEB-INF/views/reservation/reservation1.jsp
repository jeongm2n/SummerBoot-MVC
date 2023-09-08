<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common.jsp"%>
<title>Wash Boot</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%--jQuery js --%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/assets/css/custom_seo.css">
<%
	int no = Integer.parseInt(request.getParameter("no"));
%>
<script>
	// 지점선택 시 아래에 선택한 지점이 뜨도록 
	const shops = [ '양평로점', '경인로점', '천왕점', '가제1동점', '강동성안점', '성동마장점', '성북종암점', '은평갈현점', '관악봉천점', '용문점' ];
	clickedMD = '${today}';
	selectedHM = '${resTime}';
	
	$(document).ready(function() {
		
		$("input:radio[name='p_options']").click(function() {
			a = $("input[name='p_options']:checked").val();
			
			var btn = document.getElementById('btn-time');
			
			timeHour();
			minuteContainer.innerHTML='';
			
			if(selectedHM != 'null'){ //당일 예약현황에서 예약페이지1로 왔다면 + 사용시간을 바꿀떄마다 종료 시간을 새로 계산.
				var temp = new Date('2023-'+clickedMD+'T'+selectedHM+':00');
				temp = new Date(temp.getTime() + a * 60000);
				
				const tempH = temp.getHours() >= 10 ? temp.getHours() : '0' + temp.getHours();
				const tempM = temp.getMinutes();
				endtime = tempH + ":" + tempM;
					
				document.getElementById("btn-time").value = selectedHM;
				btn.innerHTML = selectedHM + " ~ " + endtime;
			}
		});
		
		shopName = shops[<%=no %>-1];
		var btn = document.getElementById('btn-shop');
		btn.innerHTML = shopName;
	});
	
	//Next>버튼 클릭 시 예약페이지2로 이동
    function goReservation2(){
    	if(clickedMD==null || selectedHM==null ||shopName==null){
    		alert("날짜, 시간을 확인해주세요");
    		return false;
    	}else{
    		window.location.href = "./reservation2?shopName="+shopName+"&no="+<%=no %>+
    				"&date="+clickedMD+"&startTime="+selectedHM+"&useTime="+a+"&endTime="+endtime;
    		//reservation2로 지점 이름, 세차장 고유번호, 선택날짜, 선택한 시작시간, 사용시간에 대한 정보를 넘김
    		return true;
    	}
    }
</script>

<script>
    var weather = [
        <c:forEach items="${weathers}" var="data" varStatus="loop">
            {
                date: "${data.date}",
                ampop: "${data.ampop}",
                pmpop: "${data.pmpop}",
                tmx: "${data.tmx}",
                tmn: "${data.tmn}"
            }<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    console.log(weather);
</script>

</head>

<body>
	<section class="container py-5">
		<div id="wrapper">
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
				crossorigin="anonymous"></script>
			
			<h1 style="margin:2%;font-family: 'Jua', sans-serif;font-size:50px;"><img src="${path}/resources/assets/img/weather.png" style="margin-right:10px;">주간날씨</h1>
			<div class="weatherdiv table-responsive">
				<table id="weather" class="weathertb" style="border:1px solid #B9B4C7;">
				</table>
			</div>
			
			<div id="calTime">
				<div>
					<div class="border">
						<div style="margin-top:2%;">
							<img src="${path}/resources/assets/img/alert.png" style="margin-right:10px;">
							<b style="color: #FF9B50">달력은 현재 달에서 +1달 까지만 조회하실 수 있습니다.</b>
						</div>
						<table class="calendartb" id="calendar" style="height:30em;">
							<thead style="border-bottom: 1px solid #B9B4C7;">
								<tr>
									<td class="thead" align="center"><label onclick="prevMonth()"> ◀ </label></td>
									<td class="thead" colspan="5" align="center"><h4 id="calendarTitle" style="margin:0;font-weight:600;"></h4></td>
									<td class="thead" align="center"><label onclick="nextMonth()"> ▶ </label></td>
								</tr>
								<tr>
									<td class="thead sunday-td">일</td>
									<td class="thead">월</td>
									<td class="thead">화</td>
									<td class="thead">수</td>
									<td class="thead">목</td>
									<td class="thead">금</td>
									<td class="thead saturday-td">토</td>
								</tr>
							<thead>
						</table>
					</div>
				</div>
		
				<div id="res-time" style="padding:1% 2%;">
					<div class="p_time" style="text-align: center;margin-bottom:5%;">
						<img src="${path}/resources/assets/img/alert.png" style="margin-right:5px;width:20px;">
						<b style="color: #FF9B50;font-size:10pt">세차 시간은 입/출차 시간을 고려하여 1분정도 일찍 마무리해주시기 바랍니다.</b>
						<h4 style="font-family: 'Jua', sans-serif;font-size: 40px;">사용시간<img src="${path}/resources/assets/img/time2.png" style="height:40px;"></h4>
						<div class="line"></div>
						<div>
							<span class="span-time">
								<input type="radio" class="btn-check" name="p_options" id="30M" value=29 autocomplete="off" checked>
								<label class="btn btn-h" for="30M" style="width:60%;">30M</label>
							</span>
							<span class="span-time">
								<input type="radio" class="btn-check" name="p_options" id="60M" value=59 autocomplete="off">
								<label class="btn btn-h" for="60M" style="width:60%;">1H</label>
							</span>
							<span class="span-time">
								<input type="radio" class="btn-check" name="p_options" id="90M" value=89 autocomplete="off">
								<label class="btn btn-h" for="90M" style="width:60%;">1H30M</label>
							</span>
							<span class="span-time">
								<input type="radio" class="btn-check" name="p_options" id="120M" value=119 autocomplete="off">
								<label class="btn btn-h" for="120M" style="width:60%;">2H</label>
							</span>
						</div>
					</div>
					
					<div style="text-align: center;margin-bottom:5%;">
						<legend><h4 style="font-family: 'Jua', sans-serif;font-size: 40px;">시간</h4></legend>
						<div class="line"></div>
						<div id="container1" style="width: 100%; text-align: center;"></div>
					</div>
					<div style="text-align: center;margin-bottom:5%;">
						<legend><h4 style="font-family: 'Jua', sans-serif;font-size: 40px;">분</h4></legend>
						<div class="line"></div>
						<div id="container2" style="width: 100%;"></div>
					</div>
				</div>
			</div>
			<div style="display:inline-flex;align-items:center;float:right;margin-top:1%;">
				<h5 id="btn-shop" class="reser"></h5>
				<h5 id="btn-date" class="reser">${today }</h5>
				<h5 id="btn-time" class="reser">
				<c:if test="${resTime eq 'null'}"></c:if>
				<c:if test="${resTime ne 'null'}">${resTime }</c:if></h5>
				<button type="button" class="orange-button" onclick="return goReservation2();">NEXT ></button>
			</div>
		</div>
	</section>
	<%@ include file="../common/footer.jsp"%>

	<%--script 따로 빼놓은 파일 연동 --%>
	<script src="../resources/assets/js/reservation1.js"></script>
</body>
</html>

<style>
	.btn-hour {
		width:60%;
		border:1px solid #FD8008;
		padding:0;
	}
	
	.btn-check:checked+.btn, .btn.active {
		background: #FD8008;
	    border-color: #FD8008;
	}
	
	.btn-check+.btn:hover {
		background-color : #FFDAB9;
	}
	
	.line {
		background : linear-gradient(to right, #ffe6b3 0%,#ff8b1f 100%);
		padding : 0 3%;
		width:90%;
		margin:0 auto;
		margin-bottom : 2%;
		height:2px;
	}
	
	#calTime {
	 	display:grid;
	 	grid-template-columns: 1fr 1fr;
	 	margin-top:5%;
	 	height:630px;
 	}
 	
 	@media (max-width: 992px) {
 		#calTime {grid-template-columns: 1fr;height:100%;}
 		#res-time {margin-top:5%;}
	}
	
	.reser{
		 margin: 0 15px;
		 font-family: 'IBM Plex Sans KR', sans-serif;
		 font-size:25px !important;
	}
	
	table {
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	
	#calBody {
		font-size: 24px;
		font-weight:400;
	}
</style>

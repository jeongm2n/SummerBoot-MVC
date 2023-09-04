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
	
	$(document).ready(function() {
		$('label[for="30"]').click(function() {
			$('#m_30').prop('checked', true);
			$('#30').prop('checked', true);
		});
		$('label[for="100"]').click(function() {
			$('#m_100').prop('checked', true);
			$('#100').prop('checked', true);
		});
		$('label[for="130"]').click(function() {
			$('#m_130').prop('checked', true);
			$('#130').prop('checked', true);
		});
		$('label[for="200"]').click(function() {
			$('#m_200').prop('checked', true);
			$('#200').prop('checked', true);
		});
		
		$("input:radio[name='p_options']").click(function() {
			a = $("input[name='p_options']:checked").val();
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
    		window.location.href = "./reservation2?shopName="+shopName+"&no="+<%=no %>+"&date="+clickedMD+"&startTime="+selectedHM+"&useTime="+a;
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
		<div id="wrapper" class="row">
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
				crossorigin="anonymous"></script>
	
			<div class="col-lg-3">
			</div>
			<!--     	이 부분도 위에 지점선택처럼 바꾸고 싶었으나 그건 너무 많이 만지는거 같아서 나중에 원하시면 말해주세요 제가 수정할께요! -->
			<div class="col-lg-8 p_time">
				<div class="border border-4 div2" style="text-align: center;">
	
					<span
						style="display: inline-block; width: 20%; line-height: 80px; float: left; vertical-align: middle">사용시간</span>
					<span
						style="display: inline-block; width: 80%; height: 80px; float: right">
						<span class="span-time"> <input type="radio"
							class="btn-check" name="p_options" id="30" value=29
							autocomplete="off" checked> <label
							class="btn btn-secondary" for="30">30M</label></span> <span
						class="span-time"> <input type="radio" class="btn-check"
							name="p_options" id="100" value=59 autocomplete="off"> <label
							class="btn btn-secondary" for="100">1H</label></span> <span
						class="span-time"> <input type="radio" class="btn-check"
							name="p_options" id="130" value=89 autocomplete="off"> <label
							class="btn btn-secondary" for="130">1H30M</label></span> <span
						class="span-time"> <input type="radio" class="btn-check"
							name="p_options" id="200" value=119 autocomplete="off"> <label
							class="btn btn-secondary" for="200">2H</label></span>
					</span>
				</div>
			</div>
	
			<div class="col-lg-8 m_time">
				<div class="col border border-4 div2">
					<div style="width: 100%; text-align: center;">
						<a class="title">사용 시간</a><br>
					</div>
					<div class="container text-center">
						<div class="row row-cols-2">
							<div class="col" style="padding-bottom: 10px">
								<input type="radio" class="btn-check" name="m_options" id="m_30"
									value=29 autocomplete="off" checked> <label
									class="btn btn-secondary shops" for="30">30M</label>
							</div>
							<div class="col" style="padding-bottom: 10px">
								<input type="radio" class="btn-check" name="m_options" id="m_100"
									value=59 autocomplete="off"> <label
									class="btn btn-secondary shops" for="100">1H</label>
							</div>
							<div class="col" style="padding-bottom: 10px">
								<input type="radio" class="btn-check" name="m_options" id="m_130"
									value=89 autocomplete="off"> <label
									class="btn btn-secondary shops" for="130">1H30M</label>
							</div>
							<div class="col" style="padding-bottom: 10px">
								<input type="radio" class="btn-check" name="m_options" id="m_200"
									value=119 autocomplete="off"> <label
									class="btn btn-secondary shops" for="200">2H</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-1">
			</div>
			
				<div class="border border-4 weatherdiv table-responsive">
					주간날씨
					<table id="weather" class="weathertb">
					</table>
				</div>
			
			<div class="col-lg-6" style="height: 450px">
				<div class="border border-4 div3" style="float:right;">
					<b style="color: #FFDAB9">달력은 현재 달에서 +1달 까지만 조회하실 수 있습니다.</b>
					<table class="calendartb" id="calendar">
						<thead style="border-bottom: 1px solid #000;">
							<tr>
								<td class="thead" align="center"><label
									onclick="prevMonth()"> ◀ </label></td>
								<td class="thead" colspan="5" align="center" id="calendarTitle"></td>
								<td class="thead" align="center"><label
									onclick="nextMonth()"> ▶ </label></td>
							</tr>
							<tr>
								<td class="thead"><font color="#F79DC2">일</font></td>
								<td class="thead">월</td>
								<td class="thead">화</td>
								<td class="thead">수</td>
								<td class="thead">목</td>
								<td class="thead">금</td>
								<td class="thead"><font color="skyblue">토</font></td>
							</tr>
						<thead>
					</table>
				</div>
			</div>
	
			<div class="col-lg-6" style="height: 450px">
				<div class="border border-4 div4"
					style="float: left; text-align: center">
					<legend>시간</legend>
					<div id="container1"
						style="width: 100%; height: 200px; text-align: center; margin-top: 30px">
					</div>
					<hr>
					<legend>분</legend>
					<div id="container2"
						style="margin-top: 10px; width: 100%; height: 100px"></div>
				</div>
				<div
					style="width: 400px; height: 50px; margin-top: 15px; float: right">
					<button id="btn-shop" class="orange-button btn-time" style="margin-right:5px" disabled></button>
					<button id="btn-date" class="orange-button btn-time" style="margin-right:5px" disabled></button>
					<button id="btn-time" class="orange-button btn-time" style="margin-right:5px" disabled></button>
					<button type="button" class="orange-button" onclick="return goReservation2();">Next></button>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../common/footer.jsp"%>

	<%--script 따로 빼놓은 파일 연동 --%>
	<script src="../resources/assets/js/reservation1.js"></script>
</body>
</html>
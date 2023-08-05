<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Wash Boot</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 	<%--jQuery js --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%@ include file="../common/header.jsp" %>
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_seo.css">
    <%-- 지점선택 시 아래에 선택한 지점이 뜨도록 --%>
    <script>
    $(document).ready(function(){
	    $("input:radio[name='shops']").click(function(){
	    	shopName = $("input[name='shops']:checked").val();
	    	var btn = document.getElementById('btn-shop');
	        btn.innerHTML = shopName; })	
	    });
    
    </script>
</head>

<body>
<div id="wrapper">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
    
    <div class="div-margin" style="height:800px;">
    <div style="text-align:center;height:100px">
    <%--나중에 지점 리스트 페이지에서 넘어오는 지점 정보가 있을때와 네비바의 예약을 눌러서 들어왔을 때 다르게 뜨도록 수정해야함!! --%>
    	<span class="border border-4" style="display:inline-block;width:35%;height:100px;float:left">지점 선택
    	<div class="container text-center">
    	<div class="row row-cols-2">
    	<div class="col"><input type="radio" class="btn-check shops" name="shops" id="shop1" value="서울본점" autocomplete="off" checked>
    	<label class="btn btn-secondary" for="shop1">서울&nbsp;본점</label></div>
    	<div class="col"><input type="radio" class="btn-check shops" name="shops" id="shop2" value="경기군포점" autocomplete="off">
    	<label class="btn btn-secondary" for="shop2">경기군포점</label></div>
    	<div class="col"><input type="radio" class="btn-check shops" name="shops" id="shop3" value="경기평택점" autocomplete="off">
    	<label class="btn btn-secondary" for="shop3">경기평택점</label></div>
    	<div class="col"><input type="radio" class="btn-check shops" name="shops" id="shop4" value="대구점" autocomplete="off">
    	<label class="btn btn-secondary" for="shop4">대&nbsp;구&nbsp;점</label></div></div></div>
    	</span>
    	
    	<span class="border border-4" style="display:inline-block;width:60%;height:100px;float:right">
	    	<span style="display:inline-block;width:20%;line-height:80px;float:left;vertical-align:middle">사용시간</span>
	    	<span style="display:inline-block;width:80%;height:80px;float:right">
		    	<span class="span-time">
					<input type="radio" class="btn-check" name="options" id="30" value=30 autocomplete="off" checked>
					<label class="btn btn-secondary" for="30">30M</label></span>
				<span class="span-time">	
					<input type="radio" class="btn-check" name="options" id="100" value=60 autocomplete="off">
					<label class="btn btn-secondary" for="100">1H</label></span>
				<span class="span-time">	
					<input type="radio" class="btn-check" name="options" id="130" value=90 autocomplete="off">
					<label class="btn btn-secondary" for="130">1H30M</label></span>
				<span class="span-time">	
					<input type="radio" class="btn-check" name="options" id="200" value=120 autocomplete="off">
					<label class="btn btn-secondary" for="200">2H</label></span>
			</span>
    	</span>
    </div>
    
    <div style="margin-top:40px;height:400px">
    	<div class="border border-4" style="width:48%;height:370px;float:left">
    		<table class="calendartb" id="calendar">
    		<thead style="border-bottom: 1px solid #000;">
				<tr>
					<td class="thead" align="center"><label onclick="prevMonth()"> ◀ </label></td>
					<td class="thead" colspan="5" align="center" id="calendarTitle"></td>
					<td class="thead" align="center"><label onclick="nextMonth()"> ▶ </label></td>
				</tr>
				<tr>
					<td class="thead"><font color ="#F79DC2">일</font></td>
					<td class="thead">월</td>
					<td class="thead">화</td>
					<td class="thead">수</td>
					<td class="thead">목</td>
					<td class="thead">금</td>
					<td class="thead"><font color ="skyblue">토</font></td>
				</tr>
			<thead>
			</table>
    	</div>
    	<div class="border border-4" style="float:right;width:50%;height:400px;text-align:center">
    	<legend>시간</legend>
    	<div id="container1" style="width:100%;height:200px;text-align:center;margin-top:30px;">
    	</div>
    	<hr>
    	<legend>분</legend>
    	<div id="container2" style="margin-top:10px;width:100%;height:100px">
    	</div>	
    	</div>
    </div>
    
    <div class="div-margin2" style="width:100%;height:50px">
    <button type="button" class="orange-button" style="float:right" onclick="return goReservation2();">Next></button>
    <button id="btn-time" type="button" class="orange-button btn-time" style="float:right;margin-right:5px" disabled></button>
    <button id="btn-date" type="button" class="orange-button btn-time" style="float:right;margin-right:5px" disabled></button>
    <button id="btn-shop" type="button" class="orange-button btn-time" style="float:right;margin-right:5px" disabled></button>
    </div>
    
    <div class="border border-4" style="width:100%;height:100px">주간날씨
    </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>

	<%--script 따로 빼놓은 파일 연동 --%>
    <script src="../resources/assets/js/reservation1.js"></script>
</body>
</html>
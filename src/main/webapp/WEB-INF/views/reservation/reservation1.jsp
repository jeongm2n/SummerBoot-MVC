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
    <script>
    // 지점선택 시 아래에 선택한 지점이 뜨도록 
    const shops=['서울본점','경기군포점','경기평택점','대구점'];
    $(document).ready(function(){
	    $("input:radio[name='shops']").click(function(){
	    	n = $("input[name='shops']:checked").val();
	    	switch(n){
	    		case 1 : getAPI("66","126");
	    				break;
	    		case 2 : getAPI("59","122");
	    				break;
	    		case 3 : getAPI("62","114");
	    				break;
	    		case 4 : getAPI("89","91");
	    				break;
	    	}
	    	shopName = shops[n-1];
	    	var btn = document.getElementById('btn-shop');
	        btn.innerHTML = shopName; 
	    });
	});
    
    </script>
</head>

<body>
<div id="wrapper" class="row">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
    
    <div class="col-lg-6 Point_sel">
	  <div class="c_div1">
    	<div class="col border border-4 div1"><a class="title">지점 선택</a>
    	<div class="container text-center">
    	<div class="row row-cols-2">
    	<div class="col" style="padding-bottom:10px"><input type="radio" class="btn-check shops" name="shops" id="shop1" value=1 autocomplete="off">
    	<label class="btn btn-secondary shops" for="shop1">서울&nbsp;&nbsp;본점</label></div>
    	<div class="col" style="padding-bottom:10px"><input type="radio" class="btn-check shops" name="shops" id="shop2" value=2 autocomplete="off">
    	<label class="btn btn-secondary shops" for="shop2">경기군포점</label></div>
    	<div class="col" style="padding-bottom:10px"><input type="radio" class="btn-check shops" name="shops" id="shop3" value=3 autocomplete="off">
    	<label class="btn btn-secondary shops" for="shop3">경기평택점</label></div>
    	<div class="col" style="padding-bottom:10px"><input type="radio" class="btn-check shops" name="shops" id="shop4" value=4 autocomplete="off">
    	<label class="btn btn-secondary shops" for="shop4">대&nbsp;&nbsp;구&nbsp;&nbsp;점</label></div></div></div>
    	</div>
	  </div>
    </div>
<!--     	이 부분도 위에 지점선택처럼 바꾸고 싶었으나 그건 너무 많이 만지는거 같아서 나중에 원하시면 말해주세요 제가 수정할께요! -->
    	<div class="col-lg-6">
    	<div class="border border-4 div2" style="text-align:center">
	    	<span style="display:inline-block;width:20%;line-height:80px;float:left;vertical-align:middle">사용시간</span>
	    	<span style="display:inline-block;width:80%;height:80px;float:right">
		    	<span class="span-time">
					<input type="radio" class="btn-check" name="options" id="30" value=29 autocomplete="off" checked>
					<label class="btn btn-secondary" for="30">30M</label></span>
				<span class="span-time">	
					<input type="radio" class="btn-check" name="options" id="100" value=59 autocomplete="off">
					<label class="btn btn-secondary" for="100">1H</label></span>
				<span class="span-time">	
					<input type="radio" class="btn-check" name="options" id="130" value=89 autocomplete="off">
					<label class="btn btn-secondary" for="130">1H30M</label></span>
				<span class="span-time">	
					<input type="radio" class="btn-check" name="options" id="200" value=119 autocomplete="off">
					<label class="btn btn-secondary" for="200">2H</label></span>
			</span>
    	</div>
    	</div>
    <div class="col-lg-6" style="height:450px">
    	<div class="border border-4 div3" style="text-align:center">
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
    </div>
    
    <div class="col-lg-6 m_div" style="height:550px;">
      <div class="c_div2">
    	<div class="border border-4 div4" style="text-align:center; float:left;">
    	<legend>시간</legend>
    	<div id="container1" style="width:100%;height:200px;text-align:center;">
    	</div>
    	<hr>
    	<legend>분</legend>
    	<div id="container2" style="width:100%;height:75px">
    	</div>	
    	</div>
    	<div class="div5">
		    <button id="btn-shop" type="button" class="orange-button btn-time" style="margin-right:5px" disabled></button>
		    <button id="btn-date" type="button" class="orange-button btn-time" style="margin-right:5px" disabled></button>
		    <button id="btn-time" type="button" class="orange-button btn-time" style="margin-right:5px" disabled></button>
		    <button type="button" class="orange-button" onclick="return goReservation2();">Next></button>
    	</div>
      </div>
    </div>
    
    <div class="border border-4 div6">주간날씨
    </div>
</div>
<%@ include file="../common/footer.jsp" %>

	<%--script 따로 빼놓은 파일 연동 --%>
    <script src="../resources/assets/js/reservation1.js"></script>
    <script>
		
		function getDB(){
		//페이지 전환 없이 DB의 값을 가져오기 위함
		//원하는 예약 날짜를 선택 시 컨트롤러의 chkReservation1.do 액션이 실행됨
		//json형태로 컨트롤러에 데이터를 보내면 쿼리문을 실행하여 결과값을 다시 json으로 받아옴
			$.ajax({
				url : "chkReservation1.do",
				type : "get",
				data : {
					no : n,
					date : clickedMD
				},
				async : true,
				dataType: "json",
				success : function(data){
					try {
		                // 데이터가 제대로 전달되었는지 확인
		                console.log(data);
						var start = [];
						var use = [];
		                // 데이터 처리 로직
		                for (var i = 0; i < data.length; i++) {
		                    start[i] = data[i].startTime;
		                    use[i] = data[i].useTime;
		                    console.log("Start Time:", start[i]);
		                    console.log("Use Time:", use[i]);
		                }
		                timeHour(start,use);
		            } catch (error) {
		                console.error("Error in success callback:", error);
		            }
				},
				error: function(xhr, status, error) {
			        console.log("AJAX Error:", xhr.responseText);
			        console.log("Status:", status);
			        console.log("Error:", error);
			    },
			    headers: {
			        "Accept": "application/json"
			    }
			});
		}
		
		function getAPI(nx,ny){
			$.ajax({
				url : "getweather.do",
				type : "post",
				data : {
					today : currentYMD, 
					nx : nx,
					ny : ny
				},
				async : true,
				dataType: "json",
				success : function(data){
					try {
		                // 데이터가 제대로 전달되었는지 확인
		                console.log(data);
		            } catch (error) {
		                console.error("Error in success callback:", error);
		            }
				},
				error: function(xhr, status, error) {
			        console.log("AJAX Error:", xhr.responseText);
			        console.log("Status:", status);
			        console.log("Error:", error);
			    },
			    headers: {
			        "Accept": "application/json"
			    }
			});
		}
    </script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Wash Boot</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/assets/css/templatemo.css">
    <link rel="stylesheet" href="../resources/assets/css/custom_seo.css">
    
    <script type="text/javascript">
    
    
    var now = new Date(); //띄울 달력의 날짜 정보
    var date = new Date(); //실제 현재 날짜의 정보
    
    var cnt;
    
    var clickedMD = null;
    var selectedHM = null;
    
    var selectedCell;
    var selectedbtn_H;
    var selectedbtn_M;
    
    var realMonth = date.getMonth()+1; 
    var realToDay = date.getDate();
    
    var selectedMonth = null;
    var selectedDate = null;
    
    var selectedHour = null;
    var selectedMinute = null;
    
    function thisMonth(nowMonth, realMonth){ //이번달이면 0, 다음달이면 1 리턴
    	if (nowMonth*1 == realMonth*1){
    		return 0;
    	} 
    	return 1;
    }
    
    //달력 만드는 함수
    function buildCalendar(){
    	nowMonth = now.getMonth()+1;
    	monthEquals = thisMonth(nowMonth, realMonth);
    	var row = null
      	var cnt = 0;
      	var calendarTable = document.getElementById("calendar");
      	var tableTitle = document.getElementById("calendarTitle");
      	tableTitle.innerHTML = now.getFullYear()+"년"+(now.getMonth()+1)+"월";
      
      	var first = new Date(now.getFullYear(), now.getMonth(), 1);
      	var last = new Date(now.getFullYear(), now.getMonth()+1, 0);
      	while(calendarTable.rows.length > 2){
      		calendarTable.deleteRow(calendarTable.rows.length -1);
      	}
      	
      	row = calendarTable.insertRow();
      	for(i = 0; i < first.getDay(); i++){
      		cell = row.insertCell();
      		cnt += 1;
      	}

        for(i = 1; i <= last.getDate(); i++){
        	cell = row.insertCell();
        	cnt += 1;

          	cell.setAttribute('id', i);
        	cell.innerHTML = i;
        	cell.align = "center";
        	cell.bgColor = "#D3D3D3";
        	
        	if (cnt % 7 == 0){
        		row = calendar.insertRow();
        	}
        	
        	if(monthEquals == 0){
	        	if(i>=now.getDate()&&i<=(now.getDate()+6)){
	        		cell.bgColor = "#FFFFFF";
	            	cell.onclick = function(){
	            		selectedMonth = (1 + now.getMonth());
	            		selectedDate = this.getAttribute('id');
	            			
	            		clickedDate = selectedDate >= 10 ? selectedDate : '0' + selectedDate; //10의자리 숫자면 그대로, 1의자리 숫자면 0을 붙여서 (ex.09)
	            		clickedMonth = selectedMonth >= 10 ? selectedMonth : '0' + selectedMonth;
	            		clickedMD = clickedMonth + "-" + clickedDate;
	            						
	            		document.getElementById("btn-date").value = clickedMD;
	            		var btn = document.getElementById('btn-date');
	                	btn.innerHTML = clickedMD;
	            		
	            		if(selectedCell != null){
	            			selectedCell.bgColor = "#FFFFFF";
	            		}
	            		selectedCell = this;
	            		this.bgColor = "#FFDAB9";
	            	}
	        	}
        	}
            if((cnt%7) == 1) {
            	cell.innerHTML="<font color=#F79DC2>" + i + "</font>";
            }  

            if((cnt%7) == 0){
            	cell.innerHTML="<font color=skyblue>" + i + "</font>";
            	row=calendar.insertRow();
            }
            	
        }
        
        if((cnt%7) != 0){ //달력 마지막 날 빈칸으로 만들기
    		for(i=0; i<7-(cnt%7); i++){
    			cell = row.insertCell();
    		}
    	}
    }
    
    //이전 달 달력
    function prevMonth(){
    	now = new Date(now.getFullYear(), now.getMonth()-1, now.getDate());
    	buildCalendar();
    }
    
	//다음 달 달력
    function nextMonth(){
    	now = new Date(now.getFullYear(), now.getMonth()+1, now.getDate());
    	buildCalendar();
    }
    
	//시간 선택 버튼 만들기
    function timeHour(){
    	var line = 0;
    	for(i=9 ; i<24 ; i++){
    		if(line%5==0){
    			document.write("<br><br>");
    		}
    		var button = document.createElement('button');
            button.type = 'button';
            if(i==9){
            	button.innerHTML = "0"+i+"시";
            }
            else{
            	button.innerHTML = i+"시";
            }
            button.setAttribute('id',i);
            button.classList.add('btn-h');
         	
            button.onclick = function() {
            	selectedHour = this.getAttribute('id');
            	if(selectedHour == 9){
            		selectedHour = "0" + selectedHour;
            	}
            	
            	//버튼 클릭 시 색상 변경
            	if(selectedbtn_H != null){
        			selectedbtn_H.classList.remove('btn-click');
        		}
        		selectedbtn_H = this;
        		this.classList.add('btn-click');
            };
         
            var container = document.getElementById('container');
            container.appendChild(button);
            
            line++;
    	}
    }
    
	//분 선택 버튼 만들기
    function timeMinute(){
    	for(i=0 ; i<=30 ; i+=30){
    		var button = document.createElement('button');
            button.type = 'button';
            if(i==0){
            	button.innerHTML = "0"+i;
            }
            else{
            	button.innerHTML = i;
            }
            button.setAttribute('id',i);
            button.classList.add('btn-h');
         	
            button.onclick = function() {
            	selectedMinute = this.getAttribute('id');
            	if(selectedMinute == 0){
            		selectedMinute = "0" + selectedMinute;
            	}
            	
            	//버튼 클릭 시 색상 변경
            	if(selectedbtn_M != null){
        			selectedbtn_M.classList.remove('btn-click');
        		}
        		selectedbtn_M = this;
        		this.classList.add('btn-click');
        		
            	selectedHM = selectedHour + ":" + selectedMinute;
            	document.getElementById("btn-time").value = selectedHM;
            	var btn = document.getElementById('btn-time');
            	btn.innerHTML = selectedHM;
            };
         
            var container = document.getElementById('container-m');
            container.appendChild(button);
    	}
    }
    
	//Next>버튼 클릭 시 예약페이지2로 이동
    function goReservation2(){
    	var radiobtn = document.querySelector('input[type=radio][name=options]:checked');
    	var useTime = radiobtn.value;
    	if(clickedMD==null || selectedHM==null){
    		alert("날짜나 시간을 확인해주세요");
    		return false;
    	}else{
    		window.location.href = "./reservation2?date="+clickedMD+"&startTime="+selectedHM+"&useTime="+useTime;
    		return true;
    	}
    }
    </script>
</head>

<body>
<div id="wrapper">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
<%@ include file="../common/header.jsp" %>
    
    <div class="div-margin" style="height:800px;">
    <div style="text-align:center;height:80px">
    	<span class="border border-4" style="display:inline-block;width:25%;height:50px;float:left">선택된 지점</span>
    	<span class="border border-4" style="display:inline-block;width:60%;height:80px;float:right">
	    	<span style="display:inline-block;width:20%;line-height:80px;float:left;vertical-align:middle">사용시간</span>
	    	<span style="display:inline-block;width:80%;height:80px;float:right">
		    	<span class="span-time">
					<input type="radio" class="btn-check" name="options" id="30" value=30 autocomplete="off" checked>
					<label class="btn btn-secondary" for="option1">30M</label></span>
				<span class="span-time">	
					<input type="radio" class="btn-check" name="options" id="100" value=100 autocomplete="off">
					<label class="btn btn-secondary" for="option2">1H</label></span>
				<span class="span-time">	
					<input type="radio" class="btn-check" name="options" id="130" value=130 autocomplete="off">
					<label class="btn btn-secondary" for="option3">1H30M</label></span>
				<span class="span-time">	
					<input type="radio" class="btn-check" name="options" id="200" value=200 autocomplete="off">
					<label class="btn btn-secondary" for="option4">2H</label></span>
			</span>
    	</span>
    </div>
    
    <div style="margin-top:40px;height:400px">
    	<div class="border border-4" style="width:48%;height:300px;float:left">
    	<table style="width:100%;height:100%;font-weight:bold" id="calendar" align="center">
		<tr>
			<td align="center"><label onclick="prevMonth()"> ◀ </label></td>
			<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
			<td align="center"><label onclick="nextMonth()"> ▶ </label></td>
		</tr>
		<tr>
			<td align="center"><font color ="#F79DC2">일</font></td>
			<td align="center">월</td>
			<td align="center">화</td>
			<td align="center">수</td>
			<td align="center">목</td>
			<td align="center">금</td>
			<td align="center"><font color ="skyblue">토</font></td>
		</tr>
		<script type="text/javascript">buildCalendar();</script>
	</table>
    	</div>
    	<div class="border border-4" style="float:right;width:50%;height:400px;text-align:center">
    	<div id="container" style="width:100%;height:200px;text-align:center;margin-top:30px;">
    	<legend>시간</legend>
    	<script type="text/javascript">timeHour()</script>
    	</div>
    	<hr>
    	<div id="container-m" style="margin-top:10px;width:100%;height:100px">
    	<legend>분</legend>
    	<script type="text/javascript">timeMinute()</script>
    	</div>	
    	</div>
    </div>
    
    <div class="div-margin2" style="width:100%;height:50px">
    <button type="button" class="orange-button" style="float:right" onclick="return goReservation2();">Next></button>
    <button id="btn-time" type="button" class="orange-button btn-time" style="float:right;margin-right:5px" disabled></button>
    <button id="btn-date" type="button" class="orange-button btn-time" style="float:right;margin-right:5px" disabled></button>
    </div>
    
    <div class="border border-4" style="width:100%;height:100px">주간날씨
    </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
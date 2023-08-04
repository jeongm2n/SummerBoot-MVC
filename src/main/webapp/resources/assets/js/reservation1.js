	var now = new Date(); //띄울 달력의 날짜 정보
    var date = new Date(); //실제 현재 날짜의 정보
    
    var cnt;
    
    var shopName = null;
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
    	if(clickedMD==null || selectedHM==null ||shopName==null){
    		alert("지점, 날짜, 시간을 확인해주세요");
    		return false;
    	}else{
    		window.location.href = "./reservation2?shopName="+shopName+"&date="+clickedMD+"&startTime="+selectedHM+"&useTime="+useTime;
    		return true;
    	}
    }
    
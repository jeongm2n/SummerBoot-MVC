	var now = new Date(); //띄울 달력의 날짜 정보
    var date = new Date(); //실제 현재 날짜의 정보

    var realMonth = date.getMonth()+1; 
    var realToDay = date.getDate();
    
    var currentMonth = realMonth >= 10 ? realMonth : "0" + realMonth;
    var currentDate = date.getDate() >= 10 ? date.getDate() : "0" +date.getDate();
    var currentMD = currentMonth + "-" + currentDate;
    var currentHour = date.getHours();
    var currentMinute = date.getMinutes();
    
    var selectedCell;
    var selectedbtn_H;
    var selectedbtn_M;
    
    var shopName = null;
    var clickedMD = currentMD;
    var selectedHM = null;
    
    var selectedMonth = null;
    var selectedDate = null;
    
    var selectedHour = null;
    var selectedMinute = null;
    
    const calendar = document.getElementById('calendar');
    const hourContainer = document.getElementById('container1');
    const minuteContainer = document.getElementById('container2');
    
    
    function thisMonth(nowMonth, realMonth){ //이번달이면 0, 다음달이면 1 리턴
    	if (nowMonth*1 == realMonth*1){
    		return 0;
    	} 
    	return 1;
    }
    
    function buildCalendar(){
		var nowMonth = now.getMonth()+1;
    	monthEquals = thisMonth(nowMonth, realMonth);
    	
    	var selectedtd = null;
    	
    	var first = new Date(now.getFullYear(), now.getMonth(), 1);
      	var last = new Date(now.getFullYear(), now.getMonth()+1, 0);
      	
      	
      	const monthLabel = document.getElementById('calendarTitle');
      	var headerYM = now.getFullYear()+"년"+(now.getMonth()+1)+"월";
  		monthLabel.textContent = headerYM;
      	
  		const tbody = document.createElement('tbody');
  		tbody.setAttribute('id','calBody');
  		
  		let date = 1;
  		var week = (last.getDate()/7)+1;
  		for (i=0; i<week; i++) {
    		const weekRow = document.createElement('tr');
    		for(j=0 ; j<7 ; j++){
				if(i===0 && j<first.getDay()){
					const emptyCell = document.createElement('td');
        			weekRow.appendChild(emptyCell);
				}else if(date > last.getDate()){
					const emptyCell = document.createElement('td');
        			weekRow.appendChild(emptyCell);
				}else{
					var dateCell = document.createElement('td');
					dateCell.setAttribute('id',date);
					dateCell.textContent = date;
					
					if(monthEquals == 0){
						if(date>=now.getDate() && date<=(now.getDate()+6)){
							dateCell.classList.add('td-click');
							dateCell.onclick = function(){
						        selectedMonth = 1 + now.getMonth();
						        selectedDate = this.getAttribute('id');
						        
						        //10의자리 숫자면 그대로, 1의자리 숫자면 0을 붙여서 (ex.09)
						        clickedDate = selectedDate >= 10 ? selectedDate : '0' + selectedDate; 
				            	clickedMonth = selectedMonth >= 10 ? selectedMonth : '0' + selectedMonth;
				            	clickedMD = clickedMonth + "-" + clickedDate;
			            						
			            		document.getElementById("btn-date").value = clickedMD;
			            		var btn = document.getElementById('btn-date');
			                	btn.innerHTML = clickedMD;
			                	
				                if(dateCell != null){
									dateCell.classList.remove('selected');
								}
								dateCell = this;
								this.classList.add('selected');
			                	
			                	timeHour();
			                	timeMinute();
				        	};
						}
					}
					
			        weekRow.appendChild(dateCell);
			        date++;
				}
			}
			tbody.appendChild(weekRow);
		}
  		return tbody;
	}
    
    function removeAllChildren(element) {
	  	while (element.firstChild) {
	    	element.removeChild(element.firstChild);
	  	}
	}
    
    function timeHour(){
		removeAllChildren(hourContainer);
		//한 줄에 5개만 있도록 갯수 설정하는 변수
	    var line = 0;
	    var a= 0;	
	    for(i=9 ; i<24 ; i++){
	    	if(line!=0 && line%5==0){
				const br = document.createElement('br');
            	hourContainer.appendChild(br);
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
	        
			//오늘 날짜에 적용할 js
		    if(currentMD == clickedMD){
				if(i >= currentHour){
	            	button.classList.add('btn-h');
	            	button.onclick = function(){
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
	            }else{ //현재 시간보다 이전 시간은 선택못하게
					button.classList.add('btn-disabled');
				}
			}else{
				button.classList.add('btn-h');
				button.onclick = function(){
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
			}
         	
        	
        	hourContainer.appendChild(button);
            
        	line++;
    	}
	}
    
    
	//분 선택 버튼 만들기
    function timeMinute(){
		removeAllChildren(minuteContainer);
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
	            
            minuteContainer.appendChild(button);
    	}
    }
    
    function removeMonth(parentElement, childId){
		const childElement = parentElement.querySelector('#' + childId);
		if (childElement) {
			parentElement.removeChild(childElement);
		}
	}
    
    //이전 달 달력
    function prevMonth(){
		removeMonth(calendar,'calBody');
		now = new Date(now.getFullYear(), now.getMonth()-1, now.getDate());
    	calendar.appendChild(buildCalendar());
    	hourContainer.innerHTML = ""; // 시간 선택 버튼 컨테이너 초기화
  		minuteContainer.innerHTML = ""; // 분 선택 버튼 컨테이너 초기화
    }
    
	//다음 달 달력
    function nextMonth(){
		removeMonth(calendar,'calBody');
    	now = new Date(now.getFullYear(), now.getMonth()+1, now.getDate());
    	calendar.appendChild(buildCalendar());
    	hourContainer.innerHTML = ""; // 시간 선택 버튼 컨테이너 초기화
  		minuteContainer.innerHTML = ""; // 분 선택 버튼 컨테이너 초기화
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
    
    calendar.appendChild(buildCalendar());
    
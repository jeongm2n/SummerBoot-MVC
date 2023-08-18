	var now = new Date(); //띄울 달력의 날짜 정보
    var date = new Date(); //실제 현재 날짜의 정보

    var realMonth = date.getMonth()+1; 
    var realToDay = date.getDate();
    var realYear = date.getFullYear();
    
    var currentMonth = realMonth >= 10 ? realMonth : "0" + realMonth;
    var currentDate = date.getDate() >= 10 ? date.getDate() : "0" +date.getDate();
    var currentMD = currentMonth + "-" + currentDate;
    var currentHour = date.getHours();
    var currentMinute = date.getMinutes();
    
    var currentYMD = realYear + currentMonth + currentDate;
    
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
    
    var start = [];
    var use = [];
    
    var n;
        
    var weather = new Array();
    
    const calendar = document.getElementById('calendar');
    const hourContainer = document.getElementById('container1');
    const minuteContainer = document.getElementById('container2');
    const weathertable = document.getElementById('weather');
    
    
    function thisMonth(nowMonth, realMonth){ //이번달이면 0, 다음달이면 1 리턴
    	if (nowMonth*1 == realMonth*1){
    		return 0;
    	} 
    	return 1;
    }
    
    
    //달력 만드는 함수
    function buildCalendar(){
		var nowMonth = now.getMonth()+1;
    	monthEquals = thisMonth(nowMonth, realMonth);
    	
    	var first = new Date(now.getFullYear(), now.getMonth(), 1);
    	//달의 첫 번째 날을 구하기 위함
      	var last = new Date(now.getFullYear(), now.getMonth()+1, 0);
      	//달의 마지막날을 구하기 위함
      	
      	const monthLabel = document.getElementById('calendarTitle');
      	//달력의 yyyy년 M월을 표현하기 위한 Label
      	var headerYM = now.getFullYear()+"년"+(now.getMonth()+1)+"월";
  		monthLabel.textContent = headerYM;
      	
  		const tbody = document.createElement('tbody');
  		tbody.setAttribute('id','calBody');
  		
  		let date = 1; //1일~ 마지막날까지 반복문 돌릴 변수
  		var week = (last.getDate()/7)+1; //해당 달이 몇 주인지 구하는 변수
  		for (i=0; i<week; i++) {
    		const weekRow = document.createElement('tr'); //각 주마다 <tr>을 만들고
    		for(j=0 ; j<7 ; j++){ //7일을 돌면서 요일 셀을 만듬
				if(i===0 && j<first.getDay()){ //첫 번째 주이면서, 달의 첫 번째 날보다 앞의 셀들은 비워둬야 하므로
					const emptyCell = document.createElement('td'); //아무것도 없는 빈 셀을 생성
        			weekRow.appendChild(emptyCell);
				}else if(date > last.getDate()){ //마지막날보다 date가 남았으면 빈 셀로 생성
					const emptyCell = document.createElement('td');
        			weekRow.appendChild(emptyCell);
				}else{ //해당 달의 첫번째 날~ 마지막날 사이의 숫자들이면 날짜 셀을 생성 (ex 1~31일)
					var dateCell = document.createElement('td');
					dateCell.setAttribute('id',date);
					dateCell.textContent = date;
					
					if(monthEquals == 0){ //이번 달이면
						if(date>=now.getDate() && date<=(now.getDate()+6)){ //오늘로부터 일주일 동안만 예약가능하도록 하기 위함
							dateCell.classList.add('td-click');
							dateCell.onclick = function(){ //7일 동안만 클릭가능하도록 클릭이벤트 설정
						        selectedMonth = 1 + now.getMonth(); //선택한 달의 정보
						        selectedDate = this.getAttribute('id'); //선택한 날의 정보
						        
						        //10의자리 숫자면 그대로, 1의자리 숫자면 0을 붙여서 (ex.09)
						        clickedDate = selectedDate >= 10 ? selectedDate : '0' + selectedDate; 
				            	clickedMonth = selectedMonth >= 10 ? selectedMonth : '0' + selectedMonth;
				            	clickedMD = clickedMonth + "-" + clickedDate; //"08-11" 의 형태로 만듬
			            		
			            		getDB(); //DB에서 해당 지점의 선택한 날짜의 예약 정보를 가져오기 위한 함수 실행			
			            		document.getElementById("btn-date").value = clickedMD;
			            		var btn = document.getElementById('btn-date');
			                	btn.innerHTML = clickedMD; //아래쪽에 사용자가 선택한 날짜를 띄우기 위한 코드
											                	
				                if(dateCell != null){ //다른 셀을 선택 시 색 변경 (선택된 셀은 주황색, 아닌 셀은 흰색)
									dateCell.classList.remove('selected');
								}
								dateCell = this;
								this.classList.add('selected');	                	
				        	};
						}
					}
					
			        weekRow.appendChild(dateCell); //날짜 셀을 주 <tr>에 추가
			        date++; 
				}
			}
			tbody.appendChild(weekRow); //테이블의 tbody에 각 주 <tr>을 추가
		}
  		return tbody;
	}
    
    function removeAllChildren(element) { //시간, 분 버튼 초기화 시키기 위한 함수
	  	while (element.firstChild) {
	    	element.removeChild(element.firstChild);
	  	}
	}
    
    function timeHour(start, use){ //예약 가능 시간대 버튼 만드는 함수
    
		removeAllChildren(hourContainer); //이 함수가 실행될 때마다 시간대 버튼을 다 지웠다가 다시 만들기 위함
		
	    var line = 0; //한 줄에 5개만 있도록 갯수 설정하는 변수 
	   	
	    for(i=9 ; i<24 ; i++){ //9시~23시까지 예약가능하도록 버튼 생성
	    	if(line!=0 && line%5==0){
				const br = document.createElement('br');
            	hourContainer.appendChild(br); 
	    	}
	    	var button = document.createElement('button');
	        button.type = 'button';
	        if(i==9){ //9시만 혼자 일의 자리 수이기 때문에 09시로 표현하기 위함
	            button.innerHTML = "0"+i+"시";
	        }
	        else{ //나머지는 다 "시"만 붙이면 됨
	            button.innerHTML = i+"시";
	        }
	        
	        button.setAttribute('id',i); //각 버튼의 아이디는 각 버튼의 시간으로 설정
	        
			
		    if(currentMD == clickedMD){ //사용자가 선택한 날짜가 오늘이면
				if(i >= currentHour){ //현재 시간보다 이후의 시간이면 (아직 지나지 않은 시간이면) 클릭 이벤트 연결
	            	button.classList.add('btn-h');
	            	button.onclick = function(){
						timeMinute(); //시간 클릭 시 분 선택 버튼 생성
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
	            }else{ //현재 시간보다 이전 시간은 선택못하게 (이미 지난 시간은 선택 못하게)
					button.classList.add('btn-disabled');
				}
			}else{ //사용자가 선택한 날이 오늘이 아니면 시간대는 신경 안써도 되므로
				button.classList.add('btn-h');
				button.onclick = function(){
					timeMinute();
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
    
    function removeMonth(parentElement, childId){  //달력 초기화하는 함수
		const childElement = parentElement.querySelector('#' + childId);
		if (childElement) {
			parentElement.removeChild(childElement);
		}
	}
    
    //이전 달 달력 출력
    function prevMonth(){
		removeMonth(calendar,'calBody'); //초기화하지 않으면 계속 쌓임
		now = new Date(now.getFullYear(), now.getMonth()-1, now.getDate());
    	calendar.appendChild(buildCalendar());
    	hourContainer.innerHTML = ""; // 시간 선택 버튼 컨테이너 초기화
  		minuteContainer.innerHTML = ""; // 분 선택 버튼 컨테이너 초기화
    }
    
	//다음 달 달력 출력
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
    		window.location.href = "./reservation2?shopName="+shopName+"&no="+n+"&date="+clickedMD+"&startTime="+selectedHM+"&useTime="+useTime;
    		//reservation2로 지점 이름, 세차장 고유번호, 선택날짜, 선택한 시작시간, 사용시간에 대한 정보를 넘김
    		return true;
    	}
    }
    
    function plusDate(){
		var plusdate = new Date();
		var plusMonth;
		var plusDate;
		var plusfullYear;
		
		for(i=3; i<7; i++){
			plusdate.setDate(date.getDate()+i);
			plusfullYear = plusdate.getFullYear();
			plusMonth = (plusdate.getMonth()+1) >= 10 ? (plusdate.getMonth()+1) : "0" + (plusdate.getMonth()+1);
    		plusDate = plusdate.getDate() >= 10 ? plusdate.getDate() : "0" + plusdate.getDate();
    		weather[i].date = plusfullYear + plusMonth + plusDate;
		}
	}
	
	function judgeweather(pop){
		const img = new Image();
		if(pop<30){
			img.src = "../resources/assets/img/sun.png";
		}
		else if(pop>=30 && pop<50){
			img.src = "../resources/assets/img/cloudy.png";
		}
		else{
			img.src = "../resources/assets/img/rain.png";
		}
		img.classList.add('weatherimg')
		return img;
	}
	
	function makeWeather(){
		weathertable.innerHTML='';
		
		const week = document.createElement('tr');
		const weathers = document.createElement('tr');
		const temps = document.createElement('tr');
		var img = new Image();
		
		for(i=0; i<7; i++){
			const eachday = document.createElement('th');
			eachday.colSpan = 2;
			eachday.innerText = weather[i].date;
			week.appendChild(eachday);
			
			const amweather = document.createElement('td');
			const br = document.createElement('br');
			amweather.innerText = "오전";
			amweather.appendChild(br);
			img = judgeweather(weather[i].ampop)
			amweather.appendChild(img);
			amweather.classList.add('weathertd');
			
			const pmweather = document.createElement('td');
			const br2 = document.createElement('br');
			pmweather.innerText = "오후";
			pmweather.appendChild(br2);
			img = judgeweather(weather[i].pmpop)
			pmweather.appendChild(img);
			pmweather.classList.add('weathertd');
			
			weathers.appendChild(amweather);
			weathers.appendChild(pmweather);
			
			const temp = document.createElement('td');
			temp.colSpan = 2;
			temp.innerText = weather[i].tmn + "/" + weather[i].tmx;
			temp.classList.add('weathertd');
			temps.appendChild(temp);
		}
		
		weathertable.appendChild(week);
		weathertable.appendChild(weathers);
		weathertable.appendChild(temps);
	}
    
    calendar.appendChild(buildCalendar());
    
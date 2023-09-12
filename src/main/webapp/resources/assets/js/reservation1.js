	var now = new Date(); //띄울 달력의 날짜 정보
    const date = new Date(); //실제 현재 날짜의 정보
    
    //이 프로그램을 실행시킨 변하지 않는 현재 날짜의 정보
    const realMonth = date.getMonth()+1; 
    const realToDay = date.getDate();
    const realYear = date.getFullYear();
    
    var currentMonth = realMonth >= 10 ? realMonth : "0" + realMonth;
    var currentDate = realToDay >= 10 ? realToDay : "0" + realToDay;
    var currentMD = currentMonth + "-" + currentDate; //오늘 날짜(ex."09-13" 형태)
    var currentHour = date.getHours();
    var currentMinute = date.getMinutes();
    
    var selectedbtn_H; //시간 버튼 선택 시 색상 변경하게 하기 위한 변수
    var selectedbtn_M; //분 버튼 선택 시 색상 변경하게 하기 위한 변수
    
    var shopName; //지점 이름
    var clickedMD; //사용자가 달력에서 선택한 날짜를 저장할 변수
    var endtime = null; //예약 종료시간이 저장될 변수
    
    var selectedHour = null; //시간 버튼을 클릭해서 선택한 시간 값이 저장될 변수
    var selectedMinute = null; //분 버튼을 클릭해서 선택한 분 값이 저장될 변수
    var selectedHM = null; //selectedHour : selectedMinute 형태의 값이 저장될 변수
    
    var n;
    var a=29; //사용시간 radio 버튼들의 value를 저장할 변수 a, 기본은 29
    
    //8월 28~9월3일처럼 일주일안에 다음달로 넘어가는 기간이 있을 수 있으니 
    //크기가 7인 배열 days와 months에 같은 인덱스에 일, 월의 정보를 넣어둠
    var days = [];
    var months = [];
    for(i=0;i<7;i++){
		var d = new Date(now);
		d.setDate(now.getDate() + i);
		months[i] = d.getMonth()+1;
		days[i] = d.getDate();
	}
	
	var cnt = 0; //달력을 현재 달과 다음달만 조회할 수 있도록 설정하는 변수
    
    const calendar = document.getElementById('calendar');
    const hourContainer = document.getElementById('container1');
    const minuteContainer = document.getElementById('container2');
    const weathertable = document.getElementById('weather');
    
    //예약 가능한 기간이 다음달로 넘어갈 때를 사용하기 위한 변수
    var r = 0;
    
    //달력 만드는 함수
    function buildCalendar(now){
		var nowMonth = now.getMonth()+1;
    	
    	var first = new Date(now.getFullYear(), now.getMonth(), 1); //달의 첫 번째 날
      	var last = new Date(now.getFullYear(), now.getMonth()+1, 0); //달의 마지막날
      	
      	const monthLabel = document.getElementById('calendarTitle');
      	//달력에 yyyy년 M월을 표현하기 위한 Label
      	var headerYM = now.getFullYear()+"년 "+(now.getMonth()+1)+"월";
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
					
					if(j==0){ //일요일이면 빨간색 글씨로 표시
						dateCell.classList.add('sunday-td');
					}else if(j==6){ //토요일이면 파란색 글씨로 표시
						dateCell.classList.add('saturday-td');
					}
					
					if(nowMonth==realMonth && date == realToDay){ //오늘 날짜에 'selected' css를 줌
						dateCell.classList.add('selected');
					}
					
					if(months[r] === nowMonth){  //예약 가능한 날짜의 Month 값이 현재 띄워진 달력의 달과 일치하면
						if(date === days[r]){ //예약 가능한 날짜의 Date 값과 같은 date에 클릭 이벤트 설정
							r++; //days와 months의 인덱스를 높여주는 변수
							dateCell.classList.add('td-click');
							dateCell.onclick = function(){ //7일 동안만 클릭가능하도록 클릭이벤트 설정
						        
						        //10의자리 숫자면 그대로, 1의자리 숫자면 0을 붙여서 (ex.09)
						        clickedDate = this.getAttribute('id') >= 10 ? this.getAttribute('id') : '0' + this.getAttribute('id');//선택한 달의 정보
				            	clickedMonth = (1 + now.getMonth()) >= 10 ? (1 + now.getMonth()) : '0' + (1 + now.getMonth()); //선택한 날짜의 정보
				            	clickedMD = clickedMonth + "-" + clickedDate; //"08-11" 의 형태로 만듬
			            		
			            		minuteContainer.innerHTML=''; //날짜 선택할 때마다 분 버튼들 초기화
			            		timeHour(); //시간 버튼 만드는 함수 호출 
			            		document.getElementById("btn-date").value = clickedMD; 
			            		var btn = document.getElementById('btn-date');
			                	btn.innerHTML = clickedMD; //아래쪽에 사용자가 선택한 날짜를 띄우기 위한 코드
			                	
			                	//selected 클래스를 갖고있는 dateCell을 selectedDateCell에 담고
				                var selectedDateCell = document.querySelector('.selected');
					            if (selectedDateCell !== null && selectedDateCell !== this) {
									//선택되어 있는 셀이 있고, 그 셀이 현재 자신이 아니라면 'selected' 속성을 지움. 
					            	selectedDateCell.classList.remove('selected');
					            }
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
	
	function makeHbtn(btn,istoday){ //시간 div의 시간 버튼을 만드는 함수
		selectedHour = btn.getAttribute('id'); //선택한 버튼의 id(시간)를 변수 selectedHour에 저장
		timeMinute(selectedHour,istoday); //시간 버튼을 클릭할 때마다 새로운 분 버튼으로 변경
		if(selectedHour == 9){ 
			selectedHour = "0" + selectedHour;
		}
									            	
		if(selectedbtn_H != null){ 
			//이미 선택된 버튼이 있는데 다른 버튼을 클릭하면 선택되어 있던 버튼의 색상을 선택되기 전의 색상으로 변경 
			selectedbtn_H.classList.remove('btn-click');
		}
		selectedbtn_H = btn;
		btn.classList.add('btn-click');
	}
	
    function timeHour(){ //예약 가능 시간대 버튼 만드는 함수
		hourContainer.innerHTML=''; //이 함수가 실행될 때마다 시간대 버튼을 다 지웠다가 다시 만들기 위함
		
	    var line = 0; //한 줄에 5개만 있도록 갯수 설정하는 변수 
	   	
	    for(i=9 ; i<24 ; i++){ //9시~23시까지 예약가능하도록 버튼 생성
	    	if(line!=0 && line%5==0){ //한 줄에 버튼이 5개가 있으면 <br> 객체를 삽입
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
	        
			if(a>=89 && i==23){ //영업시간이 09~00시까지이기 때문에 23시부터는 1H30, 2H를 이용할 수 없음 
				button.classList.add('btn-disabled'); //버튼 비활성화
			}else{
				if(currentMD == clickedMD){ //사용자가 선택한 날짜가 오늘이고
					if(i >= currentHour){ //현재 시간보다 이후의 시간이면 (아직 지나지 않은 시간이면) 클릭 이벤트 연결
	            		button.classList.add('btn-h');
	            		button.onclick = function(){ 
							makeHbtn(this,"1"); //현재 버튼 객체와 선택날짜가 오늘날짜라는 의미인 1을 makeHbtn의 파라미터로 넘김
						};
	            	}else{ //현재 시간보다 이전 시간은 선택못하게 (이미 지난 시간은 선택 못하게)
						button.classList.add('btn-disabled');
					}
				}else{ //사용자가 선택한 날이 오늘이 아니면 시간대는 신경 안써도 되므로 모든 시간 버튼에 click 이벤트 부여
					button.classList.add('btn-h');
					button.onclick = function(){
						makeHbtn(this,"0"); //현재 버튼 객체와 선택날짜가 오늘날짜가 아니라는 의미인 0을 makeHbtn의 파라미터로 넘김
					};
				}
			}	
        	hourContainer.appendChild(button); //시간 div에 시간 버튼들 추가
        	line++;
    	}
	}
    
    function makeMbtn(btn){ //분 버튼 만드는 함수
		selectedMinute = btn.getAttribute('id'); //선택된 분의 id를(0,30) 변수 selectedMinute에 저장
		if (selectedMinute == 0) { //0분은 00분으로 표시
			selectedMinute = "0" + selectedMinute;
		}

		if (selectedbtn_M != null){
			//이미 선택된 버튼이 있는데 다른 버튼을 클릭하면 선택되어 있던 버튼의 색상을 선택되기 전의 색상으로 변경 
			selectedbtn_M.classList.remove('btn-click');
		}
		selectedbtn_M = btn;
		btn.classList.add('btn-click');

		selectedHM = selectedHour + ":" + selectedMinute; // "시간:분"의 형태로 변수 selectedHM에 저장
							
		var temp = new Date('2023-'+clickedMD+'T'+selectedHM+':00'); //선택된 시간을 temp라는 새로운 Date 객체로 생성
		temp = new Date(temp.getTime() + a * 60000); //temp에 사용시간 변수인 a를 더해서 새로운 날짜 객체로 만듦
							
		const tempH = temp.getHours() >= 10 ? temp.getHours() : '0' + temp.getHours();
		const tempM = temp.getMinutes();
		endtime = tempH + ":" + tempM; //예약 종료 시간을 변수 endtime에 저장 
							
		document.getElementById("btn-time").value = selectedHM;
		var button = document.getElementById('btn-time');
		button.innerHTML = selectedHM + " ~ " + endtime; //예약 시작시간 ~ 종료시간 형태로 나타냄
	}
    
	//분 선택 버튼 만들기
    function timeMinute(compareHour, istoday){
		minuteContainer.innerHTML=''; //초기화해주지 않으면 계속 쌓임
		
    	for(i=0 ; i<=30 ; i+=30){ //정각(0분)과 30분의 버튼만 만듦
    		var button = document.createElement('button');
            button.type = 'button';
            if(i==0){ // "00"의 형태로 만들기 위함
            	button.innerHTML = "0"+i;
            }
            else{
            	button.innerHTML = i;
            }
            button.setAttribute('id',i);
			
			if (a == 119 && compareHour == 22 && i == 30) {
				//사용시간이 2H일때 폐점시간이 00:00이라 22:30은 선택할 수 없으므로 22시 30분은 비활성화
				button.classList.add('btn-disabled');
			}else if (a == 59 && compareHour == 23 && i == 30) {
				//사용시간이 1H일 때 폐점시간 때문에 23:30은 선택할 수 없으므로 비활성화
				button.classList.add('btn-disabled');
			} else {
				if (compareHour == currentHour && istoday==1) {
					//선택한 시간과 현재 시간이 같고, 선택 날짜가 오늘 날짜이면 (istoday==1)
					if (i < currentMinute) { //만약 현재가 16시 25분이라고 하면 16시 00분은 이미 지나가 예약할 수 없으므로 비활성화
						button.classList.add('btn-disabled');
					} else {
						button.classList.add('btn-h');
						button.onclick = function() {
							makeMbtn(this);
						};
					}
				} else {
					button.classList.add('btn-h');
					button.onclick = function() {
						makeMbtn(this);
					};
				}
			}
            
            minuteContainer.appendChild(button); //분 div에 버튼 추가
    	}
    }
    
    function removeMonth(parentElement, childId){  //달력 초기화하는 함수
		const childElement = parentElement.querySelector('#' + childId);
		//childId 값의 id를 가진 요소를 가져옴
		if (childElement) {
			parentElement.removeChild(childElement);
		}
	}
    
    //이전 달 달력 출력
    function prevMonth(){
		if(cnt == 0){
			alert("현재 달에서 이전 달은 조회하실 수 없습니다.");
		}else{
			r = 0;
			cnt -= 1;
			removeMonth(calendar,'calBody'); //초기화하지 않으면 계속 쌓임
			now = new Date(now.getFullYear(), now.getMonth()-1, now.getDate());
	    	calendar.appendChild(buildCalendar(now));
	    	hourContainer.innerHTML = ""; // 시간 선택 버튼 컨테이너 초기화
	  		minuteContainer.innerHTML = ""; // 분 선택 버튼 컨테이너 초기화
		}
    }
    
	//다음 달 달력 출력
    function nextMonth(){
		if(cnt == 1){
			alert("현재 달에서 +1달까지만 조회하실 수 있습니다.")
		}
		else{
			cnt += 1;
			removeMonth(calendar,'calBody'); //초기화하지 않으면 계속 쌓임
	    	now = new Date(now.getFullYear(), now.getMonth()+1, now.getDate());
	    	calendar.appendChild(buildCalendar(now));
	    	hourContainer.innerHTML = ""; // 시간 선택 버튼 컨테이너 초기화
	  		minuteContainer.innerHTML = ""; // 분 선택 버튼 컨테이너 초기화
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
	
	//주간날씨 채우는 함수
	function makeWeather(){
		
		const week = document.createElement('tr'); //날짜를 나타내는 tr
		const weathers = document.createElement('tr'); //날씨 이미지를 띄울 tr
		const temps = document.createElement('tr'); //최저,최고 온도를 띄울 tr
		var img = new Image();
		
		for(i=0; i<7; i++){
			const eachday = document.createElement('th');
			eachday.colSpan = 2;
			eachday.innerText = weather[i].date; //날짜 셀에 날짜 텍스트 띄움
			if(i!=6) {eachday.style = "border-right: 1px solid #B9B4C7;";}
			week.appendChild(eachday); //week에 날짜 셀 추가
			
			const amweather = document.createElement('td');
			const br = document.createElement('br');
			amweather.innerText = "오전";
			amweather.appendChild(br);
			img = judgeweather(weather[i].ampop) //오전 날씨의 이미지를 img에 저장
			amweather.appendChild(img); //오전 날씨 셀에 이미지 추가
			amweather.classList.add('weathertd');
			
			const pmweather = document.createElement('td');
			const br2 = document.createElement('br');
			pmweather.innerText = "오후";
			pmweather.appendChild(br2);
			img = judgeweather(weather[i].pmpop) //오후 날씨의 이미지를 img에 저장
			pmweather.appendChild(img); //오후 날씨 셀에 이미지 추가
			pmweather.classList.add('weathertd');
			if(i!=6) {pmweather.style = "border-right: 1px solid #B9B4C7;"}
			weathers.appendChild(amweather); //오전날씨 셀을 weathers에 추가
			weathers.appendChild(pmweather); //오후날씨 셀을 weathers에 추가
			
			const temp = document.createElement('td');
			temp.colSpan = 2;
			if(i!=6) {temp.style = "border-right: 1px solid #B9B4C7;";}
			const textLTemp = document.createElement('span');
			const textHTemp = document.createElement('span');
			const slice = document.createElement('span');
			textLTemp.style = 'color:blue'; //최저기온에 파란색 색깔 입힘
			textHTemp.style = 'color:red'; //최고기온에 빨간색 색깔 입힘
			textLTemp.innerText = weather[i].tmn + String.fromCharCode(176) + "C";
			slice.innerText = " / ";
			textHTemp.innerText = weather[i].tmx + String.fromCharCode(176) + "C";
			//온도 기호와 C를 붙여 기온을 알아보기 쉽게 만듦
			temp.classList.add('weathertd');
			temps.appendChild(temp);
			temp.appendChild(textLTemp);
			temp.appendChild(slice);
			temp.appendChild(textHTemp);
		}
		
		weathertable.appendChild(week);
		weathertable.appendChild(weathers);
		weathertable.appendChild(temps);
	}
    
    makeWeather();
    calendar.appendChild(buildCalendar(now));
    timeHour();
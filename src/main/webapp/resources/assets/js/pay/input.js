window.addEventListener('load', function() {
  var inp = document.querySelectorAll('input');
  for (var i = 0; i < inp.length; i++) {
    inp[i].addEventListener('change', function() {
      this.setAttribute("value", this.value);
    })
  }
})

function all_point(point){
	$('input[name=m_point]').attr('value',point);
	$('input[name=p_point]').attr('value',point);
	$('input[name=h_point]').attr('value',point);
}


function valid(){
		var postcode = document.addressForm.postcode.value;
		var state = document.addressForm.state.value;
		var p_state = postcode / 1000;
		
		var email = document.addressForm.email.value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		var valid = 0;
		
		if(exptext.test(email)==false){
			document.getElementById("email_error").innerHTML = "유효하지 않은 이메일 입니다.";
			valid = 1;
		}
		
		if(p_state >= 01 && p_state <= 09 && state == "서울"){ }
		else if(p_state >= 10 && p_state <= 20 && state == "경기"){ }
		else if(p_state >= 21 && p_state <= 23 && state == "인천"){ }
		else if(p_state >= 24 && p_state <= 26 && state == "강원특별자치도"){ }
		else if(p_state >= 27 && p_state <= 29 && state == "충북"){ }
		else if(p_state == 30 && state == "세종특별자치시"){ }
		else if(p_state >= 31 && p_state <= 33 && state == "충남"){ }
		else if(p_state >= 34 && p_state <= 35 && state == "대전"){ }
		else if(p_state >= 36 && p_state <= 40 && state == "경북"){ }
		else if(p_state >= 41 && p_state <= 43 && state == "대구"){ }
		else if(p_state >= 44 && p_state <= 45 && state == "울산"){ }
		else if(p_state >= 46 && p_state <= 49 && state == "부산"){ }
		else if(p_state >= 50 && p_state <= 53 && state == "경남"){ }
		else if(p_state >= 54 && p_state <= 56 && state == "전북"){ }
		else if(p_state >= 57 && p_state <= 60 && state == "전남"){ }
		else if(p_state >= 61 && p_state <= 62 && state == "강원"){ }
		else if(p_state == 63 && state == "제주특별자치도"){ 	}
		else{
			document.getElementById("post_error").innerHTML = "도/시 와 우편번호가 일치하지 않습니다.";
			valid = 1;;
		}
		
		if(valid == 0){
			return true;
		}
		else {
			return false;
		}
		
	}

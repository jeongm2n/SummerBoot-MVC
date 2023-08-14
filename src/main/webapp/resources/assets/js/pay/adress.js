function execDaumPostcode() {
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
			  $("#state").val(data.sido).prop("selected", true);
			  $('input[name=postcode]').attr('value',data.zonecode);
			  $('input[name=city]').attr('value',data.sigungu);
			  $('input[name=town]').attr('value',data.bname);
			  
			  var roadAddress = data.roadAddress;
			  roadAddress = roadAddress.replace(data.sido,"");
			  roadAddress = roadAddress.replace(data.sigungu,"");
			  roadAddress = roadAddress.replace(data.bname,"");
			  $('input[name=street_add]').attr('value',roadAddress.trim());

//			  document.getElementById("street_add").value = roadAddress.trim();
            }
        }).open();
    });
}

function address_valid(){
		
		var postcode = document.addressForm.postcode.value;
		var state = document.addressForm.state.value;
		var p_state = postcode / 1000;
		
		if(p_state >= 01 && p_state <= 09 && state == "서울"){
			return true;
		}
		else if(p_state >= 10 && p_state <= 20 && state == "경기"){
			return true;
		}
		else if(p_state >= 21 && p_state <= 23 && state == "인천"){
			return true;
		}
		else if(p_state >= 24 && p_state <= 26 && state == "강원특별자치도"){
			return true;
		}
		else if(p_state >= 27 && p_state <= 29 && state == "충북"){
			return true;
		}
		else if(p_state == 30 && state == "세종특별자치시"){
			return true;
		}
		else if(p_state >= 31 && p_state <= 33 && state == "충남"){
			return true;
		}
		else if(p_state >= 34 && p_state <= 35 && state == "대전"){
			return true;
		}
		else if(p_state >= 36 && p_state <= 40 && state == "경북"){
			return true;
		}
		else if(p_state >= 41 && p_state <= 43 && state == "대구"){
			return true;
		}
		else if(p_state >= 44 && p_state <= 45 && state == "울산"){
			return true;
		}
		else if(p_state >= 46 && p_state <= 49 && state == "부산"){
			return true;
		}
		else if(p_state >= 50 && p_state <= 53 && state == "경남"){
			return true;
		}
		else if(p_state >= 54 && p_state <= 56 && state == "전북"){
			return true;
		}
		else if(p_state >= 57 && p_state <= 60 && state == "전남"){
			return true;
		}
		else if(p_state >= 61 && p_state <= 62 && state == "강원"){
			return true;
		}
		else if(p_state == 63 && state == "제주특별자치도"){
			return true;
		}
		else{
			document.getElementById("post_error").innerHTML = "도/시 와 우편번호가 일치하지 않습니다.";
			return false;
		}
		
	}

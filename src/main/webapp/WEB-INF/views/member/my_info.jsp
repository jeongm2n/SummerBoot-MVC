<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common.jsp"%>
	<meta charset="UTF-8">
	<title>내 정보</title>
	
	<% request.setCharacterEncoding("utf-8"); %>
	<%@ include file="../common/header.jsp" %>
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
	<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편번호검색 -->
	<script src="${path}/resources/assets/js/daumPostcode.js"></script>
	
	
	<script>
		function pwd_change(){
			window.open("${path}/member/pwd_change", "name(about:blank)", "width=600, height=600");
	 	}
		
		$(document).on('click', '#update' , function() {
		    if($("#tel1").val().length != 3 || $("#tel2").val().length != 4 || $("#tel3").val().length != 4){
		   		alert("올바른 휴대폰 번호를 입력하세요.");
		   		return;
		    } else if($("#email1").val().length == 0 || $("#email2").val().length == 0){
		   		alert("이메일을 입력하세요.");
		   		return;
		   	} else {
		   		alert("업데이트!!");
				document.getElementById("infoForm").submit();
		   	}
			
		});
		 
		function isSame() {
			$(".hidden").show();
			var pw = $('#new_pwd').val();
			var confirmPw = $('#new_pwd_check').val();
			if(pw !='' && confirmPw !=''){
				if(pw == confirmPw){
					$('#notice').text("일치!!");
					document.getElementById('notice').style.color = 'blue';
				}
				else{
					$('#notice').text("불일치!!");
					document.getElementById('notice').style.color = 'red';
				}
			}
		}
		
		$(document).ready(function() {
	        var message = "${msg}";
        	if (message == 888) {
	        	alert("정보 수정이 완료되었습니다.");
	            location.href="${path }/member/my_info";
	        } else if (message == 4) {
	        	alert("오류로 정보 수정에 실패하였습니다.");
	            location.href="${path }/member/my_info";
	        }
	    });
		
	</script>

</head>
<body> 
	<div class="container py-5" id="wrap" style="margin-top:10%;">
       	<div class="col-lg-6 m-auto ">
	       	<h2 class="h2 text-center border-bottom border-2 pb-3" style="padding-top: 5.5rem!important;">내 정보</h2>
       	</div>
        <div class="row py-5">
            <form class="col-md-6 m-auto" method="post" role="form" id="infoForm" action="info_update">
	        	<c:forEach var="my_info" items="${my_info }">
	            	<div class="input-group mb-3">
		                <label for="inputsubject" class="title">아이디</label>
	                    <input type="text" class="form-control mt-1" id="id" name="id" value="${my_info.id }" disabled>
	                </div>
	                
	                <div class="input-group mb-3">
	                    <label for="inputname" class="title">비밀번호</label>
	                    <input type="password" class="form-control mt-1" id="pwd" name="pwd" placeholder="PASSWORD" disabled>
	                    <div class="input-group-text btn-washboot mt-1" id="pwd_change" onclick="pwd_change();" style="cursor:pointer;">변경</div>
	                </div>
	                
	                <div class="input-group mb-3">
	                    <label for="inputsubject" class="title">이름</label>
	                    <input type="text" class="form-control mt-1" id="name" name="name" value="${my_info.mem_name }" disabled>
	                </div>
	                
	                <c:set var="phone" value="${fn:split(my_info.tel,'-')}" />
	                <div class="input-group mb-3">
	                    <label for="inputsubject" class="title">휴대폰</label>
	                    <input type="text" class="form-control mt-1 tel col-md-1" id="tel1" name="tel1" value="${phone[0] }">
                    	<span style="padding:2%">-</span>
	                    <input type="text" class="form-control mt-1 tel col-md-1" id="tel2" name="tel2" value="${phone[1] }">
                    	<span style="padding:2%">-</span>
	                    <input type="text" class="form-control mt-1 tel col-md-1" id="tel3" name="tel3" value="${phone[2] }">
	                </div>
	                
	                <c:set var="email" value="${fn:split(my_info.email,'@')}" />
	                <div class="input-group mb-3">
	                    <label for="inputsubject" class="title">이메일</label>
	                    <input type = "text" class="form-control mt-1" name="email1" id="email1" value = "${email[0] }">
	                    <span style="padding:8px;">@</span>
	                    <input type = "text" class="form-control mt-1" name="email2" id="email2" value = "${email[1] }">
	                </div>
	                <div class="input-group mb-3">
	                    <label for="inputsubject" class="title">이메일 수신 여부</label>
	                    <div id="chb">
		                    <input type = "checkbox" name="email_yn" id="email_yn" style="width:1.5em;height:1.5em;vertical-align:middle;" value="Y" <c:if test="${my_info.email_yn eq 'Y' }">checked</c:if>>
		                    <label for="email_yn" style="padding-left: 3px;">WashBoot에서 발송하는 e-mail을 수신합니다.</label>
	                    </div>
	                </div>
	                
	                <c:set var="addr" value="${fn:split(my_info.address,'/')}" />
	                <div class="input-group mb-3">
	                    <label for="inputsubject" class="title">주소</label>
						<button type="button" class="btn btn-washboot mt-1 search" onclick="execDaumPostcode();">주소찾기</button>
	                </div>
					<div class="input-group mb-3">
						<label for="inputsubject" class="title"></label>
						<div class="addr">
							<label class="addr-label">우편번호</label>
							<input type="text" class="form-control mt-1 addr-text col-md-2" id="zipcode" name="zipcode" value="${addr[0] }" pattern="[0-9]{5}" placeholder="우편번호 (숫자 5자리)" title="우편번호 (숫자 5자리)" maxlength="5" required>
						</div>
					</div>
					<div class="input-group mb-3">
						<label for="inputsubject" class="title"></label>
						<div class="addr">
							<label class="addr-label">도로명 주소</label>
							<input type="text" class="form-control mt-1 addr-text col-md-2" id="road_addr" name="road_addr" value="${addr[1] }" placeholder="도로명 주소" title="도로명 주소" required>
						</div>
					</div>
					<div class="input-group mb-3">
						<label for="inputsubject" class="title"></label>
						<div class="addr">
							<label class="addr-label">나머지 주소</label>
							<input type="text" class="form-control mt-1 addr-text" id="rest_addr" name="rest_addr" value="${addr[2] }">
						</div>
					</div>
	                
	                <div class="input-group mb-3">
	                    <label for="inputsubject" class="title">적립금</label>
	                    <input type="text" class="form-control mt-1" id="point" name="point" value="${my_info.point }" disabled>
	                </div>
	                
	                <div class="row">
	                    <div class="col text-center mt-2">
	                        <button type="button" class="btn btn-washboot btn-lg px-3" id="update">수정</button>
	                    </div>
	                </div>
                </c:forEach>
            </form>
        </div>
    </div>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>

<style>
	.title {
		width: 136px;
	    padding-top: 2%;
	    margin-right:2%;
	}
	.search {
		border-radius : 0;
	}
	#chb{
		padding-top:2%;
	    margin-left: 2%;
	}
	.h2{font-family: 'IBM Plex Sans KR', sans-serif;font-size: 2em !important;font-weight:500!important;}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="../common/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/assets/css/use_lee.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script>
	function fn_overlapped(){
	    if($("#id").val().length == 0){
	   	 alert("ID를 입력하세요");
	   	 return;
	    }
	     
	    var _id = $("#id").val();
	    
	    $.ajax({
	       type:"post",
	       async:false,  
	       url:"${contextPath}/member/overlapped.do",
	       dataType:"text",
	       data: {id:_id},
	       success:function (data,textStatus){
	    	  $(".notice_id").show();
	          if(data=='usable'){
	        	  $('#notice_id').text("사용가능");
				  document.getElementById('notice_id').style.color = 'blue';
				  $("#overlap_check").val("true");
	          }else{
	        	  $('#notice_id').text("사용불가능");
				  document.getElementById('notice_id').style.color = 'red';
	          }
	       },
	       error:function(data,textStatus){
	          alert("에러가 발생했습니다.");
	       },
	       complete:function(data,textStatus){
	       }
	    });
	 }
	
	$(document).on('click', '#join' , function() {
		if($("#id").val().length == 0){
	   		alert("아이디를 입력하세요.");
	   		return;
	   	} else if($("#pwd").val().length == 0) {
	   		alert("비밀번호를 입력하세요.");
	   		return;
	   	} else if($("#check_pwd").val().length == 0){
	   		alert("비밀번호확인 입력하세요.");
	   		return;
	   	} else if($("#name").val().length == 0) {
	   		alert("이름을 입력하세요.");
	   		return;
	   	} else if($("#tel1").val().length != 3 || $("#tel2").val().length != 4 || $("#tel3").val().length != 4){
	   		alert("올바른 휴대폰 번호를 입력하세요.");
	   		return;
	   	} else if($("#overlap_check").val() == "false"){
	   		alert("아이디 중복확인을 하세요.");
	   		return;
	   	} else {
	   		alert($("#name").val());
			document.getElementById("joinForm").submit();
	   	}
	});
	 
	function isSame() {
		$(".hidden").show();
		var pw = $('#pwd').val();
		var confirmPw = $('#check_pwd').val();
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
	
	function changeID() {
		$("#overlap_check").val("false");
		document.getElementById('notice_id').style.display = 'none';
	}
</script>

</head>
<body> 
	<div class="container py-5" id="wrap">
       	<div class="col-lg-6 m-auto ">
	       	<h2 class="h2 text-center border-bottom pb-3" style="padding-top: 5.5rem!important;">회원가입</h2>
       	</div>
        <div class="row py-5">
            <form class="col-md-6 m-auto" method="post" role="form" id="joinForm" action="regist">
            	<div class="input-group mb-3">
	                <label for="inputsubject" class="title">아이디</label>
                    <input type="text" class="form-control mt-1" id="id" name="id" placeholder="ID" value="dool" oninput="changeID();">
                    <div class="input-group-text btn-washboot mt-1" id="checkID" onclick="fn_overlapped();">중복확인</div>
                    <div><input type="hidden" value="false" id="overlap_check"></div>
                </div>
                <div class="mb-3 notice_id" id = "notice_id" style="display : none; padding-left:30%;">
                	<span id="notice_id"></span>
                </div>
                
                <div class="input-group mb-3">
                    <label for="inputname" class="title">비밀번호</label>
                    <input type="password" class="form-control mt-1" id="pwd" name="pwd" placeholder="PASSWORD" value="1111">
                </div>
                <div class="input-group mb-3">
                    <label for="inputemail" class="title">비밀번호 확인</label>
                    <input type="password" class="form-control mt-1" id="check_pwd" name="check_pwd" placeholder="PASSWORD" oninput="isSame();">
                </div>
                <div class="mb-3 hidden" style="display : none; padding-left:30%;"> <!-- 비밀번호확인 일치 여부 알림 표시 -->
                	<label></label>
                	<span id="notice"></span>
                </div>
                
                <div class="input-group mb-3">
                    <label for="inputsubject" class="title">이름</label>
                    <input type="text" class="form-control mt-1" id="name" name="name" placeholder="NAME" value="둘리">
                </div>
                <div class="input-group mb-3">
                    <label for="inputsubject" class="title">휴대폰</label><br>
                    <input type="text" class="form-control mt-1 tel col-md-1" id="tel1" name="tel1" placeholder="PHONE" value="010">
                    <span style="padding:2%">-</span>
                    <input type="text" class="form-control mt-1 tel2 col-md-2" id="tel2" name="tel2" placeholder="PHONE" value="1111">
                    <span style="padding:2%">-</span>
                    <input type="text" class="form-control mt-1 tel2 col-md-2" id="tel3" name="tel3" placeholder="PHONE" value="1111">
                </div>
                <div class="row">
                    <div class="col text-center mt-2">
                        <button type="button" class="btn btn-washboot btn-lg px-3" id="join">회원가입</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>

<style>
.title {
	width: 30%;
    padding-top: 2%;
}
</style>
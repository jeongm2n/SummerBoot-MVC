<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>

<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="../common/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script>
	$(document).on('click', '#update' , function() {
		if($("#pwd").val().length == 0) {
	   		alert("기존 비밀번호을 입력하세요.");
			return;
		} else if($("#new_pwd").val().length == 0){
	   		alert("새 비밀번호을 입력하세요.");
	   		return;
		} else if($("#new_pwd_check").val().length == 0) {
	   		alert("새 비밀번호 확인을 입력하세요.");
	   		return;
		} else {
			document.getElementById("pwdForm").submit();
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
        if(message == 4){
       		alert("기존 비밀번호가 일치하지않습니다.");
        }
    });
</script>

</head>
<body> 
	<div class="container py-5" id="wrap">
       	<div class="col-lg-6 m-auto ">
	       	<h2 class="h2 text-center border-bottom pb-3" style="padding-top: 5.5rem!important;">비밀번호 변경</h2>
       	</div>
        <div class="row py-5 pwd">
            <form class="col-md-6 m-auto" method="post" role="form" id="pwdForm" action="pwd_update">
                <div class="input-group mb-3">
                    <label for="inputname" class="title">기존 비밀번호</label>
                    <input type="password" class="form-control mt-1" id="pwd" name="pwd" placeholder="PASSWORD">
                </div>
                <div class="input-group mb-3">
                    <label for="inputemail" class="title">새 비밀번호</label>
                    <input type="password" class="form-control mt-1" id="new_pwd" name="new_pwd" placeholder="NEW PASSWORD">
                </div>
                <div class="input-group mb-3">
                    <label for="inputemail" class="title">새 비밀번호 확인</label>
                    <input type="password" class="form-control mt-1" id="new_pwd_check" name="new_pwd_check" placeholder="NEW PASSWORD CHECK" oninput="isSame();">
                </div>
                <div class="mb-3 hidden" style="display : none; padding-left:30%;"> <!-- 비밀번호확인 일치 여부 알림 표시 -->
                	<label></label>
                	<span id="notice"></span>
                </div>
                
                <div class="row">
                    <div class="col text-center mt-2">
                        <button type="button" class="btn btn-washboot btn-lg px-3" id="update">수정</button>
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
	width: 35%;
    padding-top: 2%;
}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common.jsp"%>
<meta charset="UTF-8">
<title>로그인</title>

<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">

<script>
	$(document).on('click', '#login' , function() {
	   if($("#id").val().length == 0){
	   		alert("아이디를 입력하세요.");
	   	} else if($("#pwd").val().length == 0) {
	   		alert("비밀번호를 입력하세요.");
	   	} else {
		   document.getElementById("loginForm").submit();
	   	}
	});
	
	$(document).on('click', '#join' , function() {
	   location.href = "join";
	});
	
	$(document).ready(function() {
        var message = "${msg}";
        if ("${msg}" != '') { //로그인 실패 시 로그인 실패 알림
            alert(message);
        }
    });
	function findID() {
		window.open("${path}/member/findID", "name(about:blank)", "width=600, height=600");
	}
	
	function findPW() {
		window.open("${path}/member/findPW", "name(about:blank)", "width=600, height=600");
	}
</script>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="container py-5" id="wrap" style="margin-top:10%;">
       	<div class="col-lg-6 m-auto ">
	       	<h2 class="h2 text-center border-bottom border-2 pb-3" style="padding-top: 5.5rem!important;">로그인</h2>
       	</div>
        <div class="row py-5" style="padding-bottom: 2rem !important;">
            <form class="col-md-4 m-auto" method="post" role="form" id="loginForm" action="login.do">
            	<div class="input-group mb-3">
                    <input type="text" class="form-control mt-1" id="id" name="id" placeholder="ID" value="dool">
                </div>
                
                <div class="mb-3">
                    <input type="password" class="form-control mt-1" id="pwd" name="pwd" placeholder="PASSWORD" value="1111">
                </div>
                
                <div class="row">
                    <div class="col text-center mt-2">
                        <button type="button" class="btn btn-washboot btn-lg px-3" id="login">로그인</button>
                   		<button type="button" class="btn btn-join btn-lg px-3" id="join">회원가입</button>
                    </div>
                </div>
            </form>
        </div>
        <div style="text-align:center;font-size:18px !important;">
        	<span onclick="findID()" style="cursor:pointer;">아이디찾기</span>
        	<span> | </span>
        	<span onclick="findPW()" style="cursor:pointer;">비밀번호찾기</span>
        </div>
    </div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>

<style>
	.h2{font-family: 'IBM Plex Sans KR', sans-serif;font-size: 2em !important;font-weight:500!important;}
	button{font-family: 'IBM Plex Sans KR', sans-serif;}
</style>

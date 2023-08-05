<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${path}/resources/assets/css/use_lee.css">

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
</script>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="container py-5" id="wrap">
       	<div class="col-lg-6 m-auto ">
	       	<h2 class="h2 text-center border-bottom pb-3" style="padding-top: 5.5rem!important;">로그인</h2>
       	</div>
        <div class="row py-5">
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
    </div>
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>


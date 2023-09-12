<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>

<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="../common.jsp"%>
<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">

<script>

	$(document).on('click', '#findPW', function() {
	    var _id = $("#id").val();
	    var _name = $("#name").val();
	    var _tel = $("#tel1").val() + "-" + $("#tel2").val() + "-" + $("#tel3").val();
	    
	    if(_id.length == 0) {
		   	alert("이름을 입력하세요");
		   	return;
	    } else if(_name.length == 0){
		   	alert("이름을 입력하세요");
		   	return;
	    } else if(_tel.length != 13){
	   		alert("올바른 휴대폰 번호를 입력하세요.");
	   		return;
	    }
	    
	    $.ajax({
	       type:"get",
	       async:false,  
	       url:"${path}/member/findPW.do",
	       dataType:"text",
	       data: {id:_id, name:_name, tel:_tel},
	       success:function (data){
	    	   if(data == "change") {
	    		   location.href = "${path}/member/pwChange?id="+_id;
	    	   } else {
	    		   $('#notice').text(data);
	    	   }
	       },
	       error:function(data,textStatus){
	          alert("에러가 발생했습니다.");
	       }
		});
	});
</script>

</head>
<body> 
	<div class="container py-5" id="wrap">
       	<div class="col-lg-6 m-auto ">
	       	<h2 class="text-center border-bottom pb-3" style="padding-top: 5.5rem!important;font-weight:500;font-size: 2.5rem;">비밀번호 찾기</h2>
       	</div>
        <div class="row py-5 pwd">
            <form class="col-md-6 m-auto">
                <div class="input-group mb-3">
                    <label for="inputname" class="title">아이디</label>
                    <input type="text" class="form-control mt-1" id="id">
                </div>
                <div class="input-group mb-3">
                    <label for="inputname" class="title">이름</label>
                    <input type="text" class="form-control mt-1" id="name">
                </div>
                <div class="input-group mb-3">
                    <label for="inputsubject" class="title">휴대폰</label><br>
                    <input type="text" class="form-control mt-1 tel col-md-1" id="tel1">
                    <span style="padding:2%">-</span>
                    <input type="text" class="form-control mt-1 tel2 col-md-2" id="tel2">
                    <span style="padding:2%">-</span>
                    <input type="text" class="form-control mt-1 tel2 col-md-2" id="tel3">
                </div>
                <div class="row">
                    <div class="col text-center mt-2">
                        <input type="button" id="findPW" class="btn btn-washboot" value="찾기">
                    </div>
                </div>
            </form>
            <div style="margin-top:4%;text-align:center;">
            	<span id="notice" style="color:red;"></span>
            </div>
        </div>
    </div>
</body>
</html>

<style>
.title {
	width: 25%;
    padding-top: 2%;
}

body, span, h2 {font-family: 'IBM Plex Sans KR', sans-serif;}
</style>
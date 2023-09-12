<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>결제 취소</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <style>
    	modal-body{color:#858796 !important}
    </style>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_Yang.css">
    <script src="${path}/resources/assets/js/pay/input.js"></script>
    
    <style>
    .cancel{
		width: auto;
		height: auto;
		margin-top: 5px;
		padding: 0px 5px !important;
		font-size: 15px;
		font-weight: 400;
		padding: 0px;
		border: 1px solid #FD8008;
		color: #FD8008;
		border-radius: 5px;
		background-color: white;
	}
	.cancel:hover{
		background-color: #FD8008;
		color: white;
	}
    </style>
</head>
<body>
	<form name="trackingform" id="trackingform" method=POST>
	    <label for="bank" class="Inform_label">운송장 번호를 입력하세요!</label>
	 	  <div class="input_type1">
	 	    <input type="text" name="tracking" id="tracking" class="_input text" pattern="\d*" maxlength='18' required required title="숫자만 입력해주세요!">
	      <label class="input_label" for="tracking">운송장 번호</label>
	      <span class="input_span"></span>
	 	  </div>
	   <button type="button" class="cancel" id="submitBtn" style="margin-left:5px">입력</button>
	</form>
	
<script>
	$(document).ready(function() {
	    $("#submitBtn").click(function() {
	    	add_tracking();
	    });
	});
	
	function add_tracking() {
		let formData = new FormData($("#trackingform")[0]);
		
		$.ajax({
			type: "POST",
			url: "${path}/admin/order/add_tracking/${order_num}",
			data: formData,
		 	processData: false,
		 	contentType: false,
			success: function(response) {
			    console.log("운송장 입력이 완료되었습니다.");
			    opener.parent.location.reload();
			    window.close();
			    },
			error: function(xhr) {
			    console.log("에러가 발생했습니다: " + xhr.responseText);
			    alert("에러가 발생했습니다: " + xhr.responseText);
			}
		});
	}
</script>
</body>
</html>
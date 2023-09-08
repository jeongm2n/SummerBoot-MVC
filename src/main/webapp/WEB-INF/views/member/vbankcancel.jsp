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
	<form name="refundform" id="refundform" method=POST>
	    <label for="bank" class="Inform_label">환불 받을 계좌 정보</label>
	 	  <div class="input_type1">
	 	    <select name="bank" id="bank" class="_input select" required>
	 	      <option key="default-empty" hidden></option>
	 	      <option value="04">KB국민은행</option>
		      <option value="23">SC제일은행</option>
		      <option value="39">경남은행</option>
		      <option value="34">광주은행</option>
		      <option value="03">기업은행</option>
		      <option value="11">NH농협은행</option>
		      <option value="31">대구은행</option>
		      <option value="32">부산은행</option>
		      <option value="02">산업은행</option>
		      <option value="37">전북은행</option>
		      <option value="07">수협은행</option>
		      <option value="71">우체국</option>
		      <option value="20">우리은행</option>
		      <option value="81">하나은행</option>
		      <option value="88">신한은행</option>
		      <option value="89">케이뱅크</option>
		      <option value="92">토스뱅크</option>
		      <option value="45">새마을금고</option>
	 	    </select>
	      <label class="input_label">은행명</label>
	      <span class="input_span"></span><br>
	 	  </div>  
	 	  <div class="input_type1">
	 	    <input type="text" name="name" id="name" class="_input text" pattern="[가-힣]+" maxlength='10' required title="한글만 입력해주세요!">
	      <label class="input_label" for="name">환불 받을 계좌의 예금주</label>
	      <span class="input_span"></span>
	 	  </div>
	 	  <div class="input_type1">
	 	    <input type="text" name="account" id="account" class="_input text" pattern="\d*" maxlength='15' required title="숫자만 입력해주세요!">
	      <label class="input_label" for="account">환불 계좌 계좌번호(-없이)</label>
	      <span class="input_span"></span>
	 	  </div>
	 	  <div class="input_type1">
	 	    <input type="text" name="tel" id="tel" class="_input text" pattern="\d*" maxlength='11' required required title="숫자만 입력해주세요!">
	      <label class="input_label" for="tel">예금주의 전화번호(-없이)</label>
	      <span class="input_span"></span>
	 	  </div>
	   <button type="button" class="cancel" id="submitBtn">취소 요청</button>
	</form>
	
<script>
	$(document).ready(function() {
	    $("#submitBtn").click(function() {
	    	requestRefund();
	    });
	});
	
	function requestRefund() {
		let formData = new FormData($("#refundform")[0]);
		
		$.ajax({
			type: "POST",
			url: "${path}/member/requestrefund/${order_num}",
			data: formData,
		 	processData: false,
		 	contentType: false,
			success: function(response) {
			    console.log("환불 요청이 완료되었습니다.");
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
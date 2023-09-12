<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<%@ include file="../common.jsp"%>
	<title>Payment</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_Yang.css">
</head>
<body oncontextmenu="return false">
<!-- 헤더파일 -->
	<%@ include file="../common/header.jsp"%>
	
    <div style="height: 500px; width: 100%;">
    	<div style="height: 500px; width:1000px; position: relative; margin: auto;">
    		<div style=" width: 100%; position: absolute; top: 45%; text-align: center;">
    			<h1 id="complete">주문 ${merchant_uid}이 결제 완료되었습니다.</h1>
    			<span id="qr" style="font-size:15pt"></span><br>
    			<input type=button value="메인페이지로" onclick="location.href = '${path}'" >
    		</div>
    	</div>
    </div>
<!--     푸터 -->
	<%@ include file="../common/footer.jsp"%>
    
    <script>
	function noEvent() {
	    if (event.keyCode == 116) {
	        event.keyCode= 2;
	        return false;
	    }
	    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
	    {
	        return false;
	    }
	}
	document.onkeydown = noEvent;

    history.pushState(null, null, "http://localhost:8060/summerboot2/pay/pay_after");
    
    window.onpopstate = function(event) {
    history.go(1);
    };
    
    var referrer = document.referrer;
    
    $(function(){	
    	if(referrer.includes('reservation_pay')){
    		const h1 = document.getElementById('complete');
    		h1.innerText='';
    		h1.innerText='예약 ${merchant_uid}이 결제 완료되었습니다.'
		  const element1 = document.getElementById('qr');
 		  element1.innerText = "나의예약현황에서 QR코드를 확인하세요!!!";
    	}
  })
    </script>
</body>
</html>
 
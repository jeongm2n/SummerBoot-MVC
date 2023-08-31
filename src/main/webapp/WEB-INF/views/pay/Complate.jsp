<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    			<h1>주문 ${merchant_uid}이 결제 완료되었습니다.</h1>
    			<input type=button value="메인페이지로" onclick="location.href = '../'" >
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

    history.pushState(null, null, "http://localhost:8060/pay/pay_after");
    
    window.onpopstate = function(event) {
    history.go(1);
    };
    </script>
</body>
</html>
 
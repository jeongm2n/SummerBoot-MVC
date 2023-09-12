<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>계좌 확인</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>
<body>

	<div class="account_inform">
        <!-- Payment Information -->
        <p><strong>환불 받을 계좌 은행 : </strong> <span>${bank_name }</span></p>
        <p><strong>예금주 : </strong> <span>${account.refundname }</span></p>
        <p><strong>계좌 번호 : </strong> <span>${account.refundaccount }</span></p>
        <p><strong>전화 번호 : </strong> <span>${account.refundtel }</span></p>
      </div>
      <div class="btn">
        <button type="button" style = "width: 30px;height: 20px;font-size: 10px;padding: 0px;border: 1px solid #FD8008;color: #FD8008;border-radius: 5px;background-color: white;"onclick="closePopup();">닫기</button>
      </div>
<script>

function closePopup() {
	window.close();
}
</script>
</body>
</html>
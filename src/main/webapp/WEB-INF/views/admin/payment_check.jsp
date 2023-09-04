<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>payment_check</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        
</head>
<body>
	<div class="modal-body">
        <!-- Payment Information -->
        <p><strong>결제 수단:</strong> <span>${pay_method }</span></p>
        <c:if test = '${pay_method eq "무통장 입금"}'>
        <p><strong>예금주:</strong> <span>${vbank_name }</span></p>
        <p><strong>입금 계좌 번호:</strong> <span>${vbank_num }</span></p>
        <p><strong>입금 기한:</strong> <span>${vbank_num }</span></p>
        </c:if>
      </div>
      <div class="modal-footer">
        <button type="button" style = "width: 30px;height: 20px;font-size: 10px;padding: 0px;border: 1px solid #FD8008;color: #FD8008;border-radius: 5px;background-color: white;"onclick="closePopup();">닫기</button>
      </div>
<script>
function closePopup() {
	window.close();
}
</script>
</body>
</html>
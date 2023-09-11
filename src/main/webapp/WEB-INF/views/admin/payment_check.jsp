<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>payment_check</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <style>
    	.modal-body{margin:10% auto;}
    	.pay-title {width:50%;text-align:right;padding-right:4%;border-right:1px solid #858796;}
    	.pay-info{padding-left:2%;}
    	table{border-top:2px solid black;border-collapse:collapse;border-spacing:0;margin:0 auto;width:75%;font-size:17px;}
    	td{border-bottom:1px solid #858796;}
    	h2{
    		width: 75%;
		    margin: 9% auto;
		    margin-bottom: 1%;
		    padding-left: 3%;
   		}
    </style>
    
</head>
<body>
	<div class="modal-body">
        <!-- Payment Information -->
        <h2>구매자 정보</h2>
		<table>
			<tr>
				<td class="pay-title">구매자 이름</td><td class="pay-info">${payment.buyer_name }</td>
			</tr>
			<tr>
				<td class="pay-title">구매자 전화번호</td><td class="pay-info">${payment.buyer_tel }</td>
			</tr>
		</table>
		<h2>결제 정보</h2>
		<table>
			<tr>
				<td class="pay-title">결제 수단</td><td class="pay-info">${payment.pay_method }</td>
			</tr>
			<c:if test = '${payment.pay_method eq "카드 결제"}'>
				<tr>
					<td class="pay-title">카드사</td><td class="pay-info">${payment.card_name }</td>
				</tr>
				<tr>
					<td class="pay-title">카드 번호</td><td class="pay-info">${payment.card_number }</td>
				</tr>
			</c:if>
			<c:if test = '${payment.pay_method eq "무통장 입금"}'>
				<tr>
					<td class="pay-title">예금주</td><td class="pay-info">${payment.vbank_name }</td>
				</tr>
				<tr>
					<td class="pay-title">입금 계좌 번호</td><td class="pay-info">${payment.vbank_num }</td>
				</tr>
				<tr>
					<td class="pay-title">입금 기한</td><td class="pay-info">${payment.vbank_date }</td>
				</tr>
			</c:if>
		</table>
		<div style="margin: 2% 44%">
	      	<button type="button" style = "width: 3rem;height: 1.5rem;font-size: 0.8rem;border: 1px solid #FD8008;color: #FD8008;border-radius: 6px;background-color: white;"onclick="closePopup();">닫기</button>
		</div>
      </div>
<script>
function closePopup() {
	window.close();
}
</script>
</body>
</html>
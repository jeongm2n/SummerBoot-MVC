<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Payment</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_Yang2.css">

</head>
<body>
	<%@ include file="../common/header.jsp"%>
    
	<div class="main">
      <div class="pay_inform">
        <div class="container">
          <div>
            <nav>
              <li class="head"><a href="#">장바구니</a></li>
    	      <li class="head">&nbsp;>&nbsp;<a href="#"><b>정보</b></a>&nbsp;>&nbsp;</li>
    	      <li class="head">결제</li>
            </nav>
          </div>
          <div class="payment">
			
          </div>
        </div>
      </div>
      <div class="pro_inform">
        <div class="container">
          <div class="product">
		  	<img src="${path}/resources/assets/img/bullsone.jpg" class="img">
		  	<a class="amount">x 1</a>
		  	<a class="name">불스원 유리 광택 클리너</a>
		  	<a class="price">10000원</a>
          </div>
          <div class="point">
            <label class="Label">포인트 사용</label>
            <a>보유포인트 : 1000pt</a>
            <input type="text" name="" id="" class="point_input" placeholder="포인트 사용" minlength='5' maxlength='10' required >
           	<button type="button" class="btn" onclick="">전액 사용</button><br>
          </div>
          <div class="total">
          	<a class="product_price">물품 가격 : 10000원</a><br>
            <a class="shipping">배송비 : 3000원</a><br>
            <a class="total_price">총 : 13000원</a>
          </div>
        </div>
      </div>
    </div>

	<%@ include file="../common/footer.jsp"%>
    
    
</body>
</html>
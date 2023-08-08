<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Payment</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_Yang.css">
</head>
<body>
	<%@ include file="../common/header.jsp"%>
    
    <div class="main row justify-content-md-center">
      <div class="add_inform col col-lg-7">
        <div class="container">
          <div>
            <nav>
              <li class="head"><a href="#">장바구니</a></li>
    	      <li class="head">&nbsp;>&nbsp;<b>정보</b>&nbsp;>&nbsp;</li>
    	      <li class="head">결제</li><br>
            </nav>
          </div>
          <div class="input">
          <form name="adressForm" action="../pay/payment" method=get onSubmit="">
            <div class="">
              <label for="phone" class="Inform_label">연락처</label><br>
              <input type="text" name="phone" id="phone" class="input_type1" placeholder="전화번호" minlength='5' maxlength='10' required ><br>
		  	  <input type="checkbox" name="sts" id="" value="동의" checked> sns 수신 동의<br><br>
              <label for="state" class="Inform_label">주소</label><br>
              <select name="state" id=state class="input_type1" onchange="setEmailDomain(this.value); return false;">
		  	    <option value=""disabled selected>-선택-</option>
	      	    <option value="경기도">경기도</option>
		  	    <option value="서울특별시">서울특별시</option>
		  	    <option value="강원특별자치도">강원도</option>
		  	    <option value="충청북도">충청북도</option>
		  	    <option value="충청남도">충청남도</option>
		  	    <option value="전라북도">전라북도</option>
		  	    <option value="전라남도">전라남도</option>
		  	    <option value="경상북도">경상북도</option>
		  	    <option value="경상남도">경상남도</option>
		  	    <option value="제주특별자치도">제주특별자치도</option>
		  	    <option value="부산광역시">부산광역시</option>
		  	    <option value="대구광역시">대구광역시</option>
		  	    <option value="인천광역시">인천광역시</option>
		  	    <option value="광주광역시">광주광역시</option>
		  	    <option value="대전광역시">대전광역시</option>
		  	    <option value="울산광역시">울산광역시</option>
		  	    <option value="세종특별자치시">세종특별자치시</option>
		   	  </select><br>
		   	  <input type="text" name="" id="" class="input_type1" placeholder="이름" minlength='2' maxlength='10' required ><br>
		   	  <input type="text" name="" id="" class="input_type2" placeholder="우편번호" minlength='5' maxlength='6' required >
              <input type="text" name="" id="" class="input_type2" style="float: right" placeholder="시/군/구" minlength='5' maxlength='20' required ><br>
              <input type="text" name="" id="" class="input_type1" placeholder="도로명 주소" minlength='5' maxlength='20' required ><br>
              <input type="text" name="" id="" class="input_type1" placeholder="상세 주소(옵션)" minlength='5' maxlength='20' required ><br>
              <input type="checkbox" name="save_add" id="" value="동의" checked> 다음에도 동일한 주소 사용<br>
            </div>
            <input type="submit" class="sub" value="이 주소로 배송" >
          </form>
          </div>
        </div>
      </div>
      <div class="pro_inform col col-lg-5">
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
 
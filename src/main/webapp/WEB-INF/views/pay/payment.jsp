<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Payment</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_Yang.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_Yang2.css">
    
    <script src="${path}/resources/assets/js/inform.js"></script>

</head>
<body>
	<%@ include file="../common/header.jsp"%>
    
	<div class="main row justify-content-md-center">
      <div class="mobile_pro_inform col col-lg-5">
        <button type="button" class="collapsible" onclick="collapse(this);">상품 정보 <a>13000₩</a></button>
        <div class="content">
        <div class="container">
		  <div class="product">
		  	<img src="${path}/resources/assets/img/bullsone.jpg" class="img">
		  	<div style="float:right;">
		  	  <div class="text_box">
		  	    <a class="amount">x 1</a>
		  	  </div>
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">불스원 유리 광택 클리너</a>
		  	  </div>
		  	  <div class="text_box">
		  	    <a class="price">10000원</a>
		  	  </div>
		  	</div>
          </div>
          <div class="product">
		  	<img src="${path}/resources/assets/img/bullsone.jpg" class="img">
		  	<div style="float:right;">
		  	  <div class="text_box">
		  	    <a class="amount">x 1</a>
		  	  </div>
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">불스원 유리 광택 클리너</a>
		  	  </div>
		  	  <div class="text_box">
		  	    <a class="price">10000원</a>
		  	  </div>
		  	</div>
          </div>
          <div class="product">
		  	<img src="${path}/resources/assets/img/bullsone.jpg" class="img">
		  	<div style="float:right;">
		  	  <div class="text_box">
		  	    <a class="amount">x 1</a>
		  	  </div>
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">불스원 유리 광택 클리너</a>
		  	  </div>
		  	  <div class="text_box">
		  	    <a class="price">10000원</a>
		  	  </div>
		  	</div>
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
	  <div class="pay_inform col col-lg-7">
        <div class="container">
          <div>
            <nav>
              <li class="head"><a href="#">장바구니</a></li>
    	      <li class="head">&nbsp;>&nbsp;<a href="#"><b>정보</b></a>&nbsp;>&nbsp;</li>
    	      <li class="head">결제</li>
            </nav>
          </div>
          <div class="payment">
			<div class="">
			  <div class="chkadd">
			    <div class="inform" style="border-bottom: 1px solid #adb5bd;">
			      <div class="box">
			        <div class="tag">
			      	  <span class="text">연락처</span>
			        </div>
			        <div class="detail">
			          <span class="text">010-9725-6608</span>
			        </div>
			        <div class="c_btn">
			       	  <a class="btn_text" href="#">변경</a>
			        </div>
			      </div>
			    </div>
			    <div class="inform">
			      <div class="box">
			        <div class="tag">
			      	  <span class="text">주소</span>
			        </div>
			        <div class="detail">
			          <span class="text">경기도 군포시 고산로 151번길 26-23 110동 1001호</span>
			        </div>
			        <div class="c_btn">
			      	  <a class="btn_text" href="#">변경</a>
			        </div>
			      </div>
			    </div>
			  </div>
			  <form name="ㅔayment_select" action="?" method=get onSubmit="">
			    <div class="select_payment">
			      <div class="tabs">
    		  	    <input id="all" type="radio" name="tab_item" value="kg"checked>
    		  	    <label class="tab_item" style="border-top-left-radius: 10px;" for="all">카드결제</label>
    		  	    <input id="programming" type="radio" name="tab_item" value="no">
    		  	    <label class="tab_item" style="border-top-right-radius: 10px;" for="programming">무통장 입금</label>
    		  	    <div class="tab_content" id="all_content">
        	  	      결제하기 클릭시 카드결제 창이 실행됩니다. 
    		  	    </div>
    		  	    <div class="tab_content" id="programming_content">
        	  	  	  결제하기 클릭시 무통장 결제 창이 실행됩니다.
			  	    </div>
			  	  </div>
			  	  <input type="submit" class="sub" style="margin-top: 20px;" value="결제하기" >
			    </div>
			  </form>
			</div>
          </div>
        </div>
      </div>
      <div class="pc_pro_inform col col-lg-5">
        <div class="container">
		  <div class="product">
		  	<img src="${path}/resources/assets/img/bullsone.jpg" class="img">
		  	<div style="float:right;">
		  	  <div class="text_box">
		  	    <a class="amount">x 1</a>
		  	  </div>
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">불스원 유리 광택 클리너</a>
		  	  </div>
		  	  <div class="text_box">
		  	    <a class="price">10000원</a>
		  	  </div>
		  	</div>
          </div>
          <div class="product">
		  	<img src="${path}/resources/assets/img/bullsone.jpg" class="img">
		  	<div style="float:right;">
		  	  <div class="text_box">
		  	    <a class="amount">x 1</a>
		  	  </div>
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">불스원 유리 광택 클리너</a>
		  	  </div>
		  	  <div class="text_box">
		  	    <a class="price">10000원</a>
		  	  </div>
		  	</div>
          </div>
          <div class="product">
		  	<img src="${path}/resources/assets/img/bullsone.jpg" class="img">
		  	<div style="float:right;">
		  	  <div class="text_box">
		  	    <a class="amount">x 1</a>
		  	  </div>
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">불스원 유리 광택 클리너</a>
		  	  </div>
		  	  <div class="text_box">
		  	    <a class="price">10000원</a>
		  	  </div>
		  	</div>
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
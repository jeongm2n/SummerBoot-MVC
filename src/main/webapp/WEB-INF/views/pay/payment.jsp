<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Payment</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_Yang.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_Yang2.css">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    
    <script src="${path}/resources/assets/js/pay/collapse.js"></script> 
    
    <script>
	$(function(){
		if(${point eq null}) { document.getElementById("p_point_price").style.display = "none"; document.getElementById("m_point_price").style.display = "none";}
		else { document.getElementById("p_point_price").style.display = "block"; document.getElementById("m_point_price").style.display = "block";}
	})
	</script>
	
</head>
<body>
<!-- 	헤더 -->
	<%@ include file="../common/header.jsp"%>
    
<!--     부트스트랩 그리드 -->
	<div class="main row justify-content-md-center">
	<!--     모바일화면에서 or 작은 화면에서 보일 상품 정보 -->
      <div class="mobile_pro_inform col col-lg-5">
        <button type="button" class="collapsible" onclick="collapse(this);">상품 정보 <a>${total_price}₩</a></button>
        <div class="content">
        <div class="container">
        <c:forEach var="product" items="${product}" varStatus="status">
		  <div class="product">
		  	<img src="${path}/resources/assets/img/${product.img}" class="img">
		  	<div style="float:right;">
		  	  <div class="text_box">
		  	    <a class="amount">x ${product.quantity}</a>
		  	  </div>
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">${product.name}</a>
		  	  </div>
		  	  <div class="text_box">
		  	    <a class="price">${product.price}원</a>
		  	  </div>
		  	</div>
          </div>
        </c:forEach>
          <div class="total">
          	<a class="price">물품 가격 : + ${product_price}원</a><br>
			<a class="price">배송비 : + ${shipping_price}원</a><br>
			<a class="point_price" id="m_point_price">포인트 : - ${point}원</a><br>
            <a class="total_price">총 : ${total_price}원</a>
          </div>
        </div>
      </div>
      </div>
	  <div class="pay_inform col col-lg-7">
        <div class="container">
          <div>
            <nav>
              <li class="head"><a href="../cart/my_cart">장바구니</a></li>
    	      <li class="head"><a href="inform">&nbsp;>&nbsp;<b>정보</b></a>&nbsp;>&nbsp;</li>
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
			          <span class="text">${C_Inform[0]}</span>
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
			          <span class="text">${C_Inform[1]}</span>
			        </div>
			        <div class="c_btn">
			      	  <a class="btn_text" href="#">변경</a>
			        </div>
			      </div>
			    </div>
			  </div>
			  <label for="payment_select" class="Inform_label" style="margin-top: 50px;">결제 수단</label><br>
			  <label style="font-size: 0.7rem !important; ">모든 거래는 안전하고 암호화됩니다.</label>
			  <form name="payment_select" action="?" method=get onSubmit="">
			    <div class="select_payment">
			      <div class="tabs">
    		  	    <input id="all" type="radio" name="tab_item" value="kg"checked>
    		  	    <label class="tab_item" style="border-top-left-radius: 10px;" for="all">카드로 결제</label>
    		  	    <input id="programming" type="radio" name="tab_item" value="no">
    		  	    <label class="tab_item" style="border-top-right-radius: 10px;" for="programming">무통장 입금</label>
    		  	    <div class="tab_content" id="all_content">
        	  	      "결제하기"를 클릭하면 안전하게 구매를 완료할 수 있도록 카드결제 창으로 이동합니다.
    		  	    </div>
    		  	    <div class="tab_content" id="programming_content">
        	  	  	  "결제하기"를 클릭하면 안전하게 구매를 완료할 수 있도록 무통장 입금 창으로 이동합니다.
			  	    </div>
			  	  </div>
			  	  <input type="submit" class="sub" style="margin-top: 20px;" value="결제하기" >
			    </div>
			  </form>
			</div>
          </div>
        </div>
      </div>
      <!--       pc or 큰화면에서 보일 제품 정보 -->
      <div class="pc_pro_inform col col-lg-5">
        <div class="container">
        <c:forEach var="product" items="${product}" varStatus="status">
		  <div class="product">
		  	<img src="${path}/resources/assets/img/${product.img}" class="img">
		  	<div style="float:right;">
		  	  <div class="text_box">
		  	    <a class="amount">x ${product.quantity}</a>
		  	  </div>
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">${product.name}</a>
		  	  </div>
		  	  <div class="text_box">
		  	    <a class="price">${product.price}원</a>
		  	  </div>
		  	</div>
          </div>
        </c:forEach>
          <div class="total">
          	<a class="price">물품 가격 : + ${product_price}원</a><br>
			<a class="price">배송비 : + ${shipping_price}원</a><br>
			<a class="point_price" id="p_point_price">포인트 : - ${point}원</a><br>
            <a class="total_price">총 : ${total_price}원</a>
          </div>
        </div>
      </div>
    </div>
    
<!-- 	백엔드 제작 중 -->
	
	
	
<!-- 	푸터 -->
	<%@ include file="../common/footer.jsp"%>
    
    
</body>
</html>
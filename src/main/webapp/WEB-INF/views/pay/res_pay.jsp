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
    
    <script src="${path}/resources/assets/js/pay/collapse.js"></script> 
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
    <script>
    let type;
    
    $(document).ready(function() {
        $('label[for="card"]').click(function() {
        	type = "card"
        });
        $('label[for="vbank"]').click(function() {
        	type = "vbank"
          });
      });
    
    var IMP = window.IMP; 
    IMP.init('imp30806126');
    
    let today = new Date();   
    
    let year = today.getFullYear().toString().substr(2, 2); // 년도
    let month = today.getMonth() + 1;  // 월
    let date = today.getDate();  // 날짜
    let hours = today.getHours(); // 시
    let minutes = today.getMinutes();  // 분
    let seconds = today.getSeconds();  // 초
    let milliseconds = today.getMilliseconds(); //밀리세컨
    
    let makeMerchantUid = year + month + date + hours +  minutes + seconds + milliseconds;
    
    let productname = "";
    <c:forEach var="product" items="${product}" varStatus="status">
    	productname += "${product.name}" + ",";
    </c:forEach>
    productname = productname.slice(0, -1);
    
    let total_price = ${price};;
    let u_point = 0;
    
    function requestPay() {
        IMP.request_pay({
            pg : 'INIpayTest',
            pay_method : type,
            //무통장!  vbank 
            merchant_uid: "WB" + makeMerchantUid, 
     	    name : productname,
            amount : total_price - u_point,
            buyer_tel : '${B_Inform[0]}',
            buyer_email : '${B_Inform[1]}',
            buyer_addr : '${B_Inform[2]}',
            buyer_postcode : '${B_Inform[3]}',
            buyer_name : '${B_Inform[4]}'
        }, function(res) {
            // 결제검증
            $.ajax({
                type : "POST",
                url : "/verifyIamport/" + res.imp_uid
            }).done(function(data) {
                if(res.paid_amount == data.response.amount){
                    alert("결제 및 결제검증완료");
//                     let link = '/../pay/pay_after/' + "WB" + makeMerchantUid  + "," + '${point}';
                    location.href = link;
                } else {
                    alert("결제 실패");
                }
            });
        });
    }
    
	function limiter(input){
		if (input.value < 0) input.value = 0;
		if (input.value > ${point}) input.value = ${point};
	}
	
    $(function(){
		  const element = document.getElementById('total_price');
		  element.innerText = total_price;
    	if(${u_point eq 0}){
    		document.getElementById("m_point_price").style.display = "none";
    		document.getElementById("p_point_price").style.display = "none";
    		document.getElementById("m_total_price").style.display = "none";
    		document.getElementById("p_total_price").style.display = "none";
    	}
    })
    
    function point(){
    	u_point = document.getElementById("p_point_price");
    	const element1 = document.getElementById('m_point');
    	const element2 = document.getElementById('p_point');
    	const element3 = document.getElementById('m_total_price');
    	const element4 = document.getElementById('p_total_price');
    	element1.innerHTML = u_point;
    	element2.innerHTML = u_point;
    	element3.innerText = total_price - u_point;
    	element4.innerText = total_price - u_point;
	}
    
    
    
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
		  <div class="product">
		  	<img src="${path}/resources/assets/img/${img}" class="img" >
		  	<div style="float:right;">
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">${name}/${reservation.res_date}/${reservation.site}번자리/${reservation.startTime} ~ ${reservation.endTime}</a>
		  	  </div>
		  	</div>
          </div>
          <div class="point" id="M_point">
            <label class="Label">포인트 사용</label>
            <a>보유포인트 : ${point}pt</a>
            <input type="number" name="m_point" id="m_point" class="point_input" placeholder="포인트 사용" onchange="limiter(this);" required>
           	<button type="button" class="btn" onclick="point()">포인트 사용</button><br>
          </div>
          <div class="total">
          	<a class="price">예약 가격 : + ${price}원</a><br>
			<a class="point_price" id="m_point_price">포인트 : - <div id="m_point">원</a><br>
            <a class="total_price" id="p_total_price">총 : <div id="m_total_price"></div>원</a>
          </div>
        </div>
      </div>
      </div>
	  <div class="pay_inform col col-lg-7">
        <div class="container">
          <div>
            <nav>
    	      <li class="head"><a href="back_inform"><b>예약 선택</b></a>&nbsp;>&nbsp;</li>
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
			          <span class="text">${B_Inform[0]}</span>
			        </div>

			      </div>
			    </div>
			    <div class="inform" style="border-bottom: 1px solid #adb5bd;">
			      <div class="box">
			        <div class="tag">
			      	  <span class="text">이메일</span>
			        </div>
			        <div class="detail">
			          <span class="text">${B_Inform[1]}</span>
			        </div>
			        <div class="c_btn">
			      	  <a class="btn_text" href="back_inform">변경</a>
			        </div>
			      </div>
			    </div>
			    <div class="inform">
			      <div class="box">
			        <div class="tag">
			      	  <span class="text">주소</span>
			        </div>
			        <div class="detail">
			          <span class="text">${B_Inform[2]}</span>
			        </div>
			        <div class="c_btn">
			      	  <a class="btn_text" href="back_inform">변경</a>
			        </div>
			      </div>
			    </div>
			  </div>
			  <label for="payment_select" class="Inform_label" style="margin-top: 50px;">결제 수단</label><br>
			  <label style="font-size: 0.7rem !important; ">모든 거래는 안전하고 암호화됩니다.</label>
			  <form name="payment_select" action="?" method=get onSubmit="">
			    <div class="select_payment">
			      <div class="tabs">
    		  	    <input id="card" type="radio" name="tab_item" checked>
    		  	    <label class="tab_item" style="border-top-left-radius: 10px;" for="card">카드로 결제</label>
    		  	    <input id="vbank" type="radio" name="tab_item">
    		  	    <label class="tab_item" style="border-top-right-radius: 10px;" for="vbank">무통장 입금</label>
    		  	    <div class="tab_content" id="card_content">
        	  	      "결제하기"를 클릭하면 안전하게 구매를 완료할 수 있도록 카드결제 창으로 이동합니다.
    		  	    </div>
    		  	    <div class="tab_content" id="vbank_content">
        	  	  	  "결제하기"를 클릭하면 안전하게 구매를 완료할 수 있도록 무통장 입금 창으로 이동합니다.
			  	    </div>
			  	  </div>
			  	  <input type="button" class="sub" style="margin-top: 20px;" onclick="requestPay()" value="결제하기" >
			    </div>
			  </form>
			</div>
          </div>
        </div>
      </div>
      <!--       pc or 큰화면에서 보일 제품 정보 -->
      <div class="pc_pro_inform col col-lg-5">
        <div class="container">
		  <div class="product">
		  	<img src="${path}/resources/assets/img/${product.img}" class="img">
		  	<div style="float:right;">
		  	  <div class="text_box" style="text-align: center;">
		  	    <a class="name">${product.name}</a>
		  	  </div>
		  	  <div class="text_box">
		  	    <a class="price">${product.price}원</a>
		  	  </div>
		  	</div>
          </div>
          <div class="point" id="P_point">
            <label class="Label">포인트 사용</label>
            <a>보유포인트 : ${point}pt</a>
            <input type="number" name="p_point" id="p_point" class="point_input" placeholder="포인트 사용" onchange="limiter(this);" required>
           	<button type="button" class="btn" onclick="point()">포인트 사용</button><br>
          </div>
          <div class="total">
          	<a class="price">물품 가격 : + ${product_price}원</a><br>
			<a class="point_price" id="p_point_price">포인트 : - <div id="p_point">원</a><br>
            <a class="total_price" id="p_total_price">총 : <div id="p_total_price">원</a>
          </div>
        </div>
      </div>
    </div>
    
	
	
<!-- 	푸터 -->
	<%@ include file="../common/footer.jsp"%>
    
</body>
</html>
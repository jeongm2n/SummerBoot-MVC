<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="../common.jsp"%>
	<title>Payment</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_Yang.css">
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
    <script src="${path}/resources/assets/js/pay/collapse.js"></script> 
    <script src="${path}/resources/assets/js/pay/adress.js"></script>
    <script src="${path}/resources/assets/js/pay/input.js"></script>
    
	<script>
	
	$(document).ready( function propChange(){
	$("#state").val("${inform.state}").prop("selected", true);
	});
	
	function limiter(input){
		if (input.value < 0) input.value = 0;
		if (input.value > ${inform.point}) input.value = ${inform.point};
	}
	</script>
</head>
<body>
<!-- 헤더파일 -->
	<%@ include file="../common/header.jsp"%>
    
    
<!--     부트스트랩 그리드 -->
    <div class="main row justify-content-md-center">
<!--     모바일화면에서 or 작은 화면에서 보일 상품 정보 -->
      <div class="mobile_pro_inform col col-lg-5">
        <button type="button" class="collapsible" onclick="collapse(this);">상품 정보 <a>가격 : 계산중</a></button>
        <div class="content">
        <div class="container">
        <c:forEach var="product" items="${product}" varStatus="status">
		  <div class="product">
		  	<img src="${path}/resources/assets/product/${product.img}" class="img" >
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
          <div class="point" id="M_point">
            <label class="Label">포인트 사용</label>
            <a>보유포인트 : ${inform.point}pt</a>
            <input type="number" name="m_point" id="m_point" class="point_input" placeholder="포인트 사용" min="0" max="${inform.point}" onchange="limiter(this);" required>
           	<button type="button" class="btn" onclick="all_point(${inform.point})">전액 사용</button><br>
          </div>
          <div class="total">
          	<a class="price">물품 가격 : + ${product_price}원</a><br>
			<a class="price">배송비 : 계산 중</a><br>
          </div>
        </div>
      </div>
    </div>
      <div class="add_inform col col-lg-7">
        <div class="container">
          <div>
            <nav>
              <li class="head"><a href="../cart/my_cart">장바구니</a></li>
    	      <li class="head">&nbsp;>&nbsp;<b>정보</b>&nbsp;>&nbsp;</li>
    	      <li class="head">결제</li><br>
            </nav>
          </div>
          <div class="input">
          <form name="addressForm" action="payment" method=get onSubmit="return valid();">
            <div class="">
              <label for="phone" class="Inform_label">연락처</label>
              <div class="input_type1">
                <input type="text" name="tel" id="tel" class="_input text" pattern="\d*" maxlength='11' value="${inform.tel}" required title="숫자만 입력해주세요!">
    	        <label class="input_label" for="phone">전화번호 ( -제외 )</label>
    	        <span class="input_span"></span>
		   	  </div>
		  	  <div class="input_type1">
                <input type="text" name="email" id="email" class="_input text" maxlength='20' value="${inform.email}" required title="숫자만 입력해주세요!">
    	        <label class="input_label" for="phone">이메일 ( 직접입력 )</label>
    	        <span class="input_span"></span>
		   	  </div>
		   	  <span id='email_error' class='error'></span>
		   	  <div class="chkbox" id="s_chkbox">
		  	    <input type="checkbox" name="snssts" id="snssts" value="동의" checked> 
		  	    <label for=snssts>sns 수신 동의</label>
		  	  </div>
		  	  <br><br><br>
              <label for="state" class="Inform_label">주소</label>
              <button type="button" class="add_btn" onclick="execDaumPostcode()">주소 검색</button>
		   	  <div class="input_type1">
		   	    <select name="state" id="state" class="_input select" required>
		   	      <option key="default-empty" hidden></option>
		   	      <option value="경기">경기도</option>
		  	      <option value="서울">서울특별시</option>
		  	      <option value="강원특별자치도">강원특별자치도</option>
		  	      <option value="충북">충청북도</option>
		  	      <option value="충남">충청남도</option>
		  	      <option value="전북">전라북도</option>
		  	      <option value="전남">전라남도</option>
		  	      <option value="경북">경상북도</option>
		  	      <option value="경남">경상남도</option>
		  	      <option value="제주특별자치도">제주특별자치도</option>
		  	      <option value="부산">부산광역시</option>
		  	      <option value="대구">대구광역시</option>
		  	      <option value="인천">인천광역시</option>
		  	      <option value="광주">광주광역시</option>
		  	      <option value="대전">대전광역시</option>
		  	      <option value="울산">울산광역시</option>
		  	      <option value="세종특별자치시">세종특별자치시</option>
		   	    </select>
    	        <label class="input_label">-도/시-</label>
    	        <span class="input_span"></span><br>
		   	  </div>  
		   	  <div class="input_type1">
		   	    <input type="text" name="name" id="name" class="_input text" pattern="[가-힣]+" maxlength='10' value="${inform.name}" required title="한글만 입력해주세요!">
    	        <label class="input_label" for="name">이름</label>
    	        <span class="input_span"></span>
		   	  </div>
		   	  <div class="input_type2">
		   	  <input type="text" name="postcode" id="postcode" class="_input text" pattern="\d*" maxlength='5' value="${inform.postcode}" required title="한글만 입력해주세요!">
    	        <label class="input_label" for="postcode">우편번호</label>
    	        <span class="input_span"></span>
		   	  </div>
    	        <span id='error' class='post_error'></span>
		   	  <div style="display : flex; justify-content: flex-start;">
		   	    <div class="input_type2" style="margin-right: 1%;">
                  <input type="text" name="city" id="city" class="_input text" pattern="[가-힣\s]+" value="${inform.city}" title="한글만 입력해주세요!">
    	          <label class="input_label" for="city">시/군/구</label>
    	          <span class="input_span"></span>
		   	    </div>
		   	    <div class="input_type2">
                  <input type="text" name="town" id="town" class="_input text" pattern="[가-힣]+" value="${inform.town}" required title="한글만 입력해주세요!">
    	          <label class="input_label" for="town">동/읍/면</label>
    	          <span class="input_span"></span>
		   	    </div>
		   	  </div>
		   	  <div class="input_type1">
                <input type="text" name="street_add" id="street_add" class="_input text" maxlength='20' value="${inform.street_add}" required>
    	        <label class="input_label" for="street_add">도로명 주소</label>
    	        <span class="input_span"></span>
		   	  </div>
		   	  <div class="input_type1">
                <input type="text" name="option_add" id="option_add" class="_input text" maxlength='20' value="${inform.option_add}">
    	        <label class="input_label" for="option_add">상세 주소(옵션)</label>
    	        <span class="input_span"></span>
		   	  </div>
		   	  <div class="chkbox" id="a_chkbox" style="margin-top: 3px;">
                <input type="checkbox" name="save_add" id="save_add" value="동의" checked>
                <label for="save_add">다음에도 동일한 주소 사용</label>
                <br>
		   	  </div>
            </div>
            <input type="hidden" name="h_point" id="h_point">
            <input type="hidden" name="h_f_point" id="h_f_point" value = "${inform.point}">
            <input type="submit" class="sub_btn" value="이 주소로 배송" >
          </form>
          </div>
        </div>
      </div>
<!--       pc or 큰화면에서 보일 제품 정보 -->
      <div class="pc_pro_inform col col-lg-5">
        <div class="container">
        <c:forEach var="product" items="${product}" varStatus="status">
		  <div class="product">
		  	<img src="${path}/resources/assets/product/${product.img}" class="img" >
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
          <div class="point" id="P_point">
            <label class="Label">포인트 사용</label>
            <a>보유포인트 : ${inform.point}pt</a>
            <input type="number" name="p_point" id="p_point" class="point_input" placeholder="포인트 사용" min="1" max="${inform.point}" onchange="limiter(this);" required>
           	<button type="button" class="btn" onclick="all_point(${inform.point})">전액 사용</button><br>
          </div>
          <div class="total">
          	<a class="price">물품 가격 : + ${product_price}원</a><br>
			<a class="price">배송비 : 계산 중</a><br>
          </div>
        </div>
      </div>
    </div>
      
<!--     푸터 -->
	<%@ include file="../common/footer.jsp"%>
    
        
    <script>
    $("#p_point").keydown(function(){ $('#m_point').val($(this).val()); $('#h_point').val($(this).val()); });
    $("#p_point").change(function(){ $('#m_point').val($(this).val()); $('#h_point').val($(this).val()); });
    $("#m_point").keydown(function(){ $('#p_point').val($(this).val()); $('#h_point').val($(this).val()); });
    $("#m_point").change(function(){ $('#p_point').val($(this).val()); $('#h_point').val($(this).val()); });
	</script>
</body>
</html>
 
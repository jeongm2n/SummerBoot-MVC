<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="../common.jsp"%>
	<title>check_purchase</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        
    <link rel="stylesheet" href="${path}/resources/assets/css/chkMypur.css">

</head>
<body>
<!-- 	헤더 -->
	<%@ include file="../common/header.jsp"%>
	
	
	<c:choose>
    <c:when test="${empty orderList}">
	  <span style="text-align:center;">주문이 없습니다.</span>
	</c:when>
	<c:when test="${!empty orderList }">
      <c:forEach var="num" items="${orderNum}">
      <div style="text-align:center">
	  <div class="pur_inform">
	    <c:forEach var="list" items="${orderList}">
	    <c:if test="${num eq list.order_num}">
	      <c:if test="${list.pur_date != null}">
	      <div class="top">
	        <span class="order_num">${list.order_num}</span>
	        <c:choose>
	          <c:when test='${list.status eq "paid"}'><span class="status" style="background-color: salmon;">결제 완료</span></c:when>
		      <c:when test='${list.status eq "ready"}'><span class="status" style="background-color: skyblue;">입금 대기 중</span></c:when>
		      <c:when test='${list.status eq "cancelled"}'><span class="status" style="background-color: grey;">결제 취소</span></c:when>
		      <c:when test='${list.status eq "취소 요청"}'><span class="status" style="background-color: darkgrey;">취소 요청</span></c:when>
		      <c:when test='${list.status eq "배송 준비중"}'><span class="status" style="background-color: darkkhaki;">배송 준비중</span></c:when>
		      <c:when test='${list.status eq "배송중"}'><span class="status" style="background-color: mediumaquamarine;">배송중</span></c:when>
		      <c:when test='${list.status eq "배송 완료"}'><span class="status" style="background-color: #FD8008;">배송 완료</span></c:when>
	        </c:choose>
	        <button class="btn_popup" onclick="popup('${list.imp_uid}', '${list.pur_date}');">결제 정보 확인</button><br>
	        <span class="pur_date">${list.pur_date}</span>
		    <br>
		  </div>
	      </c:if>
	    <div class="inform">
	      <div class="product">
	        <img src="${path}/resources/assets/product/${list.img}" class="img" >
	  	  	<div style="float:right;">
	  	  	  <div class="text_box">
	  	  	    <span class="amount">x ${list.mount}</span>
	  	  	  </div>
	  	  	  <div class="text_box" style="text-align: center;">
	  	  	    <a class="name" href="${path}/shop/product/${list.product_id}">${list.product_name}</a>
	  	  	  </div>
	  	  	  <div class="text_box">
	  	  	    <span class="price">${list.price}원</span>
	  	  	  </div>
	  	  	</div>
            </div>
            <c:if test="${review == null && list.status == '배송 완료'}">
	        <button type="button" class="review_btn" onclick="add_review('${list.product_id}', '${list.product_name}', '${list.img}' ,'${list.order_num}')">리뷰 작성</button>
	    	</c:if>
	    </div>
	    </c:if>
	    </c:forEach>
	    <c:forEach var="list" items="${orderList}">
	    <div class="pur_btn">
	      <c:if test="${num eq list.order_num && list.pur_date != null}">
	   	  <c:if test='${list.status eq "배송중" || list.status eq "배송 완료"}'><button type="button" class="tracking other_btn"> 배송 조회 </button></c:if>
	      <c:if test='${list.status ne "배송중" && list.status ne "배송 완료" && list.status ne "취소 요청" && list.status ne "cancelled"}'><button type="button" class="cancel" onclick="update_status('취소 요청','${num}')"> 주문 취소 </button></c:if>
	      </c:if>
	    </div>
	    </c:forEach>
	  </div>
	  </div>
	</c:forEach>
	</c:when>
	</c:choose>
	
	
<!-- 	푸터 -->
	<%@ include file="../common/footer.jsp"%>
    
    <script>
    function update_status(status, order_num){
		$.ajax({
			type:"get",
			async:false,  
			url:"${path}/member/update_status",
			dataType:"text",
			data: {
				status:status,
				order_num:order_num
			},
			success:function (){
				alert("취소 요청이 전달되었습니다.");
				window.location.reload();
			},
			error:function(request, error){
				alert("에러가 발생했습니다.");
			},
			complete:function(){
			}
		});
	}
    
	function popup(Imp_uid, Pur_date){
 	    let popUrl = "${path}/admin/order/check_payment/" + Imp_uid + "/" + Pur_date;
 	    let popOption = "width=450px,height=400px,top=300px,left=300px,scrollbars=yes";
 	    
 	    window.open(popUrl, "결제 내역", popOption);	
	}

    
 	function add_review(product_id, name, img, order_num) {
	 	let popUrl = "${path}/shop/review/" + product_id + "/" + name + "/" + img + "/" + order_num;
	 	let popOption = "width=450px,height=600px,top=300px,left=300px,scrollbars=yes";
	 	
	 	window.open(popUrl, "리뷰 작성", popOption);	
 	}
	</script>
</body>
</html>
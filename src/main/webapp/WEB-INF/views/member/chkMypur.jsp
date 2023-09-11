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
	<div class="container">
	<div class="card">
	<table class="table purtable"><caption>주문배송확인</caption>
		<c:choose>
	    <c:when test="${empty orderList}">
		<tr><td>주문이 없습니다.</td></tr>
		</c:when>
		<c:when test="${!empty orderList }">
	    <c:forEach var="num" items="${orderNum}">
		    <c:forEach var="list" items="${orderList}">
		    	<c:if test="${num eq list.order_num}">
		    		<c:if test="${list.pur_date != null}">
		    		<tbody class="tbody1">
		    		<tr><th colspan="4"><div class=row><div class="col-4"><b>주문번호: ${list.order_num}</b></div>
		    		<div class="col-4"><b>주문날짜: ${list.pur_date }</b></div>
					<div class="col"><button class="btn_popup" onclick="popup('${list.imp_uid}', '${list.pur_date}');">결제 정보 확인</button>
					</div></div>
					<c:choose>
						<c:when test="${list.review eq 1 && list.status != '배송 완료'}">
							<div class="col">
							<button type="button" class="review_btn text-decoration-line-through" style="font-size:12pt" disabled>리뷰 작성</button></div></c:when>
						<c:when test="${list.review eq 1 }">
							<div class="col">
						    <button type="button" class="review_btn" disabled>리뷰완료
						    <img class="chkimg" src="${path}/resources/assets/img/checked.png"></button></div>
						</c:when>
					</c:choose>
					</th></tr>
					</tbody>	
		    		</c:if>
		    		<tbody class="tbody2">
		    			<tr><td class="imgtd"><img src="${path}/resources/assets/product/${list.img}" class="img" ></td>
		    			<td class="td2"><span>상품명:</span> <a class="name" href="${path}/shop/product/${list.product_id}">${list.product_name}</a><br>
		    				<span>가격:</span> ${list.price}원<br>
		    				<span>수량:</span> ${list.mount}</td>
		    			<td class="td3">
			    		<c:choose>
						  <c:when test="${list.status eq 'paid'}">
						    <span class="status" style="background-color: salmon;">결제 완료</span>
						  </c:when>
						  <c:when test="${list.status eq 'ready'}">
						    <span class="status" style="background-color: skyblue;">입금</span><br>
						    <span class="status" style="background-color: skyblue;">대기중</span>
						  </c:when>
						  <c:when test="${list.status eq 'cancelled'}">
						    <span class="status" style="background-color: grey;">결제 취소</span>
						  </c:when>
						  <c:when test="${list.status eq '취소 요청'}">
						    <span class="status" style="background-color: darkgrey;">취소 요청</span>
						  </c:when>
						  <c:when test="${list.status eq '배송 준비중'}">
						    <span class="status" style="background-color: darkkhaki;">배송</span><br>
						    <span class="status" style="background-color: darkkhaki;">준비중</span>
						  </c:when>
						  <c:when test="${list.status eq '배송중'}">
						    <span class="status" style="background-color: mediumaquamarine;">배송중</span>
						  </c:when>
						  <c:when test="${list.status eq '배송 완료'}">
						    <span class="status" style="background-color: #FD8008;">배송 완료</span>
						  </c:when>
						</c:choose></td>
						<td class="td3">
						<c:choose>
				        <c:when test='${list.status ne "배송중" && list.status ne "배송 완료" && list.status ne "취소 요청" && list.status ne "cancelled"}'>
				          <c:choose> 
				            <c:when test='${list.paymethod eq "card"}'>
				              <button type="button" class="btn_popup" onclick="cardcancel('취소 요청','${list.order_num}')"> 주문 취소 </button>
				            </c:when>
				            <c:when test='${list.paymethod eq "vbank" && list.status eq "paid"}'>
				              <button type="button" class="btn_popup" onclick="vbankcancel('${list.order_num}')"> 주문 취소 </button>
				            </c:when>
				          </c:choose>
				        </c:when>
				      	</c:choose>
						</td>
						<td class="td3">
						<c:choose>
							<c:when test="${list.review ne 1 && list.status eq '배송 완료'}">
						        <button type="button" class="review_btn" onclick="add_review('${list.product_id}', '${list.product_name}', '${list.img}' ,'${list.order_num}')">리뷰 작성</button>
						    </c:when>
						</c:choose>
						</td></tr>
		    		</tbody>
		    	</c:if>
		    </c:forEach>
	    </tbody>
		</c:forEach>
		</c:when>
		</c:choose>
	</table>
	</div></div>
	
<!-- 	푸터 -->
	<%@ include file="../common/footer.jsp"%>
    
    <script>
    function cardcancel(status, order_num){
    	if(confirm("주문 취소 하시겠습니까?")){
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
					location.reload();
				},
				error:function(request, error){
					alert("에러가 발생했습니다.");
				},
				complete:function(){
				}
			});
    	}
	}
    
    function vbankcancel(order_num){
 	    let popUrl = "${path}/member/vbankcancel/" + order_num;
 	    let popOption = "width=450px,height=700px,top=300px,left=300px,scrollbars=yes";
 	    
 	    window.open(popUrl, "결제 취소", popOption);	
	}
    
	function popup(Imp_uid, Pur_date){
 	    let popUrl = "${path}/admin/order/check_payment/" + Imp_uid + "/" + Pur_date;
 	    let popOption = "width=450px,height=400px,top=300px,left=300px,scrollbars=yes";
 	    
 	    window.open(popUrl, "결제 내역", popOption);	
	}
    
 	function add_review(product_id, name, img, order_num) {
	 	let popUrl = "${path}/member/review/" + product_id + "/" + name + "/" + img + "/" + order_num;
	 	let popOption = "width=450px,height=600px,top=300px,left=300px,scrollbars=yes";
	 	
	 	window.open(popUrl, "리뷰 작성", popOption);	
 	}
	</script>
</body>
</html>
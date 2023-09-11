<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="../common.jsp"%>
	<title>check_purchase</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="../common/header.jsp"%>
    <link rel="stylesheet" href="${path}/resources/assets/css/chkMypur.css">
</head>
<body>
	<div class="container" style="margin-top:13%;margin-bottom:8em;padding:2%;">
		<div class="card" style="border:0;">
			<div style="border-bottom:3px solid black;"><h1 style="margin-bottom:1%;font-size:2rem;">주문배송확인</h1></div>
			<table class="table purtable">
				<thead>
					<tr id="pur-title">
						<td class="col-6" colspan=2>주문정보</td>
						<td class="col-3">주문상태</td>
						<td class="col-3"></td>
					</tr>
				</thead>
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
								    		<tr>
								    			<th colspan="4" style="vertical-align:middle;border-top: 2px solid gray;">
								    				<div class=row style="padding-left:2%;padding-right:2%;">
								    					<div class="col-3">주문번호 : <b>${list.order_num}</b></div>
								    					<div class="col-3">주문날짜 : <b>${list.pur_date}</b></div>
								    					<div class="col-4"></div>
														<div class="col-2" style="text-align:right;">
															<span id="payInfo" onclick="popup('${list.imp_uid}', '${list.pur_date}');">결제 정보 ></span>
														</div>
													</div>
												</th>
											</tr>
										</tbody>	
						    		</c:if>
						    		<tbody class="tbody2" style="vertical-align:middle;border-bottom: 1.7px solid #F4EEEE;">
						    			<tr>
						    				<td class="col-2" style="text-align:right;"><img src="${path}/resources/assets/product/${list.img}" class="img" ></td>
							    			<td class="col-5" style="font-size:18px;">
							    				<p>상품명 : <span class="name" onclick="location.href='${path}/shop/product/${list.product_id}';">${list.product_name}</span></p>
							    				<p >가격 : ${list.price}원  /  수량 : ${list.mount}개</p> 
						    				</td>
						    				<td class="col-3" style="text-align:center;">
												<c:choose>
													<c:when test="${list.status eq 'paid'}">
												   		<h4 style="color: #A2A378;">결제 완료</h4>
												  	</c:when>
												  	<c:when test="${list.status eq '배송 준비중'}">
												    	<h4 style="color: #A2A378;">배송 준비중</h4>
												  	</c:when>
												  	<c:when test="${list.status eq '배송중'}">
												    	<h4 style="color: #FD8008;">배송중</h4>
								    						<b>대한통운 : ${list.tracking}</b>
								  				  	</c:when>
													<c:when test="${list.status eq '배송 완료'}">
												  		<h4 style="color: black">배송 완료</h4>
												  			<b>대한통운 : ${list.tracking}</b>
												  	</c:when>
												  	<c:when test="${list.status eq 'ready'}">
													    <h4 style="color: #CF0A0A;">입금 대기 중</h4>
													</c:when>
													<c:when test="${list.status eq 'cancelled'}">
														<h4 style="color: lightgray;">결제 취소</h4>
													</c:when>
													<c:when test="${list.status eq '취소 요청'}">
												  		<h4 style="color: cornflowerblue;">취소 요청</h4>
													</c:when>
												</c:choose>
						    				</td>
											<td class="col-2 button-line">
												<c:if test="${list.review ne 1 && list.status eq '배송 완료'}">
													<div style="margin-bottom:1%;">
												        <button type="button" class="review_btn" onclick="add_review('${list.product_id}', '${list.product_name}', '${list.img}' ,'${list.order_num}')">리뷰작성</button>
													</div>
											    </c:if>											   
												<c:if test="${list.status eq 'paid' || list.status eq '배송 준비중' && list.paymethod eq 'card'}">
												  <c:choose>
													<c:when test="${list.paymethod eq 'card'}">
													  <div style="margin-bottom:1%;">
											          	<button style="border-radius:5px;border:1px solid grey;color:grey;" onclick="cardcancel('취소 요청','${list.order_num}')">주문취소</button>
													  </div>
													</c:when>
													<c:when test="${list.paymethod eq 'vbank'}">
													  <div style="margin-bottom:1%;">
											          	<button style="border-radius:5px;border:1px solid grey;color:grey;" onclick="vbankcancel('${list.order_num}')">주문취소</button>
													  </div>
													</c:when>
												  </c:choose>
											    </c:if>
												<div class="my-qna">
											        <button class="inquiry">문의하기</button>
												</div>
											</td>
										</tr>
						    		</tbody>
						    	</c:if>
						    </c:forEach>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
		</div>
	</div>
	
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
 	
 	$(document).on('click', '.inquiry', function() {
		 location.href = "${path}/community/qnaWrite"	;
 	})
	</script>
</body>
</html>

<style>
	tbody, td, tfoot, th, thead, tr{border-width:inherit;border-style: none;}
	span {font-size:18px;}
	p{margin-bottom:0.5rem;}
	button{height:1.8em;background-color:transparent;}
	button:focus {
	    border: none;
	    outline:none;
	}
	.inquiry{
	 	border-radius: 5px;
	 	border:1.3px solid grey;
	 	color:grey;
	}
	.button-line {
	 	text-align:right;
	 	padding-right:2rem !important;
	 	display:flex;
	 	flex-direction: column;
	 	width:100%; height:10em;
	 	justify-content: center;
	}
	#pur-title{
		text-align:center;
		font-size: 23px;
	    font-weight: 500;
	    padding: 0;
	    vertical-align: middle;
	}
</style>
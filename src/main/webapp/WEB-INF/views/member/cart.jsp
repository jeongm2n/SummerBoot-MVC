<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니</title>
	<%@ include file="../common.jsp"%>
	<% request.setCharacterEncoding("utf-8"); %>
	<%@ include file="../common/header.jsp" %>

	<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
	<script type="text/javascript" src="${path}/resources/assets/js/cart.js"></script>
</head>

<body>
	<c:set var="file_repo" value="/summerboot2/resources/assets/product/"/>
	<section class="bg-light" style="margin-top:10%;">
		<div class="container py-5">
			<div class="col-lg-12 align-items-stretch" id="cart" >
				<form id="cartForm" method="get" action="../pay/inform">
					<div class="card w-100 mb-4">
						<div class="card-body p-4">
							<div class="container text-center">
								<div style="display:flex;align-items: center;height:2.8em;border-top: 3px solid black;border-bottom: 1px solid #D8D9DA;">
									<div class="col-1">
										<input type="checkbox" checked onclick="allChk()" id="allC">
									</div>
									<div class="col-6">
										<h5 class="c-title">상품정보</h5>
									</div>
									<div class="col-2">
										<h5 class="c-title">수량</h5>
									</div>
									<div class="col-2">
										<h5 class="c-title">주문금액</h5>
									</div>
									<div class="col-1">
										<h5 class="c-title">삭제</h5>
									</div>
								</div>
								<c:choose>
				                  	<c:when test="${ empty my_cart }">
			                          <span>카트에 담긴 상품이 없습니다.</span>
		                  			</c:when>
		                  			<c:when test="${ !empty my_cart }">
										<c:forEach var="my_cart" items="${my_cart }" varStatus="i">
											<div style='display:flex;align-items:center;border-top:1px solid #D8D9DA;<c:if test="${!i.last }">border-bottom: 1px solid #D8D9DA;</c:if><c:if test="${i.last }">border-bottom: 1px solid black;</c:if>'>
												<div class="col-1">
													<input type="checkbox" name="chkbox" value="${my_cart.product_id }" class="chk" checked>
													<input type="hidden" name="product_id" value="${my_cart.product_id }" class="${my_cart.product_id }">
												</div>
												<div class="col-2" style="height: 11em;">
													<img class="product_img" src="${file_repo }${my_cart.img }">
												</div>
												<div class="col-4" style="align-self: flex-start;">
													<input type="hidden" name="product_img" value="${my_cart.img }" class="${my_cart.product_id }"> 
													<div style="font-family: 'IBM Plex Sans KR', sans-serif;text-align: left;padding-top: 7%;">
														<h5 class="fw-semibold mb-3" style="font-size:1.1rem;">${my_cart.name }</h5>
														<p style="font-size:17px !important;"><fmt:formatNumber value="${my_cart.price }" pattern="#,###원"/></p>
													</div>
													<input type="hidden" name="product_name" value="${my_cart.name }" class="${my_cart.product_id }">
												</div>
												<div class="col-2">
													<ul class="list-inline quan">
														<li class="list-inline-item"><span onclick="minus(${my_cart.product_id})"><i class="fa fa-minus" style="font-size:18px;cursor:pointer;"></i></span></li>
														<li class="list-inline-item"><span class="badge" id="${my_cart.product_id}-quan" style="font-size:17px;">${my_cart.quantity }</span></li>
														<li class="list-inline-item"><span onclick="plus(${my_cart.product_id})"><i class="fa fa-plus" style="font-size:18px;cursor:pointer;"></i></span></li>
													</ul>
													<input type="hidden" name="quantity" id="${my_cart.product_id}_hidden" value="${my_cart.quantity }" class="${my_cart.product_id }">
												</div>
												<div class="col-2">
													<input type="hidden" id="${my_cart.product_id}_price" value="${my_cart.price }">
													<h6 class="fw-semibold mb-0 fs-4" id="${my_cart.product_id}_sum" class="sum"><fmt:formatNumber value="${my_cart.price * my_cart.quantity}" pattern="#,###" /></h6>
													<input type="hidden" name="price" id="${my_cart.product_id}_pay" value="${my_cart.price * my_cart.quantity}" class="${my_cart.product_id }">
												</div>
												<div class="col-1">
													<img src="${path }/resources/assets/img/delete2.png" onclick="cart_delete(${my_cart.product_id});" style="cursor:pointer;"/>
												</div>
											</div>
										</c:forEach>
									</c:when>
	                  			</c:choose>
							</div>
						</div>
					</div>
				
					<div class="card w-100 mb-4" style="text-align: center;">
						<div class="card-body p-4">
							<div style="display:flex;align-items: center;height:2.8em;border-top: 3px solid black;border-bottom: 1px solid #D8D9DA;">
								<div class="col-3">
									<h6 class="fw-semibold mb-0" style="font-size: 1em;">구매 상품 금액</h6>
								</div>
								<div class="col-1">
								</div>
								<div class="col-3">
									<h6 class="fw-semibold mb-0" style="font-size: 1em;">배송비</h6>
								</div>
								<div class="col-1">
								</div>
								<div class="col-3">
									<h6 class="fw-semibold mb-0" style="font-size: 1em;">총 금액</h6>
								</div>
							</div>
							<div style="display:flex;align-items: center;height:4em;">
								<div class="col-3">
									<span id="sum" class="cart-span"></span>
								</div>
								<div class="col-1">
									<img src="${path }/resources/assets/img/add.png"/>
								</div>
								<div class="col-3">
									<span id="delivery" class="cart-span">3,000</span>
								</div>
								<div class="col-1">
									<img src="${path }/resources/assets/img/equal.png"/>
								</div>
								<div class="col-3">
									<span id="total" class="cart-span"></span>
									<input type="hidden" name="total" id="pay">
								</div>
							</div>
							<div align="center" style="margin-top:1%;">
								<input type="submit" class="btn btn-washboot" value="주문하기" style="width:8rem;" onclick="return pass();">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>

<script>
	function update(p_id, quan){ // 수량 변경시 db에 저장
		$.ajax({
			type:"post",
			async:false,  
			url:"${path}/cart/quantity",
			dataType:"text",
			data: {
				p_id:p_id,
				quantity:quan
			},
			success:function (){
			},
			error:function(request, error){
				alert("에러가 발생했습니다.");
				console.log("code : " + request.status + "\n" + "message : " + request.responseText +"\n" + "error : " + error	);
			},
			complete:function(){
			}
		});
	}
	
	function cart_delete(p_id){ // 장바구니에서 삭제
		$.ajax({
			type:"post",
			async:false,  
			url:"${path}/cart/delete",
			dataType:"text",
			data: {p_id:p_id},
			success:function (){
				$("#cart").load("${path}/cart/my_cart #cart", function(){total();});
			},
			error:function(request, error){
				alert("에러가 발생했습니다.");
				console.log("code : " + request.status + "\n" + "message : " + request.responseText +"\n" + "error : " + error	);
			}
		});
	}
</script>

<style>
	@media (min-width: 1400px) {
		.container, .container-lg, .container-md, .container-sm, .container-xl, .container-xxl {
		    max-width: 1400px;
		}
	}

	h5{margin-bottom:0;}
	h5, h6 {
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	.cart-span{
		font-size: 1.6em;
		font-weight: 500;
	}
	.c-title {
		font-family: 'IBM Plex Sans KR', sans-serif;
	    font-weight: 500;
	}
</style>

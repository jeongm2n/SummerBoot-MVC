<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Shop</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    
 	<link type="text/css" rel="stylesheet" href="${path}/resources/assets/css/slick.css"/>
 	<link type="text/css" rel="stylesheet" href="${path}/resources/assets/css/slick-theme.css"/>

 	<link type="text/css" rel="stylesheet" href="${path}/resources/assets/css/nouislider.min.css"/>


 	<link type="text/css" rel="stylesheet" href="${path}/resources/assets/css/style.css"/>
 	
 	<script>
 	function limiter(input){
		if (input.value <= 0) input.value = 1;
		if (input.value > ${product.amount}) input.value = ${product.amount};
	}
 	
 	$(document).ready( function perChange(){
 		if(!${review_count} == 0){
 			var five = ${s_review_count[4]} / ${review_count} * 100;
 			var four = ${s_review_count[3]} / ${review_count} * 100;
 			var three = ${s_review_count[2]} / ${review_count} * 100;
 			var two = ${s_review_count[1]} / ${review_count} * 100;
 			var one = ${s_review_count[0]} / ${review_count} * 100;
 			
            document.getElementById("five").style.width = five + "%";
            document.getElementById("four").style.width = four + "%";
            document.getElementById("three").style.width = three + "%";
            document.getElementById("two").style.width = two + "%";
            document.getElementById("one").style.width = one + "%";
 		}
 	});
 	
	function add_review(id,name,img){
		let popUrl = "/shop/review/" id + "/" + name + "/" + img;
		let popOption = "width = 450px, height=600px, top=300px, left=300px, scrollbars=yes";
		
 		window.open(popUrl,"리뷰 작성",popOption);	
	}
 	</script>
</head>

<body>
	<%@ include file="../common/header.jsp"%>

			<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- Product thumb imgs -->
			<div class="col-md-2  col-md-pull-5">
				<div id="product-imgs">
					<div class="product-preview">
						<img src="${path}/resources/assets/img/${product.img}">
					</div>

					<div class="product-preview">
						<img src="${path}/resources/assets/img/${product.img}">
					</div>

					<div class="product-preview">
						<img src="${path}/resources/assets/img/${product.img}">
					</div>

					<div class="product-preview">
						<img src="${path}/resources/assets/img/${product.img}">
					</div>
				</div>
			</div>
			<!-- /Product thumb imgs -->
			<!-- Product main img -->
			<div class="col-md-5 col-md-push-2" style="margin-bottom : 10px;">
				<div id="product-main-img">
					<div class="product-preview">
						<img src="${path}/resources/assets/img/${product.img}">
					</div>

					<div class="product-preview">
						<img src="${path}/resources/assets/img/${product.img}">
					</div>

					<div class="product-preview">
						<img src="${path}/resources/assets/img/${product.img}">
					</div>

					<div class="product-preview">
						<img src="${path}/resources/assets/img/${product.img}">
					</div>
				</div>
			</div>
			<!-- /Product main img -->


			<!-- Product details -->
			<div class="col-md-5">
				<div class="product-details">
					<h2 class="product-name">${product.name}</h2>
					<div>
						<div class="product-rating">
							<c:if test="${product.rating != 0}">
								<c:forEach var="i" begin = "1" end="${product.rating}">
									<i class="fa fa-star"></i>
								</c:forEach>
							</c:if>
						</div>
						<a class="review-link">${review_count} Review(s)</a>
					</div>
					<div>
						<c:if test="${product.amount != 0}">
							<h3 class="product-price">₩${product.price}</h3>
							<span class="product-available">In Stock</span>
						</c:if>
						<c:if test="${product.amount == 0}">
							<h3 class="product-price"><del class="product-old-price" style="font-size: 24px;">₩${product.price}</del></h3>
							<span class="product-unavailable">Out Of Stock</span>
						</c:if>
					</div>
					<p>${product.description}</p>
					
					<c:if test="${product.amount != 0}">
					<div class="add-to-cart">
						<div class="qty-label">
							수량
							<div class="input-number">
								<input type="number" id = "amount" value="1" onchange="limiter(this);">
								<span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
						</div>
						<button class="add-to-cart-btn" onclick="add_cart(${product.product_id}, ${product.amount});"><i class="fa fa-shopping-cart"></i> 카트에 추가</button>
					</div>
					</c:if>
					
					<ul class="product-links">
						<li>카테고리 : ${product.category}</li>
					</ul>
				</div>
			</div>
			<!-- /Product details -->

			<!-- Product tab -->
			<div class="col-md-12">
				<div id="product-tab">
					<!-- product tab content -->
					<div class="tab-content">
					    <div class="tab-label">
							설명
					    </div>
						<!-- tab1  -->
						<div id="tab1">
							<div class="row">
								<div class="col-md-12">
									<p style="text-align: center">${product.description}</p>
								</div>
							</div>
						</div>
						<!-- /tab1  --><a></a>
					    <button type="button" style="float:right;" onclick="add_review(${product.product_id}, ${product.name}, ${product.img})">리뷰 작성</button>
					    <div class="tab-label">
							최근 리뷰
					    </div>
					    <c:if test="${review_count != 0}">
						<!-- tab2  -->
						<div id="tab2">
							<div class="row">
								<!-- Rating -->
								<div class="col-md-4 rating-tab">
									<div id="rating">
										<div class="rating-avg"">
											<div class="rating-stars" style="margin-left:32px !important; width:auto !important">
												<c:if test="${product.rating != 0}">
												<c:forEach var="i" begin = "1" end="${product.rating}">
													<i class="fa fa-star"></i>
												</c:forEach>
												</c:if>
											</div>
											<span>${product.rating}</span>
										</div>
										<ul class="rating">
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="5">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div id="five"></div>
												</div>
												<span class="sum">${s_review_count[4]}</span>
											</li>
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="4">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div id="four"></div>
												</div>
												<span class="sum">${s_review_count[3]}</span>
											</li>
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="3">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div id="three"></div>
												</div>
												<span class="sum">${s_review_count[2]}</span>
											</li>
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="2">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div id="two"></div>
												</div>
												<span class="sum">${s_review_count[1]}</span>
											</li>
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="1">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div id="one"></div>
												</div>
												<span class="sum">${s_review_count[0]}</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- /Rating -->
								</c:if>
								<!-- Reviews -->
								<c:if test="${review_count eq 0}">
									<h5 style ="text-align:center;"> 리뷰가 없습니다. </h5>
								</c:if>
								<div class="col-md-8">
									<div id="reviews">
										<ul class="reviews">
										<c:if test="!${review_count eq 0}">
										<c:forEach var="review" items="${review}" begin="0" end="3">
											<li>
												<div class="review-heading">
													<h5 class="name">${review.member_id}</h5>
													<p class="date">${review.date}</p>
													<div class="review-rating">
														<c:forEach var="i" begin = "1" end="${review.point}">
														<i class="fa fa-star"></i>
														</c:forEach>
													</div>
												</div>
												<div class="review-body">
													<p>제품이 참 좋아요!</p>
													<c:if test="!${review.img eq null}">
													<img src="${path}/resources/assets/img/${review.img}" style="width:100px; height:100px;">
													</c:if>
												</div>
											</li>
										</c:forEach>
										</c:if>
										</ul>
									</div>
								</div>
								<!-- /Reviews -->
							</div>
						</div>
						<!-- /tab3  -->
					</div>
					<!-- /product tab content  -->
				</div>
			</div>
			<!-- /product tab -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->


	<%@ include file="../common/footer.jsp"%>
	
	<script src="${path}/resources/assets/js/shop/jquery.min.js"></script>
	<script src="${path}/resources/assets/js/shop/bootstrap.min.js"></script>
	<script src="${path}/resources/assets/js/shop/slick.min.js"></script>
	<script src="${path}/resources/assets/js/shop/nouislider.min.js"></script>
	<script src="${path}/resources/assets/js/shop/jquery.zoom.min.js"></script>
	<script src="${path}/resources/assets/js/shop/main.js"></script>


	<script>
	
	function add_cart(product_id, quantity){
		if(${id} == false){
			alert('로그인을 먼저 해주세요!');
		}
		else{
			let amount = document.getElementById('amount').value;
			$.ajax({
				type:"get",
				async:false,  
				url:"${Path}/shop/add_cart",
				dataType:"text",
				data: {
					product_id:product_id,
					quantity:quantity,
					amount:amount
				},
				success:function (){
					alert("장바구니에 추가되었습니다!");
				},
				error:function(request, error){
					alert("에러가 발생했습니다.");
				},
				complete:function(){
				}
			});
		}
	}
	</script>
	
	</body>
</html>
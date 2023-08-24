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
			<div class="col-md-5 col-md-push-2">
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
						<a class="review-link">10 Review(s)</a>
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
								<input type="number" value="1" onchange="limiter(this);">
								<span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
						</div>
						<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 카트에 추가</button>
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
						<!-- /tab1  -->
						
					    <div class="tab-label">
							리뷰
					    </div>
						<!-- tab2  -->
						<div id="tab2">
							<div class="row">
								<!-- Rating -->
								<div class="col-md-4 rating-tab">
									<div id="rating">
										<div class="rating-avg">
											<span>4.5</span>
											<div class="rating-stars">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
											</div>
										</div>
										<ul class="rating">
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="5">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div style="width: 80%;"></div>
												</div>
												<span class="sum">3</span>
											</li>
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="4">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div style="width: 60%;"></div>
												</div>
												<span class="sum">2</span>
											</li>
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="3">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div></div>
												</div>
												<span class="sum">0</span>
											</li>
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="2">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div></div>
												</div>
												<span class="sum">0</span>
											</li>
											<li>
												<div class="rating-stars">
													<c:forEach var="i" begin = "1" end="1">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div>
												<div class="rating-progress">
													<div></div>
												</div>
												<span class="sum">0</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- /Rating -->

								<!-- Reviews -->
								<div class="col-md-8">
									<div id="reviews">
										<ul class="reviews">
											<li>
												<div class="review-heading">
													<h5 class="name">양지민</h5>
													<p class="date">2023/08/24</p>
													<div class="review-rating">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star-o empty"></i>
													</div>
												</div>
												<div class="review-body">
													<p>제품이 참 좋아요!</p>
													<img src="${path}/resources/assets/img/${product.img}" style="width:100px; height:100px;">
												</div>
											</li>
											<li>
												<div class="review-heading">
													<h5 class="name">양지민</h5>
													<p class="date">2023/08/24</p>
													<div class="review-rating">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star-o empty"></i>
													</div>
												</div>
												<div class="review-body">
													<p>제품이 참 별로네요~</p>
													<img src="${path}/resources/assets/img/${product.img}" style="width:100px; height:100px;">
												</div>
											</li>
											<li>
												<div class="review-heading">
													<h5 class="name">양지민</h5>
													<p class="date">2023/08/24</p>
													<div class="review-rating">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star-o empty"></i>
													</div>
												</div>
												<div class="review-body">
													<p>제품이 참 적당해요</p>
													<img src="${path}/resources/assets/img/${product.img}" style="width:100px; height:100px;">
												</div>
											</li>
										</ul>
										<ul class="reviews-pagination">
											<li class="active">1</li>
											<li><a href="#">2</a></li>
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

	</body>
</html>
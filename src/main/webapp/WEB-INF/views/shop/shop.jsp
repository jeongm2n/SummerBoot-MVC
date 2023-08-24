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
	$(document).ready( function PageActive(){
		document.getElementById('${n_page}').className = 'active';
		});
	
	$(document).ready( function CategoryActive(){
		document.getElementById('${category}').className = 'active';
		});

	
	$(document).ready( function (){
		$("#sort").change(function(){
			let sort = $(this).val();
			location.href="/shop/main/${category},1," + sort;
		})
	});
	
	$(document).ready( function sortChange(){
		$("#sort").val("${sort}").prop("selected", true);
		});
	
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
					<!-- ASIDE -->
					<div id="aside" class="col-md-3">
						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title" style="font-weight:600;">카테고리</h3>
							<div class="category_menu">
								<ul>
								  <li><a id="전체" href="/shop/main/전체,1,${sort}">전체</a></li>
								<c:forEach var="category" items="${type_category}">
								  <li><a id="${category}" href="/shop/main/${category},1,${sort}">${category}</a></li>
								</c:forEach>
								</ul>
							</div>
						</div>
						<!-- /aside Widget -->
					</div>
					<!-- /ASIDE -->

					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- store top filter -->
						<div class="store-filter clearfix">
							<div class="store-sort">
								<label>
									정렬 방식:
									<select id="sort" class="input-select">
										<option value="0">기본</option>
										<option value="1">가나다순</option>
										<option value="2">높은 가격순</option>
										<option value="3">낮은 가격순</option>
									</select>
								</label>
							</div>
						</div>
						<!-- /store top filter -->
						<!-- store products -->
						<div class="row">
						<c:forEach var="product" items="${productVO}" begin = "${b_page}"  end="${e_page}">
							<!-- product -->
							<div class="col-md-4 col-xs-6" style="min-width:280px;">
								<div class="product">
									<div class="product-img">
										<img src="${path}/resources/assets/img/${product.img}">
									</div>
									<div class="product-body">
										<h3 class="product-name"><a href="../product/${product.product_id}">${product.name}</a></h3>
										<c:if test="${product.amount == 0}">
											<h4 class="product-price">품절<br><del class="product-old-price">₩${product.price}</del></h4>
										</c:if>
										<c:if test="${product.amount != 0}">
											<h4 class="product-price">₩${product.price}</h4>
										</c:if>
										<div class="product-rating">
										<c:if test="${product.rating != 0}">
											<c:forEach var="i" begin = "1" end="${product.rating}">
												<i class="fa fa-star"></i>
											</c:forEach>
										</c:if>
										</div>
									</div>
									<c:if test="${product.amount != 0}">
									<div class="add-to-cart">
										<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 카트에 추가</button>
									</div>
									</c:if>
								</div>
							</div>						
							<!-- /product -->
						</c:forEach>

						</div>
						<!-- /store products -->

						<!-- store bottom filter -->
						<div class="store-filter clearfix">
							<span class="store-qty">Showing 9 products</span>
							<ul class="store-pagination">
								<c:forEach var="i" begin = "1" end="${page}">
								<li id="${i}"><a href="/shop/main/${category},${i},1">${i}</a></li>
								</c:forEach>
							</ul>
						</div>
						<!-- /store bottom filter -->
					</div>
					<!-- /STORE -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

	<%@ include file="../common/footer.jsp"%>


	</body>
</html>
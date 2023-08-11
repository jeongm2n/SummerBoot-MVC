<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니</title>
	
	<% request.setCharacterEncoding("utf-8"); %>
	<%@ include file="../common/header.jsp" %>
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
</head>

<body>
	<section class="bg-light">
		<div class="container py-5">
			<div class="col-lg-12 align-items-stretch" id="cart" >
				<form id="cartForm" method="post" action="check">
					<div class="card w-100 mb-4">
						<div class="card-body p-4">
							<div class="container text-center">
								<c:forEach var="my_cart" items="${my_cart }">
									<div class="row row_cart" style="margin-bottom:2%;">
										<div class="col-1">
											<input type="checkbox" name="chkbox" value="${my_cart.product_id}" class="chk" checked>
											<input type="hidden" name="product_id" value="${my_cart.product_id }" class="${my_cart.product_id }">
										</div>
										<div class="col-5 cart_list">
											<img class="product_img" src="${path}/resources/assets/img/${my_cart.img }" width="20px;">
											<h6 class="fw-semibold mb-1">${my_cart.name }</h6>
											<input type="hidden" name="product_name" value="${my_cart.name }" class="${my_cart.product_id }">
										</div>
										<div class="col-2">
											<ul class="list-inline quan">
												<li class="list-inline-item"><span onclick="minus(${my_cart.product_id})"><i class="fa fa-minus" style="font-size:12px;"></i></span></li>
												<li class="list-inline-item"><span class="badge" id="${my_cart.product_id}-quan">${my_cart.quantity }</span></li>
												<li class="list-inline-item"><span onclick="plus(${my_cart.product_id})"><i class="fa fa-plus" style="font-size:12px;"></i></span></li>
											</ul>
											<input type="hidden" name="quantity" id="${my_cart.product_id}_hidden" value="${my_cart.quantity }" class="${my_cart.product_id }">
										</div>
										<div class="col-1 delete">
											<input type="button" class="btn btn-join" value="삭제" onclick="cart_delete(${my_cart.product_id});" style="padding: 1% 10%;font-size: 15px !important;">
										</div>
										<div class="col-3">
											<input type="hidden" id="${my_cart.product_id}_price" value="${my_cart.price }">
											<h6 class="fw-semibold mb-0 fs-4" id="${my_cart.product_id}_sum" class="sum"><fmt:formatNumber value="${my_cart.price * my_cart.quantity}" pattern="#,###" /></h6>
											<input type="hidden" name="price" id="${my_cart.product_id}_pay" value="${my_cart.price * my_cart.quantity}" class="${my_cart.product_id }">
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				
					<div class="card w-100 mb-4">
						<div class="card-body p-4">
							<div class="container text-center">
								<div class="row pay">
									<div class="col-8" style="text-align:right;">
										<h6 class="fw-semibold mb-0">구매 상품 금액</h6>
									</div>
									<div class="col-3" style="text-align:right;">
										<div class="cost">
											<span id="sum"></span>
										</div>
									</div>
									<div class="col-1">
									</div>
								</div>
								<div class="row pay">
									<div class="col-8" style="text-align:right;">
										<h6 class="fw-semibold mb-0">배송비</h6>
									</div>
									<div class="col-3" style="text-align:right;">
										<div class="cost">
											<span id="delivery">3000</span>
										</div>
									</div>
									<div class="col-1">
									</div>
								</div>
								<div class="row" style="justify-content: center;">
									<div class="col-10"><hr></div>
								</div>
								<div class="row pay">
									<div class="col-8" style="text-align:right;">
										<h6 class="fw-semibold mb-0">총 금액</h6>
									</div>
									<div class="col-4" style="text-align:right;">
										<div class="cost">
											<span id="total"></span>
											<input type="hidden" name="total" id="pay">
										</div>
									</div>
								</div>
							</div>
							<div align="center" style="margin-top:3%;">
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
	$(document).ready(function() {
		total();
	});

	function minus(id) {
		var val = $("#"+id+"-quan").html();
		val = (val=='1')?val:val-1;
		$("#"+id+"-quan").html(val);
		$("#"+id+"_hidden").val(val);
		
		var price = document.getElementById(id + "_price").value;
		$("#"+id+"_sum").html((price*val).toLocaleString('ko-KR'));
		$("#"+id+"_pay").val((price*val));
		update(id, val);
		total();
	}
	
	function plus(id) {
		var val = $("#"+id+"-quan").html();
		val++;
		$("#"+id+"-quan").html(val.toLocaleString('ko-KR'));
		$("#"+id+"_hidden").val(val);
		
		var price = document.getElementById(id + "_price").value;
		$("#"+id+"_sum").html((price*val).toLocaleString('ko-KR'));
		$("#"+id+"_pay").val((price*val));
		update(id, val);
		total();
	}
	
	$(document).on('click', '.chk', function(){
		total();
	});
	
	function total() {
		var total = 0;
		$('input:checkbox[name=chkbox]').each(function () {
            if($(this).is(":checked")==true){
                total += parseInt($("#"+$(this).val()+"_sum").html().replace(/,/g, ""));
            }
        })
        $("#sum").html(total.toLocaleString('ko-KR'));
		var delivery = 0;
		if(total >= 30000 || total == 0) {
			delivery = 0;
		} else {
			delivery = 3000;
		}
		total += delivery;
		
        $("#total").html(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
        $("#delivery").text(delivery.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
        $("#pay").val(total);
	}
	
	function update(p_id, quan){
		$.ajax({
			type:"post",
			async:false,  
			url:"${contextPath}/cart/quantity",
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
	
	function cart_delete(p_id){
		$.ajax({
			type:"post",
			async:false,  
			url:"${contextPath}/cart/delete",
			dataType:"text",
			data: {p_id:p_id},
			success:function (data,textStatus){
				$("#cart").load("${contextPath}/cart/my_cart #cart", function(){total();});
			},
			error:function(request, error){
				alert("에러가 발생했습니다.");
				console.log("code : " + request.status + "\n" + "message : " + request.responseText +"\n" + "error : " + error	);
			}
		});
	}
	
	function pass() {
		if($(".chk").is(":checked")) {
			$('input:checkbox[name=chkbox]').each(function () {
	            if($(this).is(":checked")==true){
	            } else {
	            	var name = $(this).val();
	            	$("input[class=" + name + "]").attr("disabled", true);
	            }
	        });
			return true;
		} else {
			alert("선택한 상품이 없습니다.");
			return false;
		}
	}
	
</script>

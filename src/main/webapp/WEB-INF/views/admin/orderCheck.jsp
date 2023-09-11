<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
    <title>주문관리</title>
    <link rel="stylesheet" href="${path}/resources/assets/css/admin_seo.css">
    
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
		<%@ include file="./common/sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<%@ include file="./common/topbar.jsp" %>
				
				<div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-washboot">주문리스트</h6>
                        </div>
                        <div class="card-body">
                        	<div style="margin-bottom:20px">
                        		<form action="${path }/admin/order/searchOrder" method="POST">
                        		<table style="width:300px">
                        		<tr><td style="width:80px;text-align:center;"><select name="column" style="font-size:10pt;width:79px;height:40px">
                        		<option value="order_num">주문번호</option>
                        		<option value="member_id">주문자</option>
                        		<option value="pur_date">주문일자</option></select></td>
                        		<td style="width:165px"><input style="width:100%;height:40px" type="text" name="str"></td>
                        		<td style="width:54px"><input type="submit" class="btn btn-primary" style="width:100%" value="검색"></td>
                        		</tr>
                        		</table>
                        		</form>
                        		<span style="float:right"><a href="${path}/admin/order/orderList">
                        		<b class="text-secondary">전체보기</b></a></span>
                        	</div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>주문정보</th>
                                            <th class="address">배송지</th>
                                            <th>주문상품</th>
                                            <th>수량(개)</th>
                                            <th class="price">금액</th>
                                            <th class="buttons"></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>주문정보</th>
                                            <th class="address">배송지</th>
                                            <th>주문상품</th>
                                            <th>수량(개)</th>
                                            <th class="price">금액</th>
                                            <th class="buttons"></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:choose>
	                                    	<c:when test="${empty orderList }">
	                                    		<tr>
		                                    		<td colspan="5" style="text-align:center;">신규주문이 없습니다</td>
	                                    		</tr>
	                                    	</c:when>
	                                    	<c:when test="${!empty orderList }">
				                            		<c:forEach var="list" items="${orderList }">
				                                        <tr>
				                                            <td class="order_num align-middle">
				                                            	<b>주문번호 : ${list.order_num }</b>
																<c:choose>
																  <c:when test="${list.status eq 'paid'}">
																    <span class="status" style="background-color: salmon;">결제 완료</span>
																  </c:when>
																  <c:when test="${list.status eq 'ready'}">
																    <span class="status" style="background-color: skyblue;">입금 대기 중</span>
																  </c:when>
																  <c:when test="${list.status eq 'cancelled'}">
																    <span class="status" style="background-color: grey;">결제 취소</span>
																  </c:when>
																  <c:when test="${list.status eq '취소 요청'}">
																    <span class="status" style="background-color: darkgrey;">취소 요청</span>
																  </c:when>
																  <c:when test="${list.status eq '배송 준비중'}">
																    <span class="status" style="background-color: darkkhaki;">배송 준비중</span>
																  </c:when>
																  <c:when test="${list.status eq '배송중'}">
																    <span class="status" style="background-color: mediumaquamarine;">배송중</span>
																  </c:when>
																  <c:when test="${list.status eq '배송완료'}">
																    <span class="status" style="background-color: #FD8008;">배송 완료</span>
																  </c:when>
																</c:choose>
				                                            	<br>
				                                            	주문 날짜 : ${list.pur_date }<br>
				                                            	주문자 : ${list.member_id }<br>
				                                            	<button class="btn_popup" onclick="popup('${list.imp_uid}', '${list.pur_date}');">결제 정보 확인</button>
				                                            </td>
				                                            <td class="address align-middle">
					                                        	우편번호 : ${list.post }<br>
					                                        	<b>주소</b> : ${list.addr1 }<br>
					                                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.addr2 }
					                                        	<c:if test='${list.status eq "배송중"}'>
					                                        	<br><font size="1">운송장 번호 (대한통운): ${list.tracking}</font>
					                                        	</c:if></td>
				                                            <td class="align-middle">${list.product_id }(${list.product_name })</td>
				                                            <td class="align-middle">${list.mount}</td>
				                                            <td class="price align-middle">물품 가격 : ${list.total_price-list.delivery_fee}￦<br>
				                                            배송비 : ${list.delivery_fee}￦<br>
				                                            총 가격 : ${list.total_price}￦</td>
				                                            <td class="buttons align-middle">
				                                            <div class="pur_btn">
				                                            <c:if test='${list.status eq "paid"}'>
				                                              <button type="button" class="other_btn" onclick="update_status('배송 준비중','${list.order_num}')"> 결제 확인 </button><br>
				                                            </c:if>
				                                            <c:if test='${list.status eq "배송 준비중"}'>
				                                              <button type="button" class="other_btn" onclick="popuptracking('${list.order_num}')"> 운송장 입력 </button><br>
				                                            </c:if>
				                                            <c:if test='${list.status eq "배송중"}'>
				                                              <button type="button" class="other_btn" onclick="update_status('배송완료','${list.order_num}')"> 배송완료 확인 </button><br>
				                                            </c:if>
				                                            <c:if test='${list.status eq "취소 요청"}'>
				                                              <c:choose>
				                                                <c:when test='${list.paymethod eq "card"}'>
				                                                  <button type="button" class="other_btn" onclick="CancelPayments('${list.imp_uid}', '구매자 요청');"> 취소 확인 </button><br>
				                                                </c:when>
				                                                <c:when test='${list.paymethod eq "vbank"}'>
				                                                  <button type="button" class="other_btn" onclick="VbankCancelPayments('${list.order_num}');"> 취소 확인 </button><br>
				                                                </c:when>
				                                              </c:choose>
				                                            </c:if>				
				                                            </td>
				                                        </tr>
					                            	</c:forEach>
			                            	</c:when>
                                    	</c:choose>
                                   	</tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
			</div>
		</div>
	</div>
	<%@ include file="./common/footer.jsp" %>
</body>
</html>

<script>

	function CancelPayments(imp_uid, reason){
		$.ajax({
			type:"get",
			async:false,  
			url:"${path}/CancelPayments",
			dataType:"text",
			data: {
				imp_uid:imp_uid,
				reason:reason
			},
			success: function(result){
				alert("결제금액 환불완료");
				location.reload();
			},
			error: function(result){
				alert("결제금액 환불실패. 계속 오류 발생시 관리자에게 문의해주세요!");
			}
		});
	}
	
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
				alert("변경이 완료되었습니다.");
				location.reload();
			},
			error:function(request, error){
				alert("에러가 발생했습니다.");
			},
			complete:function(){
			}
		});
	}
	
	//무통장 환불이 작동 안할시를 위한 코드
	function VbankCancelPayments(order_num){
		alert("아임포트 관리자 페이지에서 직접 환불해주세요!");
 	    let popUrl = "${path}/admin/order/check_account/" + order_num;
 	    let popOption = "width=450px,height=300px,top=300px,left=300px,scrollbars=yes";
 	    
 	    window.open(popUrl, "계좌 확인", popOption);
	}

	function popuptracking(order_num){
 	    let popUrl = "${path}/admin/order/popuptracking/" + order_num;
 	    let popOption = "width=450px,height=300px,top=300px,left=300px,scrollbars=yes";
 	    
 	    window.open(popUrl, "운송장 입력", popOption);
	}

	function popup(Imp_uid, Pur_date){
 	    let popUrl = "${path}/admin/order/check_payment/" + Imp_uid + "/" + Pur_date;
 	    let popOption = "width=450px,height=400px,top=300px,left=300px,scrollbars=yes";
 	    
 	    window.open(popUrl, "리뷰 작성", popOption);	
	}
	  
	function rowspan(order_num, adjacent_column1, adjacent_column2, adjacent_column3) {
	    $("." + order_num).each(function () {
	        var $currentCell = $(this);
	        var $rows = $("." + order_num + ":contains('" + $currentCell.text() + "')");
	        var $addressCells = $rows.closest('tr').find("." + adjacent_column1);
			var $priceCells  = $rows.closest('tr').find("." + adjacent_column2);
			var $buttonsCells  = $rows.closest('tr').find("." + adjacent_column3);
			
	        if ($rows.length > 1) {
	            $rows.eq(0).attr("rowspan", $rows.length);
	            $rows.not(":eq(0)").remove();

	            $addressCells.eq(0).attr("rowspan", $rows.length);
	            $addressCells.not(":eq(0)").remove();
	            $priceCells.eq(0).attr("rowspan", $rows.length);
	            $priceCells.not(":eq(0)").remove();
	            $buttonsCells.eq(0).attr("rowspan", $rows.length);
	            $buttonsCells.not(":eq(0)").remove();
	        }
	    });
	}

	$(document).ready(function () {
	    rowspan("order_num", "address", "price", "buttons");
	});
	
</script>
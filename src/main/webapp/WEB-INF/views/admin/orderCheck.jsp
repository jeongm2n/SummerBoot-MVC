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
                                            <th>배송지</th>
                                            <th>주문상품</th>
                                            <th>수량</th>
                                            <th>금액</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>주문정보</th>
                                            <th>배송지</th>
                                            <th>주문상품</th>
                                            <th>수량</th>
                                            <th>금액</th>
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
				                                            	<c:if test = '${list.status eq "paid"}'> <span class="status" style="background-color: orange;">결제 완료</span><br></c:if>
				                                            	<c:if test = '${list.status eq "ready"}'> <span class="status" style="background-color: skyblue;">입금 대기 중</span><br></c:if>
				                                            	<c:if test = '${list.status eq "cancelled"}'> <span class="status" style="background-color: grey;">결제 취소</span><br></c:if>
				                                            	주문 날짜 : ${list.pur_date }<br>
				                                            	주문자 : ${list.member_id }<br>
				                                            	
				                                            	<button class="btn_popup" onclick="popup('${list.imp_uid}', '${list.pur_date}');">결제 정보 확인</button>
				                                            </td>
				                                            <td class="align-middle">
					                                        	우편번호 : ${list.post }<br>
					                                        	<b>주소</b> : ${list.addr1 }<br>
					                                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.addr2 }</td>
				                                            <td class="align-middle">${list.product_id }(${list.product_name })</td>
				                                            <td class="align-middle">${list.mount}</td>
				                                            <td class="align-middle">${list.mount*list.price}</td>
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
	function popup(Imp_uid, Pur_date){
 	    let popUrl = "${path}/admin/order/check_payment/" + Imp_uid + "/" + Pur_date;
 	    let popOption = "width=450px,height=400px,top=300px,left=300px,scrollbars=yes";
 	    
 	    window.open(popUrl, "리뷰 작성", popOption);	
	}

	function rowspan(order_num) {
		var rows;
		$("." + order_num).each(function () {
			rows = $("." + order_num + ":contains('" + $(this).text() + "')");
	        if (rows.length > 1) {
	            rows.eq(0).attr("rowspan", rows.length);
	            rows.not(":eq(0)").remove();
	        }
		});
	}

	$(document).ready(function() {
		rowspan("order_num");
	});
</script>
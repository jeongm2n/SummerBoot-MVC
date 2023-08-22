<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
    <title>주문관리</title>
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
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>주문상품</th>
                                            <th>수량</th>
                                            <th>금액</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>주문번호</th>
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
				                                            <td class="order_num">
				                                            	${list.order_num }<br>
				                                            	주문 날짜 : ${list.pur_date }<br>
				                                            	주문자 : ${list.member_id }
				                                            </td>
				                                            <td>${list.product_id }(${list.product_name })</td>
				                                            <td>${list.mount}</td>
				                                            <td>${list.mount*list.price}</td>
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
	function rowspan(order_num) {
		var rows;
		$("." + order_num).each(function () {
			var rows = $("." + order_num + ":contains('" + $(this).text() + "')");
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
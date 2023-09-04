<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
    <title>상품리스트</title>
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <c:set var="file_repo" value="/summerboot2/resources/assets/img/"/>
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
                            <h6 class="m-0 font-weight-bold text-washboot">상품리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" style="width:100%; border-spacing:0;">
                                    <thead>
                                        <tr>
                                            <th class="img">상품사진</th>
                                            <th class="id">상품코드</th>
                                            <th class="category">카테고리</th>
                                            <th class="name">상품명</th>
                                            <th class="amount">재고</th>
                                            <th class="price">가격</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th class="img">상품사진</th>
                                            <th class="id">상품코드</th>
                                            <th class="category">카테고리</th>
                                            <th class="name">상품명</th>
                                            <th class="amount">재고</th>
                                            <th class="price">가격</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                   		<c:choose>
	                                    	<c:when test="${empty productList }">
	                                    		<tr>
		                                    		<td colspan="5" style="text-align:center;">등록된 상품이 없습니다.</td>
	                                    		</tr>
	                                    	</c:when>
	                                    	<c:when test="${!empty productList }">
			                            		<c:forEach var="list" items="${productList }">
			                                        <tr class="item">
			                                            <td align=center class="img" style="padding:0"><img src = "${file_repo }${list.img }"></td>
			                                            <td class="id">${list.product_id }</td>
			                                            <td class="id">${list.category }</td>
			                                            <td class="name">${list.name }</td>
			                                            <td class="amount">${list.amount }</td>
			                                            <td class="price"><fmt:formatNumber value="${list.price }" pattern="#,###"/></td>
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

<style>
	td {
		vertical-align : middle !important;
	}
	img {
		width:50%;
	}
	.img {
		width:15%;
	}
	.id {
		width : 20%;
	}
	.name {
		width : 30%;
	}
	.amount .price {
		width : 10%;
	}
</style>
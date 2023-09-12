<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WASHBOOT 지점</title>
	<%@ include file="../common.jsp"%>
	<%@ include file="../common/header.jsp" %>
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
</head>
<body>
	<section class="container py-5">
		<div class="row text-center pt-5 pb-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1" id="title" style="font-weight:bolder !important;">자주하는 질문</h1>
			</div>
		</div>
		
		<div class="row choose">
			<div class="pb-5 ch">
				<a class="h4 mt-4 disabled" href="${path}/community/faq">FAQ</a>
			</div>
		
			<div class="pb-5 ch">
				<a class="h4 mt-4" href="${path}/community/qna">Q&A</a>
			</div>
		</div>
		
		
		<div style="display:flex; height:30px;margin-right:25px;">
			<div class="faq-list" style="border-right:1px solid black;">
				<p>자주 찾는 FAQ</p>
			</div>
			<div class="faq-list" style="padding-left:20px;">
				<p>세차장예약</p>
			</div>
			<div class="faq-list">
				<p>취소</p>
			</div>
			<div class="faq-list">
				<p>주문취소</p>
			</div>
			<div class="faq-list">
				<p>배송</p>
			</div>
		</div>
		
		<div>
			<table class="table inquiryT">
				<thead>
					<tr>
						<th width="5%">#</th>
						<th width="8%">구분</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody class="inquiryTB">
				</tbody>
			</table>
		</div>
		
	</section>
	<!-- End Section -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>

<style>
    .choose {
        justify-content: center;
        text-align:center;
    }
    
    .ch {
        width : 10%;
    }
	.h4 {
		font-size : 1.5rem !important;
	}
	tr {
		cursor: default;
    }
    .inquiry-select {
    	display : grid;
    	grid-template-columns:1fr;
    }
    .faq-list {
    	padding-right:20px;
    }
</style>
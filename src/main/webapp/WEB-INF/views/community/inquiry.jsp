<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WASHBOOT 지점</title>
	<%@ include file="../common/header.jsp" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
</head>
<body>
	<section class="container py-5">
		<div class="row text-center pt-5 pb-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1" id="title" style="font-weight:bolder !important;">Q&A</h1>
			</div>
		</div>
		
		<div class="row choose">
			<div class="pb-5 ch">
				<p class="h4 mt-4 text-center">Notice</p>
			</div>
		
			<div class="pb-5 ch">
				<p class="h4 mt-4 text-center">FAQ</p>
			</div>
		
			<div class="pb-5 ch">
				<p class="h4 mt-4 text-center" style="text-decoration: underline;text-underline-position: under;">Q&A</p>
			</div>
		</div>
		
		<div class="row" style="justify-content: flex-end;margin-bottom:1%;">
			<input type="button" class="btn btn-join" id="write" value="글쓰기" style="width:7%;">
		</div>
		
		<div>
			<table class="table">
				<thead>
					<tr>
						<th style="width:5%;">#</th>
						<th style="width:50%;">제목</th>
						<th style="width:15%;">작성자</th>
						<th style="width:15%;">작성시간</th>
						<th style="width:15%;">답변상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${inquiryList }" varStatus="status">
						<c:set var="count" value="${count + 1}" />
						<tr>
							<th>${count }</th>
							<td>${list.title }</td>
							<td>${list.writer }</td>
							<td><fmt:formatDate value="${list.ins_date }" pattern="YYYY/MM/dd" /></td>
							<td>${list.state }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="row">
			<ul class="pagination pagination-lg justify-content-center">
				<c:forEach var="page" begin="1" end="${pages }" step="1">
					<li class="page-item">
						<a class="page-link rounded-0 mr-3 border-top-0 border-left-0" href="${path}/community/qna?page=${page}">${page}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>
	<!-- End Section -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>

<style>
	.choose {
		justify-content: center;
	}
	
	.ch {
		width : 10%;
	}
</style>

<script>
	$(document).ready(function() {
		var message = "${msg}";
		if (message == 4) {
			alert("오류로 문의 등록에 실패했습니다.");
			location.href="${path }/community/qnaWrite";
		} else if (message == 888) {
			alert("문의가 등록되었습니다.");
			location.href="${path }/community/qna";
		}
	});

	$(document).on('click', '#write', function() {
		location.href = "${path}/community/qnaWrite"
	});
</script>
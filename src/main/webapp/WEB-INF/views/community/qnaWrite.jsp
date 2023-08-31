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
	<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
</head>
<body>
	<section class="container py-5">
		<div class="row text-center pt-5 pb-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1" style="font-weight:bolder !important;">Q&A</h1>
			</div>
		</div>
		<form id="inquiryForm" method="post" action="registInquiry">
			<div style="border-top: 4px solid black; border-bottom : 4px solid black">
				<div class="qna">
					<div class="qna-title">세차장 관련 문의</div>
					<div class="qnaRadio">
						<div class="qr"><input type="radio" class="qna-input" name="category" value="세차예약"><span>예약문의</span></div>
						<div class="qr"><input type="radio" class="qna-input" name="category" value="세차취소"><span>취소문의</span></div>
					</div>
				</div>
				<div class="qna">
					<div class="qna-title">쇼핑 관련 문의</div>
					<div class="qnaRadio">
						<div class="qr"><input type="radio" class="qna-input" name="category" value="쇼핑상품"><span>상품문의</span></div>
						<div class="qr"><input type="radio" class="qna-input" name="category" value="쇼핑배송"><span>배송문의</span></div>
						<div class="qr"><input type="radio" class="qna-input" name="category" value="쇼핑주문"><span>주문문의</span></div>
						<div class="qr"><input type="radio" class="qna-input" name="category" value="쇼핑취소"><span>취소문의</span></div>
					</div>
				</div>
				<div class="qna">
					<div class="qna-title">기타 문의</div>
					<div class="qnaRadio">
						<div class="qr"><input type="radio" class="qna-input" name="category" value="기타포인트"><span>포인트문의</span></div>
						<div class="qr"><input type="radio" class="qna-input" name="category" value="기타"><span>기타문의</span></div>
					</div>
				</div>
		
				<div class="qna qna-id">
					<div class="qna-title">아이디</div>
					<div class="qna-input">
						<%=user_id %>
					</div>
				</div>
				<div class="qna qna-t">
					<div class="qna-title qna-x">제목</div>
					<div class="qna-input qna-text">
						<input type="text" class="form-control mt-1" id="subject" name="subject" placeholder="제목을 입력하세요">
					</div>
				</div>
				<div class="qna qna-t">
					<div class="qna-title qna-x">내용</div>
					<div class="qna-input qna-text">
						<textarea class="form-control mt-1" id="content" name="content" placeholder="내용을 입력하세요" rows="8"></textarea>
					</div>
				</div>
				<div class="qna qna-t" style="margin-bottom:2%;">
					<div class="qna-x"></div>
					<div class="qna-input qna-text">
						<input type="checkbox" id="secret" name="secret" value="Y"><span>비밀글</span>
					</div>
				</div>
			</div>
		</form>
		<div id="write">
			<input type="button" id="regist" class="btn btn-join" value="등록하기">
		</div>
	</section>
	<!-- End Section -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>

<script>
	$(document).on('click', '#regist', function() {
		/* var queryString = $("#inquiryForm").serialize();
		console.log(queryString);
		
		$.ajax({
			type : "post",
			url : "${path}/community/registInquiry",
			contentType: "application/json; charset=utf-8",
			data : JSON.stringify(queryString),
			error: function(data, error, request){
				console.log(queryString);
				if(data=='fail'){
					alert("실패!!!");
				}
				console.log("code : " + request.status + "\n" + "message : " + request.responseText +"\n" + "error : " + error	);
				alert("오류로 문의가 등록되지않았습니다.");
			},
			success : function(data){
				if(data=='regist') {
					alert("문의가 등록되었습니다.");
					let path = "${path}/community/inquiry";
					location.replace(path);
				}
			}
		}); */
		
		var category = $(".qna-input").val();
		var title = $("#subject").val();
		var content = $("#content").val();
		var secret = $("#secret").val();
		console.log(category + "/" + title + "/" + content + "/" + secret);
		
		if(category.length==0) {
			alert("문의내용을 선택해주세요");
			return;
		} else if(title.length==0) {
			alert("문의 제목을 입력해주세요");
			return;
		} else if(content.length==0) {
			alert("문의 내용을 입력해주세요");
			return;
		} else {
			document.getElementById("inquiryForm").submit();
		}
	});
</script>

<style>
	span{
		vertical-align : middle;
		padding-left : 5px;
	}
</style>
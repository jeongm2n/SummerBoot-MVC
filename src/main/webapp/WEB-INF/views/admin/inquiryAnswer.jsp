<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../common.jsp"%>
	<link rel="stylesheet" href="${path}/summerboot2/resources/assets/css/custom_lee.css">
	
	<script>
		$(document).ready(function() {
		    var message = "${msg}";
		    if(message == 999){
		   		alert("답변 완료");
		        window.close();
				opener.location.href="${path }/admin/community/inquiry";
		    } else if(message == 4){
		    	alert("답변 실패");
		    }
		});
		
		function validate() {
			var content = $("#content").val();
			if(!content.length > 0) {
				alert("답변을 입력해주세요");
				return false;
			}
			return true;
		}
	</script>
	
</head>
<body>
	<section class="container py-5">
		<c:choose>
			<c:when test="${!empty inquiry }">
				<c:set target="${inquiry }"/>
				<div class="ans-qna">
					<div>
						<span class="h1" style="font-weight:400 !important;">Q. </span>
						<span style="font-size:30px;">${inquiry.title }</span>
					</div>
					<div style="width:90%;margin:2% auto;">
						<div class="qna-input qna-text" style="padding-bottom: 2%; border-bottom: 1px solid black;width: 35%;">
							<span>작성자 : ${inquiry.writer}</span>
						</div>
						<div class="qna-input qna-text" style="padding-top:2%;">
							<span>${inquiry.content }</span>
						</div>
					</div>
				</div>
				<form name="answerForm" method="post" action="registAnswer">
					<div class="ans-qna">
						<span class="h1" style="font-weight:400 !important;">A. </span>
						<div style="width:100%;">
							<textarea class="form-control mt-1" id="content" name="content" rows="8" placeholder="답변 입력"></textarea>
						</div>
						<input type="hidden" name="q_no" value="${q_no }">
					</div>
					<div id="write">
						<input type="submit" id="regist" class="btn btn-join" value="답변달기" onclick="return validate();">
					</div>
				</form>
			</c:when>
		</c:choose>
		
		
	</section>
</body>
</html>
<style>
	.ans-qna {
		display : grid;
		grid-template-columns : 1fr;
	    justify-items: start;
	    margin:2% 4%;
	}
</style>
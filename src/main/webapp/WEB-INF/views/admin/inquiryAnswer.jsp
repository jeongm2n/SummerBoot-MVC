<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<jsp:include page="/WEB-INF/common.jsp" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="${path}/summerboot2/resources/assets/css/custom_lee.css">
</head>
<body>
	<section class="container py-5">
		<form name="answerForm" method="post" action="registAnswer">
			<div class="qna qna-t">
				<div class="qna-title"><h1>답변</h1></div>
				<div class="qna-input qna-text">
					<textarea class="form-control mt-1" id="content" name="content" placeholder="내용을 입력하세요" rows="8">게시판 번호 : ${q_no }</textarea>
				</div>
				<input type="hidden" name="q_no" value="${q_no }">
			</div>
			<div id="write">
				<input type="submit" id="regist" class="btn btn-join" value="답변달기">
			</div>
		</form>
	</section>
</body>
</html>

<script>
	$(document).ready(function() {
	    var message = "${msg}";
	    if(message == 999){
	   		alert("답변 완료");
	        window.close();
			opener.location.href="${path }/summerboot2/admin/community/inquiry";
	    } else if(message == 4){
	    	alert("답변 실패");
	    }
	});
</script>
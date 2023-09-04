<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Review</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    
    <link rel="stylesheet" href="${path}/resources/assets/css/review.css">

 	<script>
 	  function handleFileInput(input) {
 		    const previewImage = document.getElementById('preview-image');
 		    const file = input.files[0];
 		    if (file) {
 		      const reader = new FileReader();
 		      reader.onload = function(event) {
 		        previewImage.src = event.target.result;
 		      };
 		      reader.readAsDataURL(file);
 		      previewImage.style.display = 'inline-block';
 		    } else {
 		      previewImage.src = '';
 		      previewImage.style.display = 'none';
 		    }
 		  }
 	</script>
</head>
<body>

	<div class="review">
	  <div class="product_inform">
	    <img src="${path}/resources/assets/product/${img}.jpg" style="width:50px; height:50px;"><br>
		<h2>${name}</h2>
	  </div>
	  <div class="review_input">
	    <form class="reviewForm" id="reviewForm" method=post enctype="multipart/form-data">
	      <input type="hidden" name="product_id" id="product_id" value="${id}">
          <fieldset>
          <label class="review_label">별점을 입력해주세요</label><br>
          <div class="star_input">
			<input id="star5" name="rating" value="5" type="radio"><label for="star5">⭐</label>
			<input id="star4" name="rating" value="4" type="radio"><label for="star4">⭐</label>
			<input id="star3" name="rating" value="3" type="radio"><label for="star3">⭐</label>
			<input id="star2" name="rating" value="2" type="radio"><label for="star2">⭐</label>
			<input id="star1" name="rating" value="1" type="radio"><label for="star1">⭐</label>
          </div>
		  </fieldset><br>
	      <label for="content" class="review_label">어떤 점이 좋았나요?</label><br>
          <textarea name="content" id="content" class="input_text" placeholder="리뷰 내용을 작성해주세요!"></textarea><br>
		  <label class="label">제품 사진</label><br>
		  <label for="obj_img" class="filelabel">사진 업로드</label>
		  <input type="file" id="obj_img" name="img" accept="image/*" required onchange="handleFileInput(this);">
		  <div class="selected-file">
		    <img id="preview-image" class="preview-image" src="">
		  </div>
    	  <button type="button" id="submitBtn">리뷰 작성 완료</button>
	    </form>
	  </div>
	</div>
	
<script>
	$(document).ready(function() {
	    $("#submitBtn").click(function() {
	        if (validateForm()) {
	            submitReview();
	        }
	    });
	});
	
	function validateForm() {
	    const rating = $("input[name='rating']:checked").val();
	    const content = $("#content").val();
	
	    if (!rating) {
	        alert("별점을 선택해주세요.");
	        return false;
	    }
	
	    if (!content) {
	        alert("리뷰 내용을 입력해주세요.");
	        return false;
	    }
	
	    return true;
	}

	function submitReview() {
		let formData = new FormData($("#reviewForm")[0]);
			
		$.ajax({
			type: "POST",
			url: "${path}/shop/add_review",
			data: formData,
		 	processData: false,
		 	contentType: false,
			success: function(response) {
			    console.log("리뷰 작성이 완료되었습니다.");
			    window.close();
			    },
			error: function(xhr) {
			    console.log("에러가 발생했습니다: " + xhr.responseText);
			    alert("에러가 발생했습니다: " + xhr.responseText);
			}
		});
	}

</script>
</body>
</html>
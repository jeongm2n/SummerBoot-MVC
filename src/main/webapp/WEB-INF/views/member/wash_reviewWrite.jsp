<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

    <head>
        <meta charset="UTF-8">
        <title>wash_review</title>

        <link rel="stylesheet" href="${path}/resources/assets/css/custom_ryu.css">
        <jsp:include page="/WEB-INF/views/common.jsp" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </head>
    <body style="padding: 1.5rem;">
        <div class="card text-center">
            <div class="card-header">
                <h4 style="margin:0">세차장 리뷰</h4>
            </div>
               <!--  <form name="star_rv" id="star_rv" method="post"> -->
               <!--  </form> -->
            <form action="submitReview" method="post">
            	<div class="rvForm" id="star_rv">
            		<input type="hidden" id="storeNo" value="	${param.store }">
            		<input type="hidden" id="res_no" value="	${param.res_no }">
                    <fieldset>
                        <input type="radio" name="rating" value="5" id="rate1" checked><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                    </fieldset><br>
	            </div>
	            <div class="rvForm">
	                <p class="textCount" style="text-align: right; padding-right: 40px; margin: 0;">0자/100자</p>
	                <textarea name="text_rv" id="text_rv" maxlength="100" placeholder="고객님의 한마디가 큰 힘이 됩니다!"></textarea>
	            </div>
	            <div class="rvForm">
	                <input type="button" id="rvSubmit" class="btn btn-washboot" style="width: 100%;" value="등록하기">
	            </div>
            </form>
        </div>

        <script>
            //review form 글자수
            $('#text_rv').keyup(function () {
                let content = $(this).val();

                //글자수 세기
                if (content.length == 0 || content == '') {
                    $('.textCount').text('0자/100자');
                } else {
                    $('.textCount').text(content.length + '자/100자');
                }

                //글자수 제한
                if (content.length > 101) {
                    $(this).val($(this).val().substring(0, 100)); //100자 초과하면 타이핑 되지 않도록
                }
            });

            //review 내용 등록
           
             $(document).on('click', '#rvSubmit', function (e) {
                 e.preventDefault();
                 //입력된 리뷰 내용 가져오기
                 var reviewText = $("textarea[name='text_rv']").val();
                 var rate = "";
                 var storeNo = $("#storeNo").val();
                 var res_no = $("#res_no").val();
		
				$("input:radio[name=rating]").each(function () {
		            if($(this).is(":checked")==true){
		            	rate = $(this).val();
		            }
		        });
        
                 $.ajax({
                     type: "POST",
                     async:false, 
                     url: "${path}/review/submitReview",
                     data: { text: reviewText, rating:rate, store:storeNo, res_no:res_no },
                     dataType:"text",
                     success: function (data) {
                    	 if(data == "insert") {
                    		alert("리뷰가 등록되었습니다.");
             	            opener.location.reload();
             	            window.close();
                    	 }
                     },
                     error: function () {
                    	alert("오류로 리뷰등록에 실패하였습니다.");
         	            opener.location.reload();
         	            window.close();
                     }
                 });
             });
        </script>
    </body>

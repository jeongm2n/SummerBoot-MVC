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
                <h4>세차장 리뷰</h4>
            </div>
            <div class="rvForm">
                <form name="star_rv" id="star_rv" method="post">
                    <fieldset>
                        <input type="radio" name="rating" value="5" id="rate1" checked><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate2" checked><label for="rate2">⭐</label>
                        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                    </fieldset><br>
                </form>
            </div>
            <form action="submitReview" method="post">
            <div class="rvForm">
                <p class="textCount" style="text-align: right; padding-right: 40px; margin: 0;">0자/100자</p>
                <textarea type="text" name="text_rv" id="text_rv" maxlength="100" placeholder="고객님의 한마디가 큰 힘이 됩니다!"></textarea>
            </div>
            <div class="rvForm">
                <button type="submit" class="btn btn-washboot" style="width: 1100px;">등록하기</button>
            </div>
            </form>
            <div class="rvForm">
                <table class="table" style="padding: 20px;">
                    <thead style="position:sticky;top:0;background:white;">
                        <tr style="text-align: left">
                            <th style="width: 150px;">별점</th>
                            <th style="width: 150px;">아이디</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="reviewStar">별점</td>
                            <td>아이디</td>
                            <td id="reviewText">${reviewText}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
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
            $(document).ready(function () {
                $("form").submit(function (e) {
                    e.preventDefault();

                    //입력된 리뷰 내용 가져오기
                    var reviewText = $("textarea[name='text_rv']").val();

                    $.ajax({
                        type: "POST",
                        url: "${path}/review/submitReview",
                        data: { text: reviewText },
                        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                        success: function (response) {
                            $("#reviewText").html(response);
                        },
                        error: function () {
                            alert("통신 실패.");
                        }
                    });
                });
            });
        </script>
    </body>

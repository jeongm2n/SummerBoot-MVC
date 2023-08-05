
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Wash Boot</title>
    <jsp:include page="/WEB-INF/common.jsp" />
</head>
<body>

<!-- start 세차장 배너 -->
<div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators">
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img class="img-fluid" src="${path}/resources/assets/img/seoul.jpg" alt="">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left align-self-center">
                            <h1 class="h1"><b>Wash Boot</b> 서울 본점</h1>
                            <h3 class="h2">서울 광진구 능동로 209 (군자동)</h3>
                            <p>
                                기존 세차장과 다르게 고객님이 예약한 시간에 바로바로 세차가 가능한 Wash Boot 서울본점입니다.<br>
                                더나은 서비스를 위하여 여유로운 세차공간으로 고객여러분을 맞이 하고 있습니다.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img class="img-fluid" src="${path}/resources/assets/img/gunpo.jpg" alt="">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                            <h1 class="h1"><b>Wash Boot</b> 경기군포점</h1>
                            <h3 class="h2">경기 군포시 청백리길 6 (금정동)</h3>
                            <p>
                                줄서서 기다리지 말고, 예약을 통해서 시간아껴보세요!<br>
                                지금은 핫썸머 이벤트 중입니다. 방문하셔서 사은품 챙겨가세요 :)
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img class="img-fluid" src="${path}/resources/assets/img/pyeongtaek.jpg" alt="">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                            <h1 class="h1"><b>Wash Boot</b> 경기평택점</h1>
                            <h3 class="h2">경기 평택시 경기대로 245 (비전동)</h3>
                            <p>
                                연중무휴 오픈 프리미엄 실내 셀프세차장. 700평 국내 최대 규모의 실내 셀프세차장입니다.<br>
                                깨끗한 시설에서 기분좋게 세차해보세요.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img class="img-fluid" src="${path}/resources/assets/img/daegu.jpg" alt="">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                            <h1 class="h1"><b>Wash Boot</b> 대구점</h1>
                            <h3 class="h2">대구 중구 공평로 88 (동인동1가)</h3>
                            <p>
                                최신식 시설을 자랑하는 Wash Boot 대구점입니다. <br>
                                옆 차와 간섭없는 넓은 공간에서 쾌적한 셀프세차하러 오세요.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
        <i class="fas fa-chevron-left"></i>
    </a>
    <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
        <i class="fas fa-chevron-right"></i>
    </a>
</div>
<!-- End 세차장 배너 -->

<!-- Start 세차가이드 -->
<section class="container py-5">
    <div class="row text-center pt-3 justify-content-center">
        <div class="col-12 col-md-4 p-5 mt-3">
            <a href="#"><img src="${path}/resources/assets/img/05.jpg" class="rounded-circle img-fluid border"></a>
            <h5 class="text-center mt-3 mb-3"><b>외부세차</b></h5>
            <p class="text-center"><a class="btn btn-washboot" href="#">가이드</a></p>
        </div>
        <div class="col-12 col-md-4 p-5 mt-3">
            <a href="#"><img src="${path}/resources/assets/img/06.jpg" class="rounded-circle img-fluid border"></a>
            <h2 class="h5 text-center mt-3 mb-3"><b>내부세차</b></h2>
            <p class="text-center"><a class="btn btn-washboot" href="#">가이드</a></p>
        </div>
    </div>
</section>
<!-- End 세차가이드 -->

</body>
</html>

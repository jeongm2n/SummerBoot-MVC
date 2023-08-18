<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Wash Boot</title>
    <jsp:include page="/WEB-INF/common.jsp"/>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_ryu.css">
    <script src="//code.jquery.com/jquery-1.12.4.min.js" crossorigin="anonymous"></script>
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
    <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel"
       role="button" data-bs-slide="prev">
        <i class="fas fa-chevron-left"></i>
    </a>
    <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel"
       role="button" data-bs-slide="next">
        <i class="fas fa-chevron-right"></i>
    </a>
</div>
<!-- End 세차장 배너 -->

<!-- Start 당일예약현황 -->
<section class="container py-5">
    <div class="row text-center pt-5 pb-3">
        <div class="col-lg-6 m-auto">
            <h1 class="h1"><b>
                Today's Reservation<br>
                <c:set var="date" value="<%=new java.util.Date()%>"/>
                <fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
            </b></h1>
            <p>
                상쾌한 셀프세차, Wash Boot와 함께!<br>
                Wash Boot 오늘의 예약현황과 날씨를 확인해보세요.
            </p>
        </div>
    </div>
    <div class="row">

        <div class="col-md-6 col-lg-3 pb-5">
            <a data-bs-toggle="collapse" role="button" href="#res_seoul" aria-expanded="false" aria-controls="res_seoul"
               onclick="getTodayResList('1'); return false">
                <div class="h-100 py-5 services-icon-wap shadow">
                    <div class="h1 text-success text-center"><i class="fa fa-car-side fa-lg"></i></div>
                    <h2 class="h5 mt-4 text-center">서울 본점</h2>
                </div>
            </a>
        </div>

        <div class="col-md-6 col-lg-3 pb-5">
            <a data-bs-toggle="collapse" role="button" href="#res_gunpo" aria-expanded="false" aria-controls="res_gunpo"
               onclick="getTodayResList('2'); return false">
                <div class="h-100 py-5 services-icon-wap shadow">
                    <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                    <h2 class="h5 mt-4 text-center">경기 군포점</h2>
                </div>
            </a>
        </div>

        <div class="col-md-6 col-lg-3 pb-5">
            <a data-bs-toggle="collapse" role="button" href="#res_pyeongtaek" aria-expanded="false"
               aria-controls="res_pyeongtaek" onclick="getTodayResList('3'); return false">
                <div class="h-100 py-5 services-icon-wap shadow">
                    <div class="h1 text-success text-center"><i class="fa fa-car-side fa-lg"></i></div>
                    <h2 class="h5 mt-4 text-center">경기 평택점</h2>
                </div>
            </a>
        </div>

        <div class="col-md-6 col-lg-3 pb-5">
            <a data-bs-toggle="collapse" role="button" href="#res_daegu" aria-expanded="false" aria-controls="res_daegu"
               onclick="getTodayResList('4'); return false">
                <div class="h-100 py-5 services-icon-wap shadow">
                    <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                    <h2 class="h5 mt-4 text-center">대구점</h2>
                </div>
            </a>
        </div>

        <div class="collapse show" id="res_seoul">
            <div class="card card-body">
                서울 본점 날씨
            </div>
            <div class="card card-body">
                서울 본점 예약현황<br>
                <div id="resList1"></div>
            </div>
        </div>
        <div class="collapse" id="res_gunpo">
            <div class="card card-body">
                경기 군포점 날씨
            </div>
            <div class="card card-body">
                경기 군포점 예약현황
                <div id="resList2"></div>
            </div>
        </div>
        <div class="collapse" id="res_pyeongtaek">
            <div class="card card-body">
                경기 평택점 날씨
            </div>
            <div class="card card-body">
                경기 평택점 예약현황
                <div id="resList3"></div>
            </div>
        </div>
        <div class="collapse" id="res_daegu">
            <div class="card card-body">
                대구점 날씨
            </div>
            <div class="card card-body">
                대구점 예약현황
                <div id="resList4"></div>
            </div>
        </div>
    </div>
</section>
<!-- End 당일예약현황 -->

<!-- Start 세차가이드 -->
<section class="container py-5">
    <div class="row text-center pt-3 justify-content-center">
        <div class="col-12 col-md-4 p-5 mt-3 popupModalVideo">
            <img src="${path}/resources/assets/img/05.jpg" class="rounded-circle img-fluid border">
            <h5 class="text-center mt-3 mb-3"><b>외부세차</b></h5>
            <!-- data-video="youtube주소일부"-->
            <p class="text-center"><a data-video="lWHEHVpYiuk" class="btn btn-washboot">가이드</a></p>
        </div>
        <div class="col-12 col-md-4 p-5 mt-3 popupModalVideo">
            <img src="${path}/resources/assets/img/06.jpg" class="rounded-circle img-fluid border">
            <h2 class="h5 text-center mt-3 mb-3"><b>내부세차</b></h2>
            <p class="text-center"><a data-video="OWj8gocWwg8" class="btn btn-washboot">가이드</a></p>
        </div>
    </div>
    <div class="video_modal_popup">
        <div class="video_modal_popup-closer"></div>
    </div>
</section>
<!-- End 세차가이드 -->

<script>
    <!-- 예약현황 : 지점 클릭시 다른지점 섹션닫기-->
    document.getElementById("res_seoul").addEventListener("show.bs.collapse", function () {
        $("#res_gunpo, #res_pyeongtaek, #res_daegu").collapse("hide");
    });
    document.getElementById("res_gunpo").addEventListener("show.bs.collapse", function () {
        $("#res_seoul, #res_pyeongtaek, #res_daegu").collapse("hide");
    });
    document.getElementById("res_pyeongtaek").addEventListener("show.bs.collapse", function () {
        $("#res_gunpo, #res_seoul, #res_daegu").collapse("hide");
    });
    document.getElementById("res_daegu").addEventListener("show.bs.collapse", function () {
        $("#res_gunpo, #res_pyeongtaek, #res_seoul").collapse("hide");
    });

    <!-- 예약현황 : 오늘의 예약현황 보여주기 -->
    //메인페이지 로드되면 서울지점(1) 함수실행
    $( document ).ready(function() {
        getTodayResList('1');
    });
    function getTodayResList(site) {
        //비동기
        $.ajax({
            type   : "GET",
            url    : "${path}/getTodayResList?site=" + site, //파라미터 넘기는 방식과 컨트롤러에서 받는 방법
            success: function (data) {
                $(`#resList\${site}`).html('') // 템플릿 문자열, Jquery 사용방법

                let baseTable = `
                                 <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">사용자</th>
                        <th scope="col">시작시간</th>
                        <th scope="col">종료시간</th>
                        <th scope="col">Site</th>
                    </tr>
                    </thead>
                    <tbody >`

                if (!data) {
                    baseTable += `<tr> <td colSpan="5" align="center">오늘 예약이 없습니다.</td> </tr>`;
                } else {
                    for (const item of data) {
                        baseTable += `
                     <tr>
                                    <th scope="row">1</th>
                                    <td>\${item.member_id}</td>
                                    <td>\${item.startTime}</td>
                                    <td>11:00</td>
                                    <td>\${item.site}</td>
                                </tr>
                    `;
                    }
                }
                baseTable += `</tbody>
                </table>`

                $(`#resList\${site}`).html(baseTable)

            },
            error  : function () {
                alert("통신 실패.");
            }
        });
    }

    <!-- 세차가이드 : 모달팝업창으로 유튜브영상 보여주기 -->
    $(".popupModalVideo a").click(function () {
        $(".video_modal_popup").addClass("reveal"),
        $(".video_modal_popup .video-wrapper").remove(),
        $(".video_modal_popup").append("<div class='video-wrapper'><iframe width='560' height='315' src='https://youtube.com/embed/" + $(this).data("video") + "?rel=0&playsinline=1&autoplay=1' allow='autoplay; encrypted-media' allowfullscreen></iframe></div>")
    }),
    $(".video_modal_popup-closer").click(function () {
        $(".video_modal_popup .video-wrapper").remove(),
        $(".video_modal_popup").removeClass("reveal")
     });
</script>
</body>
</html>

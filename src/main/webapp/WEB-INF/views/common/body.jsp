<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Wash Boot</title>

    <link rel="stylesheet" href="${path}/resources/assets/css/custom_ryu.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06a1b9ec0da85dcbc94968ce7bd3be22&libraries=services"></script>
</head>
<body>
<div id="div_load" style="display:none">
      <img id="loading_img" src="${path }/resources/assets/img/apiLoading.gif">
</div>
        <!-- start 세차장 배너 -->
        <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
            <ol class="carousel-indicators">
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="3"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="4"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="5"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="6"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="7"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="8"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="9"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container">
                        <div class="row p-5">
                            <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                                <img class="img-fluid" src="${path}/resources/assets/img/YangPyeong.jpg" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left align-self-center">
                                    <h1 class="h1"><b>Wash Boot</b> 양평로점</h1>
                                    <h3 class="h2">서울특별시 영등포구 양평로22마길 28</h3>
                                    <p>
                                        기존 세차장과 다르게 고객님이 예약한 시간에 바로바로 세차가 가능한 Wash Boot 양평로점입니다.<br>
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
                                <img class="img-fluid" src="${path}/resources/assets/img/gyeonginro.jpg" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1"><b>Wash Boot</b> 경인로점</h1>
                                    <h3 class="h2">서울특별시 영등포구 경인로71길 50</h3>
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
                                <img class="img-fluid" src="${path}/resources/assets/img/cheonwang.jpg" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1"><b>Wash Boot</b> 천왕점</h1>
                                    <h3 class="h2">서울특별시 구로구 천왕동 277-15</h3>
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
                                <img class="img-fluid" src="${path}/resources/assets/img/gaje1dong.jpg" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1"><b>Wash Boot</b> 가제1동점</h1>
                                    <h3 class="h2">서울특별시 성동구 성수1가제1동 656-310</h3>
                                    <p>
                                        최신식 시설을 자랑하는 Wash Boot 가제1동점입니다. <br>
                                        옆 차와 간섭없는 넓은 공간에서 쾌적한 셀프세차하러 오세요.
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
                                <img class="img-fluid" src="${path}/resources/assets/img/kangdongseongan.jpg" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1"><b>Wash Boot</b> 강동성안점</h1>
                                    <h3 class="h2">서울특별시 강동구 성내제3동 성안로 46</h3>
                                    <p>
                                        최신식 시설을 자랑하는 Wash Boot 강동성안점입니다. <br>
                                        옆 차와 간섭없는 넓은 공간에서 쾌적한 셀프세차하러 오세요.
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
                                <img class="img-fluid" src="${path}/resources/assets/img/majang.jpg" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1"><b>Wash Boot</b> 성동마장점</h1>
                                    <h3 class="h2">서울특별시 성동구 마장동 775-1</h3>
                                    <p>
                                        최신식 시설을 자랑하는 Wash Boot입니다. <br>
                                        옆 차와 간섭없는 넓은 공간에서 쾌적한 셀프세차하러 오세요.
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
                                <img class="img-fluid" src="${path}/resources/assets/img/jongam.JPEG" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1"><b>Wash Boot</b> 성북종암점</h1>
                                    <h3 class="h2">서울특별시 성북구 종암동 8-18</h3>
                                    <p>
                                        최신식 시설을 자랑하는 Wash Boot 입니다. <br>
                                        옆 차와 간섭없는 넓은 공간에서 쾌적한 셀프세차하러 오세요.
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
                                <img class="img-fluid" src="${path}/resources/assets/img/galhyeon.jpg" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1"><b>Wash Boot</b> 은평갈현점</h1>
                                    <h3 class="h2">서울특별시 은평구 갈현동 464-22번지</h3>
                                    <p>
                                        최신식 시설을 자랑하는 Wash Boot 입니다. <br>
                                        옆 차와 간섭없는 넓은 공간에서 쾌적한 셀프세차하러 오세요.
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
                                <img class="img-fluid" src="${path}/resources/assets/img/bongcheon.jpg" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1"><b>Wash Boot</b> 관악봉천점</h1>
                                    <h3 class="h2">서울특별시 관악구 봉천동 1538-1</h3>
                                    <p>
                                        최신식 시설을 자랑하는 Wash Boot 입니다. <br>
                                        옆 차와 간섭없는 넓은 공간에서 쾌적한 셀프세차하러 오세요.
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
                                <img class="img-fluid" src="${path}/resources/assets/img/yongmoon.JPG" alt="">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1"><b>Wash Boot</b> 용문점</h1>
                                    <h3 class="h2">서울특별시 용산구 용문동 32-18</h3>
                                    <p>
                                        최신식 시설을 자랑하는 Wash Boot 입니다. <br>
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

        <!-- 지점정보 -->
        <div class="container py-5">
            <div class="input-group"
                 style="width:30%;margin-bottom:1%;margint-right:1%;align-items:center;float:right;">
                <input type="text" class="form-control" id="search" placeholder="Search">
                <div class="input-group-text" id="search" style="height:40px;">
                    <i class="fa fa-fw fa-search" onclick="inputSearch()"></i>
                </div>
                <div style="margin-left:3%;"><i class="fa fa-crosshairs" onclick="myLocation();"
                                                style="cursor:pointer;"></i></div>
            </div>
            <div id="map" style="width:100%;height:600px;margin-bottom:5%;position:relative;">
                <c:forEach var="list" items="${washList }">
                    <c:set var="time" value="${fn:split(list.time,'~')}"/>
                    <fmt:parseDate var="open_time" value="${time[0]}" pattern="HH:mm"/>
                    <fmt:parseDate var="end_time" value="${time[1]}" pattern="HH:mm"/>

                    <div class="col-12 col-md-5 infoHidden" id="${list.no }">
                        <div class="card h-100">
                            <div style="text-align:end;margin:0.5% 2%;"><span class="close">X</span></div>
                            <div style="width:100%;height:43%;">
                                <img src="${path}/resources/assets/img/${list.img}" class="card-img-top" alt="..."
                                     height=100%>
                            </div>
                            <div class="card-body">
                                <ul class="list-unstyled d-flex justify-content-between star">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="h3 text-decoration-none text-dark text-right">${list.name }</li>
                                </ul>
                                <div class="list">
                                    <i class="fa fa-map-marker-alt"></i>
                                    <span class="card-text h3">${list.address }</span>
                                </div>
                                <div class="list">
                                    <i class="fa fa-clock"></i>
                                    <span class="card-text h3 h3">
								<fmt:formatDate value="${open_time}" pattern="kk:mm"/> ~ <fmt:formatDate
                                            value="${end_time}" pattern="kk:mm"/>
							</span>
                                </div>
                                <div class="list">
                                    <i class="fa fa-phone"></i>
                                    <span class="card-text h3">${list.tel }</span>
                                </div>
                                <div class="list-regist">
                                    <div><p class="text-muted pt-4">Reviews (24)</p></div>
                                    <div><input type="button" id="btn_res" class="btn-join" value="예약하기"
                                                onclick="reservation(${list.no });"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

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
                    <a data-bs-toggle="collapse" role="button" href="#res_YangPyeong" aria-expanded="false"
                       aria-controls="res_YangPyeong"
                       onclick="getTodayResList('1'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-side fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">양평로점</h2>
                        </div>
                    </a>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <a data-bs-toggle="collapse" role="button" href="#res_gyeonginro" aria-expanded="false"
                       aria-controls="res_gyeonginro"
                       onclick="getTodayResList('2'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">경인로점</h2>
                        </div>
                    </a>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <a data-bs-toggle="collapse" role="button" href="#res_cheonwang" aria-expanded="false"
                       aria-controls="res_cheonwang" onclick="getTodayResList('3'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-side fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">천왕점</h2>
                        </div>
                    </a>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <a data-bs-toggle="collapse" role="button" href="#res_gaje1dong" aria-expanded="false"
                       aria-controls="res_gaje1dong"
                       onclick="getTodayResList('4'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">가제1동점</h2>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 col-lg-3 pb-5">
                    <a data-bs-toggle="collapse" role="button" href="#res_kangdongseongan" aria-expanded="false"
                       aria-controls="res_kangdongseongan"
                       onclick="getTodayResList('5'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">강동성안점</h2>
                        </div>
                    </a>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <a data-bs-toggle="collapse" role="button" href="#res_majang" aria-expanded="false"
                       aria-controls="res_majang"
                       onclick="getTodayResList('6'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">성동마장점</h2>
                        </div>
                    </a>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <a data-bs-toggle="collapse" role="button" href="#res_jongam" aria-expanded="false"
                       aria-controls="res_jongam"
                       onclick="getTodayResList('7'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">성북종암점</h2>
                        </div>
                    </a>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <a data-bs-toggle="collapse" role="button" href="#res_galhyeon" aria-expanded="false"
                       aria-controls="res_galhyeon"
                       onclick="getTodayResList('8'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">은평갈현점</h2>
                        </div>
                    </a>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <a data-bs-toggle="collapse" role="button" href="#res_bongcheon" aria-expanded="false"
                       aria-controls="res_bongcheon"
                       onclick="getTodayResList('9'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">관악봉천점</h2>
                        </div>
                    </a>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <a data-bs-toggle="collapse" role="button" href="#res_yongmoon" aria-expanded="false"
                       aria-controls="res_yongmoon"
                       onclick="getTodayResList('10'); return false">
                        <div class="h-100 py-5 services-icon-wap shadow">
                            <div class="h1 text-success text-center"><i class="fa fa-car-alt fa-lg"></i></div>
                            <h2 class="h5 mt-4 text-center">용문점</h2>
                        </div>
                    </a>
                </div>

                <div class="collapse show" id="res_YangPyeong">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">양평로점 예약현황</h2><br>
                        <div id="resList1"></div>
                    </div>
                </div>
                <div class="collapse" id="res_gyeonginro">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">경인로점 예약현황</h2>
                        <div id="resList2"></div>
                    </div>
                </div>
                <div class="collapse" id="res_cheonwang">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">천왕점 예약현황</h2>
                        <div id="resList3"></div>
                    </div>
                </div>
                <div class="collapse" id="res_gaje1dong">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">가제1동점 예약현황</h2>
                        <div id="resList4"></div>
                    </div>
                </div>
                <div class="collapse" id="res_kangdongseongan">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">강동성안점 예약현황</h2>
                        <div id="resList5"></div>
                    </div>
                </div>
                <div class="collapse" id="res_majang">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">성동마장점 예약현황</h2>
                        <div id="resList6"></div>
                    </div>
                </div>
                <div class="collapse" id="res_jongam">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">성북종암점 예약현황</h2>
                        <div id="resList7"></div>
                    </div>
                </div>
                <div class="collapse" id="res_galhyeon">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">은평갈현점 예약현황</h2>
                        <div id="resList8"></div>
                    </div>
                </div>
                <div class="collapse" id="res_bongcheon">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">관악봉천점 예약현황</h2>
                        <div id="resList9"></div>
                    </div>
                </div>
                <div class="collapse" id="res_yongmoon">
                    <div class="card overflow-auto" style="height: 400px; padding:1rem 2rem">
                        <h2 align="center">용문점 예약현황</h2>
                        <div id="resList10"></div>
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
            document.getElementById("res_YangPyeong").addEventListener("show.bs.collapse", function () {
                $("#res_gyeonginro, #res_cheonwang, #res_gaje1dong, #res_kangdongseongan, #res_majang, #res_jongam, #res_galhyeon, #res_bongcheon, #res_yongmoon").collapse("hide");
            });
            document.getElementById("res_gyeonginro").addEventListener("show.bs.collapse", function () {
                $("#res_YangPyeong, #res_cheonwang, #res_gaje1dong, #res_kangdongseongan, #res_majang, #res_jongam, #res_galhyeon, #res_bongcheon, #res_yongmoon").collapse("hide");
            });
            document.getElementById("res_cheonwang").addEventListener("show.bs.collapse", function () {
                $("#res_gyeonginro, #res_YangPyeong, #res_gaje1dong, #res_kangdongseongan, #res_majang, #res_jongam, #res_galhyeon, #res_bongcheon, #res_yongmoon").collapse("hide");
            });
            document.getElementById("res_gaje1dong").addEventListener("show.bs.collapse", function () {
                $("#res_gyeonginro, #res_cheonwang, #res_YangPyeong, #res_kangdongseongan, #res_majang, #res_jongam, #res_galhyeon, #res_bongcheon, #res_yongmoon").collapse("hide");
            });
            document.getElementById("res_kangdongseongan").addEventListener("show.bs.collapse", function () {
                $("#res_gyeonginro, #res_cheonwang, #res_YangPyeong, #res_gaje1dong, #res_majang, #res_jongam, #res_galhyeon, #res_bongcheon, #res_yongmoon").collapse("hide");
            });
            document.getElementById("res_majang").addEventListener("show.bs.collapse", function () {
                $("#res_gyeonginro, #res_cheonwang, #res_YangPyeong, #res_kangdongseongan, #res_gaje1dong, #res_jongam, #res_galhyeon, #res_bongcheon, #res_yongmoon").collapse("hide");
            });
            document.getElementById("res_jongam").addEventListener("show.bs.collapse", function () {
                $("#res_gyeonginro, #res_cheonwang, #res_YangPyeong, #res_kangdongseongan, #res_majang, #res_gaje1dong, #res_galhyeon, #res_bongcheon, #res_yongmoon").collapse("hide");
            });
            document.getElementById("res_galhyeon").addEventListener("show.bs.collapse", function () {
                $("#res_gyeonginro, #res_cheonwang, #res_YangPyeong, #res_kangdongseongan, #res_majang, #res_jongam, #res_gaje1dong, #res_bongcheon, #res_yongmoon").collapse("hide");
            });
            document.getElementById("res_bongcheon").addEventListener("show.bs.collapse", function () {
                $("#res_gyeonginro, #res_cheonwang, #res_YangPyeong, #res_kangdongseongan, #res_majang, #res_jongam, #res_galhyeon, #res_gaje1dong, #res_yongmoon").collapse("hide");
            });
            document.getElementById("res_yongmoon").addEventListener("show.bs.collapse", function () {
                $("#res_gyeonginro, #res_cheonwang, #res_YangPyeong, #res_kangdongseongan, #res_majang, #res_jongam, #res_galhyeon, #res_bongcheon, #res_gaje1dong").collapse("hide");
            });


    <!-- 예약현황 : 오늘의 예약현황 보여주기 -->
    //메인페이지 로드되면 서울지점(1) 함수실행
    $( document ).ready(function() {
        getTodayResList('1');
        var message = "${msg}";
		if (window.location.pathname != '/summerboot2/') { // 로그인이 되면 url 메인으로 변경
		    location.href="${path}"
		}
		$("#1").show();
    });

    window.onpageshow = function(event) {
    	if(event.persisted) { // 뒤로가기로 페이지로드시
    		$('#div_load').hide(); // 로딩 화면을 없애주는 것
    	}
    }

            var siteNo = '1';
            function getTodayResList(todayres) { //오늘의 예약현황
                siteNo = todayres;
                $.ajax({
                    type   : "GET",
                    url    : "${path}/getTodayResList?todayres=" + todayres,
                    success: function (data) {
                        console.log(data)
                        $(`#resList\${todayres}`).html('')

                        let baseTable = `
                                 <table class="table table-hover">
                    <thead>
                    <tr style="text-align: center" >
                        <th scope="col" style="padding: 0.5rem 6.5rem">날씨</th>
                        <th scope="col" style="padding: 0.5rem 6.5rem">시간</th>
                        <th scope="col" style="padding: 0.5rem 6.5rem">예약현황<br>(예약건수/총자리수)</th>
                        <th scope="col" style="padding: 0.5rem 6.5rem">예약바로가기</th>
                    </tr>
                    </thead>
                    <tbody >`
                        if (!data || data.length === 0) {
                            baseTable += `<tr> <td colspan="4" style="text-align: center">오늘 예약이 없습니다.</td> </tr>`;
                        } else {
                            for (let i = 9; i < 24; i++) {
                                let hour        = data.filter(item => getStringBeforeSymbol(item.startTime, ':') == i).length //시간대의 예약건수
                                let fullRes     = data[0].sites; //full예약
                                let weatherIcon = getWeatherIcon(i) //날씨
                                baseTable += `
                            <tr style="text-align: center">
                            <td><img src="\${weatherIcon}" alt="날씨이미지" width="50px" height="50px"></td>
                            <td>\${i}:00</td>
                            <td>\${data.filter(item => getStringBeforeSymbol(item.startTime, ':') == i).length} / \${data[0].sites}
                            </td>
                            <td><button id="res_ch" class="btn btn-join btn-lg px-3" onclick="goReservation1()" \${fullRes == hour? 'disabled' : ''} >예약</button></td>
                            </tr>
                        `;
                            }
                        }

                        baseTable += `</tbody>
                </table>`

                        $(`#resList\${todayres}`).html(baseTable)

                    },
                    error  : function () {
                        alert("통신 실패.");
                    }
                });
            }

            function getStringBeforeSymbol(inputString, symbol) {
                const index = inputString.indexOf(symbol);
                if (index !== -1) {
                    return inputString.substring(0, index);
                }
                return null; // 기호가 없는 경우
            }

            //날씨데이터
            var weather1 = [
                <c:forEach items="${weather1}" var="data">
                {
                    time: "${data.time}",
                    pop : "${data.pop}"
                },
                </c:forEach>
            ];

            //날씨아이콘 출력
            function getWeatherIcon(time) {
                time = time < 10 ? '0' + time + "00" : '' + time + "00"; //time이 '10'미만이면 '0time00' 그렇지않으면 'time00'
                for (let i = 0; i < weather1.length; i++) {
                    if (time === weather1[i].time) { //시간 비교하여 같으면
                        if (weather1[i].pop < 30) { //30미만 sun
                            return '${path}/resources/assets/img/sun.png';
                        } else if (weather1[i].pop < 50) { //50미만 cloudy
                            return '${path}/resources/assets/img/cloudy.png';
                        } else { //50이상 rain
                            return '${path}/resources/assets/img/rain.png';
                        }
                    }
                }
            }

                function goReservation1() {
                    <%if (user_id==null) {%>
                    alert('로그인을 먼저 해주세요!');
                    <%}
                    else{%>
                    // 오늘 날짜 객체 생성
                    var today = new Date();

                    // 년, 월, 일 정보 가져오기
                    var year  = today.getFullYear();
                    var month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
                    var day   = today.getDate();

                    //20230831 형식으로
                    var formattedDate = year + (month < 10 ? '0' : '') + month + (day < 10 ? '0' : '') + day;

                window.location.href = `reservation/reservation1?no=\${siteNo}&date=\${formattedDate}`

            	$('#div_load').show();
                <%}%>
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
<script>
    var weather = [
        <c:forEach items="${weathers}" var="data" varStatus="loop">
        {
            date : "${data.date}",
            ampop: "${data.ampop}",
            pmpop: "${data.pmpop}",
            tmx  : "${data.tmx}",
            tmn  : "${data.tmn}"
        }<c:if test="${!loop.last}">, </c:if>
        </c:forEach>
    ];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
	    center: new kakao.maps.LatLng(37.56669040096864, 127.01172652194761), // 지도의 중심좌표
	    level: 8 // 지도의 확대 레벨
	};

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();

	mark();

    function inputSearch() {
        var want = document.getElementById("search").value;
        ps.keywordSearch(want, placesSearchCB);
    }

    function mark() { //각 세차장에 마크 생성
        var positions = [
            <c:forEach var="list" items="${washList }" varStatus="i">
            {
                title       : "${list.name}",
                latlng      : new kakao.maps.LatLng(${list.lat}, ${list.lon}),
                eventHandler: function () {
                    infoShow("${list.no}");
                }
            }<c:if test="${!i.last}">, </c:if>
            </c:forEach>
        ]
        var imageSrc = "${path}/resources/assets/img/marker2.png";
		// 마커 이미지의 이미지 크기 입니다
    	var imageSize = new kakao.maps.Size(53, 52);
        // 마커 이미지를 생성합니다
   		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

   		for (var i = 0; i < positions.length; i++) {
        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	            map     : map, // 마커를 표시할 지도
	            position: positions[i].latlng, // 마커를 표시할 위치
	            title   : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image   : markerImage // 마커 이미지
	        });

	        (function (marker, content, eventHandler) {
	            kakao.maps.event.addListener(marker, 'click', function () {
	                eventHandler();
	            });
	        })(marker, positions[i].content, positions[i].eventHandler);
    	}
	}

	function myLocation() { // 내 현위치 찾는 함수
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
		$(".infoHidden").hide();
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude, // 위도
				    lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition);
				map.setLevel(5);
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new kakao.maps.LatLng(37.56669040096864, 127.01172652194761);
			displayMarker(locPosition);
		}

	}


	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		$(".infoHidden").hide();
		if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	        map = new kakao.maps.Map(mapContainer, mapOption);
	        for (var i=0; i<data.length; i++) {
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	        map.setLevel(6);
	        mark();
	    }
	}

    function displayMarker(locPosition) { // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
        map.panTo(locPosition);
    }

    function map(store) {
        window.open("http://localhost:8060/summerboot2/branch/map?store=" + store, 'name(about:blank)', 'width=500, height=500');
    }

    function infoShow(no) {
        $(".infoHidden").hide();
        $("#" + no).show();
    }

    $(document).on('click', '.close', function () {
        $(".infoHidden").hide();
    });

    window.onbeforeunload = function () {
        $('#div_load').show();
    }  //현재 페이지에서 다른 페이지로 넘어갈 때 표시해주는 기능
    window.load  = function () {
        $('#div_load').hide();
    }; //페이지가 로드 되면 로딩 화면을 없애주는 것

    $(document).ready(function () {
        $('#div_load').hide();
    });

    function reservation(no) {
        <%if(user_id==null){%>
        alert('로그인을 먼저 해주세요!');
        location.href='${path}/member/login';
        <%}
        else{%>
        var date        = new Date();
        const realMonth = date.getMonth() + 1;
        const realToDay = date.getDate();
        const realYear  = date.getFullYear();

        var currentMonth = realMonth >= 10 ? realMonth : "0" + realMonth;
        var currentDate  = date.getDate() >= 10 ? date.getDate() : "0" + date.getDate();

        var currentYMD = realYear + currentMonth + currentDate;

        location.href = "${path}/reservation/reservation1?no=" + no + "&date=" + currentYMD;
        $('#div_load').show(); //현재 페이지에서 다른 페이지로 넘어갈 때 표시해주는 기능
      <%}%>
    }
</script>
<style>
    .close {
        cursor: pointer;
    }

    .list-regist {
        display: flex;
        justify-content: space-between;
        align-items: baseline;
    }
</style>
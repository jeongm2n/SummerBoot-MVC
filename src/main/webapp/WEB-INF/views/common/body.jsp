<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<title>Wash Boot</title>
	
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_ryu.css">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06a1b9ec0da85dcbc94968ce7bd3be22&libraries=services"></script>
</head>
<body>
	<div id="div_load" style="display: none;z-index:1000;">
		<img id="loading_img" src="${path }/resources/assets/img/apiLoading.gif">
	</div>
	<!-- start 세차장 배너 -->
	<div class="carousel slide" data-bs-ride="carousel" id="template-mo-zay-hero-carousel" style="margin-top:10%;background:rgba(248, 240, 229,0.6) !important;"><!--  class="carousel slide" data-bs-ride="carousel"  -->
		<ol class="carousel-indicators">
			<li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="container" style="height: 30em;">
					<div class="row p-4" style="height: 100%;">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last" style="flex-grow:2">
							<img class="img-fluid adPic" src="${path}/resources/assets/img/YangPyeong.jpg" alt="">
						</div>
						<div class="col-lg-6 mb-0 d-flex" style="flex-grow:1">
							<div class="text-align-left align-items-center">
								<h1 class="h1 ad-title">
									<b>Wash Boot</b> 양평로점
								</h1>
								<p> 서울특별시 영등포구 양평로22마길 28</p>
								<h3 class="h2" style="margin-top:5%;">
									기존 세차장과 다르게 고객님이 예약한 시간에<br>
									<b>바로바로!</b> 세차가 가능한 Wash Boot 양평로점입니다.<br>
									더나은 서비스를 위하여 여유로운 세차공간으로<br>
									고객여러분을 맞이 하고 있습니다.
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container" style="height: 30em;">
					<div class="row p-4" style="height: 100%;">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<img class="img-fluid adPic" src="${path}/resources/assets/img/gyeonginro.jpg" alt="">
						</div>
						<div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
								<h1 class="h1 ad-title">
									<b>Wash Boot</b> 경인로점
								</h1>
								<p>서울특별시 영등포구 경인로71길 50</p>
								<h3 class="h2" style="margin-top:5%;">
									줄서서 기다리지 말고, 예약을 통해서 시간아껴보세요!<br>
									지금은 <b style="color:#A73121;">핫썸머 이벤트</b> 중입니다.<br>
									방문하셔서 사은품 챙겨가세요 :)
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container" style="height: 30em;">
					<div class="row p-4" style="height: 100%;">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<img class="img-fluid adPic" src="${path}/resources/assets/img/cheonwang.jpg" alt="" style="min-height:100%;">
						</div>
						<div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
								<h1 class="h1 ad-title">
									<b>Wash Boot</b> 천왕점
								</h1>
								<p>서울특별시 구로구 천왕동 277-15</p>
								<h3 class="h2" style="margin-top:5%;">
									연중무휴 오픈 프리미엄 실내 셀프세차장<br>
									<b>700평</b> 국내 최대 규모의 실내 셀프세차장입니다.<br>
									깨끗한 시설에서 기분좋게 세차해보세요.
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container" style="height: 30em;">
					<div class="row p-4" style="height: 100%;">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<img class="img-fluid adPic" src="${path}/resources/assets/img/gaje1dong.jpg" alt="">
						</div>
						<div class="col-lg-6 mb-0 d-flex align-items-center">
                    		<div class="text-align-left">
								<h1 class="h1 ad-title">
									<b>Wash Boot</b> 가제1동점
								</h1>
								<p>서울특별시 성동구 성수1가제1동 656-310</p>
								<h3 class="h2" style="margin-top:5%;">
									<b>최신식 시설</b>을 자랑하는 Wash Boot 가제1동점입니다.<br>
									옆 차와 간섭없는 넓은 공간에서<br>
									쾌적한 셀프세차하러 오세요.
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev text-decoration-none w-auto ps-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="prev"> <i class="fas fa-chevron-left"></i>
		</a> <a class="carousel-control-next text-decoration-none w-auto pe-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="next"> <i class="fas fa-chevron-right"></i>
		</a>
	</div>
	<!-- End 세차장 배너 -->

	<!-- 지점정보 -->
	<div class="container py-5">
		<div class="input-group" style="width: 30%; margin-bottom: 1%; margint-right: 1%; align-items: center; float: right;">
			<input type="text" class="form-control" id="search" placeholder="Search">
			<div class="input-group-text" id="search" style="height: 40px;">
				<i class="fa fa-fw fa-search" onclick="inputSearch()"></i>
			</div>
			<div style="margin-left: 3%;">
				<i class="fa fa-crosshairs" onclick="myLocation();" style="cursor: pointer;"></i>
			</div>
		</div>
		<div id="map" style="width: 100%; height: 600px; margin-bottom: 5%; position: relative;">
			<c:forEach var="list" items="${washList }">
				<c:set var="time" value="${fn:split(list.time,'~')}" />
				<fmt:parseDate var="open_time" value="${time[0]}" pattern="HH:mm" />
				<fmt:parseDate var="end_time" value="${time[1]}" pattern="HH:mm" />

				<div class="col-12 col-md-5 infoHidden" id="${list.no }" style="border: 5px solid ##EEEDED;border-radius: 6px;">
					<div class="card h-100" style="border-radius: 1px;">
						<div style="text-align: end; margin: 0.5% 2%;">
							<span class="close">X</span>
						</div>
						<div style="width: 95%;height: 43%;align-self: center;">
							<img src="${path}/resources/assets/img/${list.img}" class="card-img-top" alt="..." height=100%>
						</div>
						<div class="card-body list-card" style="align-items: center;">
							<ul class="list-unstyled d-flex justify-content-between align-items-center star">
								<li>
									<c:forEach var="i" begin="1" end="${star[list.no] }" step="1">
										<i class="text-warning fa fa-star"></i>
									</c:forEach>
									<c:forEach var="i" begin="${star[list.no]+1 }" end="5" step="1">
										<i class="text-muted fa fa-star"></i>
									</c:forEach>
								</li>
								<li class="storeName text-right">${list.name }</li>
							</ul>
							<div class="list">
								<i class="fa fa-map-marker-alt"></i>
								<span class="card-text storeDetail">${list.address }</span>
							</div>
							<div class="list">
								<i class="fa fa-clock"></i>
								<span class="card-text storeDetail">
									<fmt:formatDate value="${open_time}" pattern="kk:mm" /> ~ <fmt:formatDate value="${end_time}" pattern="kk:mm" />
								</span>
							</div>
							<div class="list">
								<i class="fa fa-phone"></i>
								<span class="card-text storeDetail">${list.tel }</span>
							</div>
							<div class="list-regist">
								<div>
									<c:choose>
										<c:when test="${reviewCnt.containsKey(list.no)}">
											<p class="text-muted">Reviews (${reviewCnt[list.no] })</p>
										</c:when>
										<c:when test="${!reviewCnt.containsKey(list.no)}">
											<p class="text-muted">Reviews (0)</p>
										</c:when>
									</c:choose>
									<a onclick="showReview()"> <p style="color: #4f5050">Reviews (24)</p> </a>
								</div>
								<div>
									<input type="button" id="btn_res" class="btn-join" value="예약하기" onclick="reservation(${list.no },'0','0');">
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Start 당일예약현황 -->
	<section class="container py-5" id="todayRes">
		<div class="row text-center pb-3">
			<div class="col-lg-8 m-auto">
				<h1 class="today-title">
					<img src="${path }/resources/assets/img/todayReservation.png" style="vertical-align: bottom;"><b> Today's Reservation</b>
				</h1>
				<h2 id="today">
					<c:set var="date" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
				</h2>
				<p>
					상쾌한 셀프세차, Wash Boot와 함께!<br> Wash Boot 오늘의 예약현황과 날씨를 확인해보세요.
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_YangPyeong" aria-expanded="false" aria-controls="res_YangPyeong" onclick="getTodayResList('1'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-side fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">양평로점</h2>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_gyeonginro" aria-expanded="false" aria-controls="res_gyeonginro" onclick="getTodayResList('2'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-alt fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">경인로점</h2>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_cheonwang" aria-expanded="false" aria-controls="res_cheonwang" onclick="getTodayResList('3'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-side fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">천왕점</h2>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_gaje1dong" aria-expanded="false" aria-controls="res_gaje1dong" onclick="getTodayResList('4'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-alt fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">가제1동점</h2>
					</div>
				</a>
			</div>
			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_kangdongseongan" aria-expanded="false" aria-controls="res_kangdongseongan" onclick="getTodayResList('5'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-alt fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">강동성안점</h2>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_majang" aria-expanded="false" aria-controls="res_majang" onclick="getTodayResList('6'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-alt fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">성동마장점</h2>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_jongam" aria-expanded="false" aria-controls="res_jongam" onclick="getTodayResList('7'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-alt fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">성북종암점</h2>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_galhyeon" aria-expanded="false" aria-controls="res_galhyeon" onclick="getTodayResList('8'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-alt fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">은평갈현점</h2>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_bongcheon" aria-expanded="false" aria-controls="res_bongcheon" onclick="getTodayResList('9'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-alt fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">관악봉천점</h2>
					</div>
				</a>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<a data-bs-toggle="collapse" role="button" href="#res_yongmoon" aria-expanded="false" aria-controls="res_yongmoon" onclick="getTodayResList('10'); return false">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="h1 text-success text-center">
							<i class="fa fa-car-alt fa-lg"></i>
						</div>
						<h2 class="h5 mt-4 text-center">용문점</h2>
					</div>
				</a>
			</div>

			<div class="collapse show" id="res_YangPyeong">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍양평로점 예약현황</h5>
					<div id="resList1" class="overflow-auto"></div>
				</div>
			</div>
			<div class="collapse" id="res_gyeonginro">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍경인로점 예약현황</h5>
					<div id="resList2" class="overflow-auto"></div>
				</div>
			</div>
			<div class="collapse" id="res_cheonwang">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍천왕점 예약현황</h5>
					<div id="resList3" class="overflow-auto"></div>
				</div>
			</div>
			<div class="collapse" id="res_gaje1dong">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍가제1동점 예약현황</h5>
					<div id="resList4" class="overflow-auto"></div>
				</div>
			</div>
			<div class="collapse" id="res_kangdongseongan">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍강동성안점 예약현황</h5>
					<div id="resList5" class="overflow-auto"></div>
				</div>
			</div>
			<div class="collapse" id="res_majang">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍성동마장점 예약현황</h5>
					<div id="resList6" class="overflow-auto"></div>
				</div>
			</div>
			<div class="collapse todayHidden" id="res_jongam">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍성북종암점 예약현황</h5>
					<div id="resList7" class="overflow-auto"></div>
				</div>
			</div>
			<div class="collapse" id="res_galhyeon">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍은평갈현점 예약현황</h5>
					<div id="resList8" class="overflow-auto"></div>
				</div>
			</div>
			<div class="collapse" id="res_bongcheon">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍관악봉천점 예약현황</h5>
					<div id="resList9" class="overflow-auto"></div>
				</div>
			</div>
			<div class="collapse" id="res_yongmoon">
				<div class="card card-body" style="height: 22em;">
					<h5 class="main-si">📍용문점 예약현황</h5>
					<div id="resList10" class="overflow-auto"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- End 당일예약현황 -->

	<!-- Start 세차가이드 -->
	<section class="container py-5" style="height: 32em;">
		<div class="row text-center pt-3 justify-content-center">
			<div class="col-12 col-md-4 p-5 mt-3 popupModalVideo">
				<img src="${path}/resources/assets/img/05.jpg" class="rounded-circle img-fluid border" style="min-height: 15em;">
				<h5 class="text-center mt-3 mb-3" style="font-family: 'IBM Plex Sans KR', sans-serif;font-size: 27px;">
					<b>외부세차</b>
				</h5>
				<!-- data-video="youtube주소일부"-->
				<span class="text-center">
					<a data-video="lWHEHVpYiuk" class="btn btn-washboot" style="font-family: 'IBM Plex Sans KR', sans-serif;font-size: 20px;">가이드</a>
				</span>
			</div>
			<div class="col-12 col-md-4 p-5 mt-3 popupModalVideo">
				<img src="${path}/resources/assets/img/06.jpg" class="rounded-circle img-fluid border" style="min-height: 15em;">
				<h2 class="h5 text-center mt-3 mb-3" style="font-family: 'IBM Plex Sans KR', sans-serif;font-size: 27px;">
					<b>내부세차</b>
				</h2>
				<span class="text-center">
					<a data-video="OWj8gocWwg8" class="btn btn-washboot" style="font-family: 'IBM Plex Sans KR', sans-serif;font-size: 20px;">가이드</a>
				</span>
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
	        getTodayResList("1");
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
		
		function getTodayResList(todayres) {
			siteNo = todayres;
			var today = new Date();
			let hours = today.getHours(); // 현재시간
			if(hours < 9) { // 오픈시간이 9시부터라서 그 이전시간의 데이터들을 출력하지않기위해!
				hours = 8;
			}
			//비동기
			$.ajax({
				type   : "GET",
				url    : "${path}/getTodayResList?todayres=" + todayres, //파라미터 넘기는 방식과 컨트롤러에서 받는 방법
				success: function (data) {
				
					console.log(data)
					$(`#resList\${todayres}`).html('') // 템플릿 문자열, Jquery 사용방법
					
					let baseTable = `
						<table class="table table-hover">
						<thead style="position:sticky;top:0;background:white;">
						<tr style="text-align: center" >
							<th scope="col" style="padding: 0.5rem 6.5rem">날씨</th>
							<th scope="col" style="padding: 0.5rem 6.5rem">시간</th>
							<th scope="col" style="padding: 0.5rem 4.5rem">예약현황(예약건수/총자리수)</th>
							<th scope="col" style="padding: 0.5rem 6.5rem">예약바로가기</th>
						</tr>
						</thead>
						<tbody >`
					if (!data || data.length === 0) {
						/* baseTable += `<tr> <td colspan="4" style="text-align: center">오늘 예약이 없습니다.</td> </tr>`; */
						for (let i = hours+1; i < 24; i++) { // 현재시간 이후의 데이터만 불러오도록
                            let hour        = data.filter(item => getStringBeforeSymbol(item.startTime, ':') == i).length //시간대의 예약건수
                            let weatherIcon = getWeatherIcon(i) //날씨
							baseTable += `
								<tr style="text-align:center;vertical-align:middle;">
	                            <td><img src="\${weatherIcon}" alt="날씨이미지" width="50px" height="50px"></td>
								<td>\${i}:00</td>
								<td>0 / 8
								</td>
								<td><button id="res_ch" class="btn btn-join px-3" onclick="reservation(siteNo,'\${i}:00','1')"} >예약</button></td>
								</tr>
							`;
						}
					} else {
						for (let i = hours+1; i < 24; i++) {
                            let hour        = data.filter(item => getStringBeforeSymbol(item.startTime, ':') == i).length //시간대의 예약건수
                            let fullRes     = data[0].sites; //full예약
                            let weatherIcon = getWeatherIcon(i) //날씨
							baseTable += `
								<tr style="text-align:center;vertical-align:middle;">
	                            <td><img src="\${weatherIcon}" alt="날씨이미지" width="50px" height="50px"></td>
								<td>\${i}:00</td>
								<td>\${data.filter(item => getStringBeforeSymbol(item.startTime, ':') == i).length} / \${data[0].sites}
								</td>
								<td><button id="res_ch" class="btn btn-join btn-lg px-3" onclick="reservation(siteNo,'\${i}:00','1')" \${fullRes == hour? 'disabled' : ''} >예약</button></td>
								</tr>
							`;
						}
					}
					
					baseTable += `</tbody></table>`
					
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


		// 세차장리뷰 팝업
		function showReview() {
			try {
				var url = "${path}/review/new_rv";
				var option = "width=1000, height=500, top=130, left=250";
				window.open(url, "세차장리뷰", option)
			} catch (error) {
				console.error("에러 발생:", error);
			}
		}
	</script>
</body>
</html>
<script>

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
                title: "${list.name}",
                latlng: new kakao.maps.LatLng(${list.lat}, ${list.lon}),
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
	            map: map, // 마커를 표시할 지도
	            position:positions[i].latlng, // 마커를 표시할 위치
	            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image:markerImage // 마커 이미지
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

    function reservation(no,resTime,judge) {
        <%if(user_id==null){%>
	        alert('로그인을 먼저 해주세요!');
	        location.href='${path}/member/login';
        <%} else{%>
        var date = new Date();
        const realMonth = date.getMonth() + 1;
        const realToDay = date.getDate();
        const realYear  = date.getFullYear();

        var currentMonth = realMonth >= 10 ? realMonth : "0" + realMonth;
        var currentDate  = date.getDate() >= 10 ? date.getDate() : "0" + date.getDate();

        var currentYMD = realYear + currentMonth + currentDate;
	
        if(judge==0){
        	location.href = "${path}/reservation/reservation1?no=" + no + "&date=" + currentYMD + "&resTime=null";
        }else{
        	location.href = "${path}/reservation/reservation1?no=" + no + "&date=" + currentYMD + "&resTime=" + resTime;
        }
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
	
	.storeName {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 27px !important;
		font-weight:600 !important;
	}
	
	.storeDetail{
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 22px !important;
	}
	
	.today-title {
	    font-family: 'Kanit', sans-serif;
	    font-style: italic;
	    font-weight: 500 !important;
	    font-size: 60px !important;
	}
	
	#today {
		font-family: 'Kanit', sans-serif;
		font-size: 40px !important;
	}
	
	input {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-weight:500 !important;
	}
	
	p {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 22px !important;
	}
	
	.ad-title {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-weight:500 !important;
		font-size: 58px !important;
	}

	.h2 {
		font-family: 'IBM Plex Sans KR', sans-serif;
		margin-top : 1%;
		font-size:25px !important;
	}
	.img-fluid {
		 object-fit:fill;
	     min-height: 100%;
	}
	.text-align-left {
		text-align: right;
		align-self: end;
		padding-bottom: 1%;
		margin-right: 2%;
	}
	table {
		font-family: 'IBM Plex Sans KR', sans-serif;
		border-collapse: separate;
		border-spacing: 0;
	}
	.table>thead {
		font-size: 21px;
	}
	
	.main-si {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 30px;
		font-weight:400;
		margin-bottom:1.5rem;
	}
	
	@media (min-width: 992px){
		#template-mo-zay-hero-carousel .carousel-item {
		    min-height: 38rem !important;
		}
	}
	.adPic{
		box-shadow:11px 14px 13px 0px #B9B4C7;
	}
	tbody, td, tfoot, th, thead, tr{border-width:inherit;}
</style>

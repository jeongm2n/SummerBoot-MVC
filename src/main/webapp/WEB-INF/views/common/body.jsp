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
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_ryu.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06a1b9ec0da85dcbc94968ce7bd3be22&libraries=services"></script>
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

<!-- 지점정보 -->
<div class="container py-5">
	<div class="input-group" style="width:30%;margin-bottom:1%;margint-right:1%;align-items:center;float:right;">
		<input type="text" class="form-control" id="search" placeholder="Search">
		<div class="input-group-text" id="search" style="height:40px;">
			<i class="fa fa-fw fa-search" onclick="inputSearch()"></i>
		</div>
		<div style="margin-left:3%;"><i class="fa fa-crosshairs" onclick="myLocation();" style="cursor:pointer;"></i></div>
	</div>
	<div id="map" style="width:100%;height:600px;margin-bottom:5%;position:relative;">
		<c:forEach var="list" items="${washList }">
			<c:set var="time" value="${fn:split(list.time,'~')}" />
			<fmt:parseDate var="open_time" value="${time[0]}" pattern="HH:mm" />
			<fmt:parseDate var="end_time" value="${time[1]}" pattern="HH:mm" />
			<div class="col-12 col-md-5 infoHidden" style="position:absolute;left:58.5%;z-index:1000;height:100%;display:none;" id="${list.no }">
				<div class="card h-100">
					<div style="text-align:end;margin:0.5% 2%;"><span class="close">X</span></div>
					<div style="width:100%;height:43%;">
						<img src="${path}/resources/assets/img/${list.img}" class="card-img-top" alt="..." height=100%>
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
							 <span class="card-text h3 list-addr" onclick = "map('${list.no }');">${list.address } </span>
						</div>
						<div class="list">
							<i class="fa fa-clock"></i>
							<span class="card-text h3 h3">
								<fmt:formatDate value="${open_time}" pattern="kk:mm"/> ~ <fmt:formatDate value="${end_time}" pattern="kk:mm"/>
							</span>
						</div>
						<div class="list">
							<i class="fa fa-phone"></i>
							<span class="card-text h3">${list.tel }</span>
						</div>
						<div class="list-regist">
							<div><p class="text-muted pt-4">Reviews (24)</p></div>
							<div><input type="button" class="btn-join" value="예약하기" onclick="reservation(${list.no });"></div>
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
            <div class="card card-body overflow-auto" style="height: 400px">
                서울 본점 예약현황<br>
                <div id="resList1"></div>
            </div>
        </div>
        <div class="collapse" id="res_gunpo">
            <div class="card card-body overflow-auto" style="height: 400px">
                경기 군포점 예약현황
                <div id="resList2"></div>
            </div>
        </div>
        <div class="collapse" id="res_pyeongtaek">
            <div class="card card-body overflow-auto" style="height: 400px">
                경기 평택점 예약현황
                <div id="resList3"></div>
            </div>
        </div>
        <div class="collapse" id="res_daegu">
            <div class="card card-body overflow-auto" style="height: 400px">
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
    <!-- 예약현황 : 지점 클릭시 다른지점 섹션닫기 -->
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
    function getTodayResList(todayres) {
        //비동기
        $.ajax({
            type   : "GET",
            url    : "${path}/getTodayResList?todayres=" + todayres, //파라미터 넘기는 방식과 컨트롤러에서 받는 방법
            success: function (data) {

                console.log(data)
                $(`#resList\${todayres}`).html('') // 템플릿 문자열, Jquery 사용방법

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
                        let hour = data.filter(item => getStringBeforeSymbol(item.startTime, ':') == i).length
                        let fullRes = data[0].sites;
                        baseTable += `
                            <tr style="text-align: center">
                            <td></td>
                            <td>\${i}:00</td>
                            <td><span class="res_cnt">\${data.filter(item => getStringBeforeSymbol(item.startTime, ':') == i).length}</span>
                                <span class="slash"> / </span>
                                <span class="no_total">\${data[0].sites}</span>
                            </td>
                            <td><button id="res_ch" onclick="goReservation1()" \${fullRes == hour? 'disabled' : ''} >예약</button></td>
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

    function goReservation1() {
        window.location.href = "reservation/reservation1"
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
    
   function washList() {
	   <c:forEach var="list" items="${washList }" varStatus="i">
		{
	        title: "${list.name}", 
	        latlng: new kakao.maps.LatLng("${list.lat}", "${list.lon}"),
	        eventHandler: function() {
	            infoShow("${list.no}");
        	}
	    }<c:if test="${!i.last}">,</c:if>
		</c:forEach>
   }
</script>
</body>
</html>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(37.55060510552442, 127.07425954802976), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	mark();
	myLocation();

	function inputSearch() {
		var want = document.getElementById("search").value;
		ps.keywordSearch(want, placesSearchCB);
	}   

	function mark(){ //각 세차장에 마크 생성
		var positions = [
			<c:forEach var="list" items="${washList }" varStatus="i">
				{
					title : "${list.name}", 
					latlng : new kakao.maps.LatLng(${list.lat}, ${list.lon}),
					eventHandler : function() {
					infoShow("${list.no}");
				}
				}<c:if test="${!i.last}">,</c:if>
			</c:forEach>
		]
	
		var imageSrc = "${path}/resources/assets/img/marker2.png";
	    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(53, 52); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		    
			(function(marker, content, eventHandler) {
				kakao.maps.event.addListener(marker, 'click', function() {
					eventHandler();
				});
			})(marker, positions[i].content, positions[i].eventHandler);
		}
	}

	function myLocation() { // 내 현위치 찾는 함수
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude, // 위도
				    lon = position.coords.longitude; // 경도
				
				var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				
				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition);
			});
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new kakao.maps.LatLng(37.55060510552442, 127.07425954802976);
			displayMarker(locPosition);
		}
	}

	function displayMarker(locPosition) { // 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);      
	}

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
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
	        
	        mark();
	    } 
	}

	function map(store) {
		window.open("http://localhost:8060/summerboot2/branch/map?store=" + store, 'name(about:blank)', 'width=500, height=500');
	}
	
	function infoShow(no) {
		$(".infoHidden").hide();
		$("#" + no).show();
	}
	
	$(document).on('click', '.close', function() {
		$(".infoHidden").hide();
	});
	
	function reservation(no) {
		var date = new Date();
		const realMonth = date.getMonth()+1; 
		const realToDay = date.getDate();
		const realYear = date.getFullYear();

		var currentMonth = realMonth >= 10 ? realMonth : "0" + realMonth;
		var currentDate = date.getDate() >= 10 ? date.getDate() : "0" +date.getDate();

		var currentYMD = realYear + currentMonth + currentDate;
		
		location.href = "${path}/reservation/reservation1?no=" + no + "&date=" + currentYMD;
	}
</script>

<style>
	.close{
		cursor:pointer;
	}
	
	.list-regist {
		display:flex;
	    justify-content: space-between;
	    align-items: baseline;
	}
</style>
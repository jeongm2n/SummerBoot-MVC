<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WASHBOOT 지점</title>
	<%@ include file="./common/header.jsp" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06a1b9ec0da85dcbc94968ce7bd3be22&libraries=services"></script>
</head>
<body>
	<section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3 mb-5">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">지점 정보</h1>
                </div>
            </div>
            <div><input type="text" id="search"></div>
			<div><input type="button" onclick="inputSearch()" value="검색"></div>
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
		                            <span class="card-text h3">
		                           		 ${list.tel }
		   	                        </span>
	   	                        </div>
	   	                        <div class="list-regist">
	   	                        	<div><p class="text-muted pt-4">Reviews (24)</p></div>
	                            	<div><input type="button" class="btn-join" value="예약하기"></div>
	   	                        </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
			
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.55060510552442, 127.07425954802976), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				/* const list = [
				    '제주특별자치도 제주시 첨단로 242',
				    '경기도 성남시 분당구 판교역로 235',
				    '경기도 성남시 분당구 판교역로 231',
				    '제주특별자치도 서귀포시 상효동 산 1-2',
				    '제주특별자치도 제주시 첨단로 216-19',
				    '제주특별자치도 제주시 첨단로7길 23'
				];

				var geocoder = new kakao.maps.services.Geocoder();

				const addressSearch = address => {
				    return new Promise((resolve, reject) => {
					    geocoder.addressSearch(address, function(result, status) {
						    if (status === kakao.maps.services.Status.OK) {
							    resolve({"lat": result[0].y, "lng": result[0].x});
						    } else {
							    reject(status);
						    }
					    });
				    });
				};

				// async-await
				(async () => {
				    try {
				        const positions = [];

				        for(const address of list) {
				            const result = await addressSearch(address);
				            positions.push(result)
				        }

				        var markers = positions.map(function(position) {
				            return new kakao.maps.Marker({
				                position : new kakao.maps.LatLng(position.lat, position.lng)
				            });
				        });


				        // 클러스터러에 마커들을 추가합니다
				        clusterer.addMarkers(markers);
				    } catch (e) {
				        console.log(e);
				    }
				})(); */
				
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();
				
			    function inputSearch() {
					var want = document.getElementById("search").value;
					alert(want);
					ps.keywordSearch(want, placesSearchCB);
			    }   

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();
				        for (var i=0; i<data.length; i++) {
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}
				
				var positions = [
					<c:forEach var="list" items="${washList }" varStatus="i">
						{
					        title: "${list.name}", 
					        latlng: new kakao.maps.LatLng("${list.lat}", "${list.lon}"),
					        eventHandler: function() {
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
				        
				    displayMarker(locPosition, message);
				}
				
				// 지도에 마커와 인포윈도우를 표시하는 함수입니다
				function displayMarker(locPosition) {
	
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({  
				        map: map, 
				        position: locPosition
				    }); 
				    
				    // 지도 중심좌표를 접속위치로 변경합니다
				    map.setCenter(locPosition);      
				}
			</script>
			
            <%-- <c:forEach var="list" items="${washList }">
            	<c:set var="time" value="${fn:split(list.time,'~')}" />
           		<fmt:parseDate var="open_time" value="${time[0]}" pattern="HH:mm" />
           		<fmt:parseDate var="end_time" value="${time[1]}" pattern="HH:mm" />
	            <div class="row">
	                <div class="mb-4">
	                    <div class="card wash-card h-100">
	                        <img src="${path}/resources/assets/img/${list.img}" class="card-img-top washList" alt="...">
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
		                            <span class="card-text h3">
		                           		 ${list.tel }
		   	                        </span>
	   	                        </div>
	                            <p class="text-muted pt-4">Reviews (24)</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </c:forEach> --%>
        </div>
    </section>
    
    <%@ include file="./common/footer.jsp" %>
</body>
</html>

<script>
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
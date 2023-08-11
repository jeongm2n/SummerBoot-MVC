<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06a1b9ec0da85dcbc94968ce7bd3be22"></script>
	<script>
		var store = "${store}"; // 지점 정보 받아오기
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div
		
		if(store==1) { // 지점별 지도 중심 좌표 변경
			mapOption = { 
				center: new kakao.maps.LatLng(37.55060510552442, 127.07425954802976), // 지도의 중심좌표
			    level: 4 // 지도의 확대 레벨
			};
		} else if(store==2) {
			mapOption = { 
			    center: new kakao.maps.LatLng(37.361639035636315, 126.93520310448935), // 지도의 중심좌표
			    level: 4 // 지도의 확대 레벨
			};
		} else if(store==3) {
			mapOption = { 
			    center: new kakao.maps.LatLng(36.992265178357144, 127.11269007819229), // 지도의 중심좌표
			    level: 4 // 지도의 확대 레벨
			};
		} else if(store==4) {
			mapOption = { 
				center: new kakao.maps.LatLng(35.87139018193266, 128.60180513715827), // 지도의 중심좌표
			    level: 4 // 지도의 확대 레벨
			};
		}
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		var positions = [
		    {
		        title: 'Wash Boot 서울본점', 
		        latlng: new kakao.maps.LatLng(37.55060510552442, 127.07425954802976)
		    },
		    {
		        title: 'Wash Boot 경기군포점', 
		        latlng: new kakao.maps.LatLng(37.361639035636315, 126.93520310448935)
		    },
		    {
		        title: 'Wash Boot 경기평택점', 
		        latlng: new kakao.maps.LatLng(36.992265178357144, 127.11269007819229)
		    },
		    {
		        title: 'Wash Boot 대구점',
		        latlng: new kakao.maps.LatLng(35.87139018193266, 128.60180513715827)
		    }
		];
		
		var imageSrc = "/summerboot2/resources/assets/img/marker2.png"; 
	    
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
		}
	</script>
</body>
</html>

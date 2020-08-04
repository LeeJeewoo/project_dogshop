<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="resources/css/company.css">
<body>
<%@include file="/WEB-INF/views/header.jsp" %>


<div id="content2">
	<h1 align="center">오시는길</h1>
	<!-- <div class="c1">
		<button type="button" class="company3"><a href="company_outline">기업개요</a></button>
		<button type="button" class="company4"><a href="company_map">오시는길</a></button>
	</div> -->
	
	<div class="c2">
		<br><br><br>

	
	
	<div id="daumRoughmapContainer1583826125964" class="root_daum_roughmap root_daum_roughmap_landing"></div>
	<p><em>위치를 보시려면 마커를 클릭하세요.</em></p> 
	
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1583826125964",
			"key" : "xfnj",
			"mapWidth" : "1200",
			"mapHeight" : "500"
		}).render();
	</script>
		
		
		
		
	</div>
</div><br><br><br>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>


<!--  
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28606cbd467f66edac69d051d6683852"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.570985,  126.992504), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
// 마커를 표시할 위치입니다 
var position =  new kakao.maps.LatLng(37.570985,  126.992504);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
  position: position,
  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
});

// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
// marker.setClickable(true);

// 마커를 지도에 표시합니다.
marker.setMap(map);

// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
var iwContent = '<div style="padding:5px;">AAA 애견샵(종로본점)</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    content : iwContent,
    removable : iwRemoveable
});

// 마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'click', function() {
      // 마커 위에 인포윈도우를 표시합니다
      infowindow.open(map, marker);  
});
</script>
		
		
		
		<!-- 지도 -->



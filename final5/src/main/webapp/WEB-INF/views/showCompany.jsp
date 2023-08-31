<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- index.jsp -->
<%@ include file="top.jsp"%>

<style>
   .centered {
      text-align: center;
   }
</style>

<h2 class="text-custom" align="center">라이북러리</h2>
<div class="centered"><img src="${pageContext.request.contextPath}/resources/img/bookstore.jpg" width="100%" height="300px"></div>
<div class="centered">
   라이북러리는 다양한 지식과 문화예술경험을 여러분들께 제공합니다.
</div>

<br>
<hr>
<br>

<h3 align="center" class="text-custom">- 오시는 길 -</h3>
<br>
<h5 class="centered">주소 : 서울특별시 종로구 돈화문로 26</h5>
<br>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4045841291beea9629c8a77168d12cce"></script>
<script>

	//마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.57097047586023, 126.99252617841164); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition,
	    text:'여기로 오시면 됩니다'
	});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.57097047586023, 126.99252617841164 ), // 지도의 중심좌표
	        level: 3   // 지도의 확대 레벨
	        
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

</script>

<%@ include file="bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link rel="stylesheet" href="./src/lib/style/common.css" />
<link rel="stylesheet" href="./src/lib/style/bootstrap.css" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
.location{
	width : 100%;
	height : auto;
	margin : 10px;
	padding : 10px;
}
.location > .vehicle{
   width: 100%;
   max-width: 80%;
   margin:0 auto;
   height: max-content;
   margin-top : 20px;
}
.location > .vehicle > .bus{

   font-size: 18px;
   width: 50%;
   height: max-content;
   float: left;
   text-align: center; 
}
.location > .vehicle > .bus > img{
   margin-bottom: 15px;
}
.location > .vehicle > .bus > .bus-line{
   width: 100%;
   margin-top: 15px;
   font-size: 18px;
   text-align: left; 
}
.location > .vehicle > .bus > .bus-line > img{
   margin-right: 15px;
}
 .location > .vehicle > .car{
   font-size: 18px;
   width: 50%;
   float: left;
   height: max-content;
   text-align: center; 
}

.location > #map {
	width:100%; 
	max-width:80%;
	height:400px;
	margin:0 auto;
}

 .location > .vehicle > .car > .car-way > .way01{
   font-size: 18px;
   text-align: left;
   
}

</style>
</head>
<body>
<jsp:include page="header.jsp" />
<section class="location">
	<div id="map"></div>
   <div class="vehicle">
      <div class="bus">
         <img src="./src/lib/vehicle/img/bus.png" alt="example-image"><span class="v-title"> 버스 이용시</span>
         <div class="bus-line">
            <img src="./src/lib/vehicle/img/bus.png" alt="example-image">02 (동대입구역,장충동 환승) -> 남산서울타워 하차
         </div>
         <div class="bus-line">
            <img src="./src/lib/vehicle/img/bus.png" alt="example-image">04 (종로1가 환승) -> 남산서울타워 하차
         </div>
         <div class="bus-line">
            <img src="./src/lib/vehicle/img/bus.png" alt="example-image">402 (숭례문 환승) -> 남산도서관 하차
         </div>
         <div class="bus-line">
            <img src="./src/lib/vehicle/img/bus.png" alt="example-image">TOUR02 (광화문 환승) -> 남산케이블카 하차
         </div>
      </div>
      <div class="car">
         <img src="./src/lib/vehicle/img/car.png" alt="example-image"><span class="v-title"> 자가용 이용시</span>
         <div class="car-way">
            <div class="circle"></div>
            <div class="way01"><span class="bold">명동역 방면에서 올경우</span><br>
            <img src="./src/lib/vehicle/img/car.png" alt="example-image">남산동 공영주차장에 주차후 -> 남산서울타워방면으로 도보 이동
            </div>
             <div class="way01">
           	<img src="./src/lib/vehicle/img/car.png" alt="example-image">남산케이블카 주차장에 주차후 -> 남산서울타워방면으로 도보 이동
           	</div>
           	 <div class="way01">
         	<img src="./src/lib/vehicle/img/car.png" alt="example-image">남산공원 주차장에 주차후 -> 남산서울타워방면으로 도보 이동
     	    </div>
            <div class="circle"></div>
            <div class="way01"><span class="bold">충무로역 방면에서 올경우</span><br>
    		<img src="./src/lib/vehicle/img/car.png" alt="example-image">국립극장 주차장에 주차후 -> 남산서울타워방면으로 도보 이동
            </div>
         </div>
      </div>
   </div>
</section>
<jsp:include page="/footer.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=
	c0b0a1fb9f438191469a905ef4182136&libraries=services">
	</script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.551254, 126.988205), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    	};

	var map = new kakao.maps.Map(mapContainer, mapOption);// 지도를 생성합니다
	
	var mapTypeControl = new kakao.maps.MapTypeControl();
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 마커를 표시할 위치입니다 
	var position =  new kakao.maps.LatLng(37.551254, 126.988205);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
 	 position: position
	});

	// 마커를 지도에 표시합니다.
	marker.setMap(map);

// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
var iwContent = '<div style="padding:5px;">HOTELHOTEL</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    content : iwContent
});

// 마커에 마우스오버 이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'mouseover', function() {
  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
    infowindow.open(map, marker);
});

// 마커에 마우스아웃 이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'mouseout', function() {
    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
    infowindow.close();
});

</script>
</body>
</html>
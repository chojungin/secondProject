<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<!-- <link rel="stylesheet" href="/src/lib/style/common.css" />
<link rel="stylesheet" href="/src/lib/style/bootstrap.css" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<title>hotel hotel</title>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">

	<!-- header -->
	<jsp:include page="/header.jsp" />
	<jsp:include page="/Reservation/SelectDay.jsp" />
		
	<!-- content -->
	<!-- reservation : date select box , room select box -->
	<!-- hotel information -->
	<!-- private service .... -->

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="/src/lib/images/slide1.jpg">
				<div class="carousel-caption">
					<h3>남산</h3>
					<p>서울의 랜드마크 중 하나인 남산타워, 아름다운 도시 전경을 한 눈에 감상할 수 있습니다.</p>
				</div>
			</div>

			<div class="item">
				<img src="/src/lib/images/slide2.jpg">
				<div class="carousel-caption">
					<h3>한강</h3>
					<p>휴양시설이 다양해 자전거를 즐기거나, 크루즈를 타거나, 조류 관찰을 하기에 좋습니다.</p>
					
				</div>
			</div>

			<div class="item">
				<img src="/src/lib/images/slide3.jpg">
				<div class="carousel-caption">
					<h3>서울</h3>
					<p>계절이 오가며 풍경이 변하는 모습을 지켜보는 것은 서울살이의 다양한 즐거움입니다.</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<!-- <i class="im im-angle-left" aria-hidden="true"></i> -->
			<span class="sr-only">Previous</span>
		</a> 
		<a class="right carousel-control" href="#myCarousel" role="button"	data-slide="next"> 
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<!-- <i class="im im-angle-right" aria-hidden="true"></i> -->
			<span class="sr-only">Next</span>
		</a>
	</div>

	<!-- Container (The Band Section) -->
	<div id="band" class="container text-center">
		<h3>Hotel Hotel</h3>
		<p>
			<em>호텔 호텔을 방문하시고 서울의 아름다움을 경험하세요!</em>
		</p>
		<p>We have created a fictional band website. Lorem ipsum dolor sit
			amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
			ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
			nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
			consequat. Duis aute irure dolor in reprehenderit in voluptate velit
			esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
			cupidatat non proident, sunt in culpa qui officia deserunt mollit
			anim id est laborum consectetur adipiscing elit, sed do eiusmod
			tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
			veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
			ea commodo consequat.
		</p>
		<br>
	</div>

	<div id="tour" class="bg-1">
		<div class="container">
			<h3 class="text-center">인기 많은 객실</h3>
			<p class="text-center">
				호텔호텔을 방문해주시는 고객님들께서<br>
				가장 선호하시는 객실들입니다.
			</p>
			
			<div class="row text-center">
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="/src/lib/images/room/double1.jpg" width="400" height="300">
						<p>
							<strong>standard-double</strong>
						</p>
						<p>스탠다드 더블</p>
						<button class="btn" onclick="location.href='/room/RoomSelectAll.do'">자세히보기</button>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="/src/lib/images/room/single.jpg" width="400" height="300">
						<p>
							<strong>standard-single</strong>
						</p>
						<p>스탠다드 싱글</p>
						<button class="btn" onclick="location.href='/room/RoomSelectAll.do'">자세히보기</button>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="/src/lib/images/room/suite.jpg" width="400" height="300">
						<p>
							<strong>standard-suite</strong>
						</p>
						<p>스탠다드 스위트</p>
						<button class="btn" onclick="location.href='/room/RoomSelectAll.do'">자세히보기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp" />
</body>
</html>
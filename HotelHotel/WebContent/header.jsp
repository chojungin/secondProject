<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jquery/js -->
<script type="text/javascript" src="/Member/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/Member/js/memberUtil.js"></script>
<script type="text/javascript" src="/Member/js/ajaxUtil.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="/src/lib/style/common.css" />
<link rel="stylesheet" href="/src/lib/style/bootstrap.css" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Noto-Sans -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->

<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->


<!-- <link rel="stylesheet" href="/Member/css/font/font.css">
<link rel="stylesheet" href="/Member/css/font/layout.css"> -->
<!--  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">  -->


</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/index.jsp">HOTELHOTEL</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">호텔안내</a>
					<ul class="dropdown-menu">
						<li><a href="/introduce.jsp">호텔소개</a></li>
						<li><a href="/location.jsp">오시는길</a></li>
					</ul>
				</li>
				<li><a href="/room/RoomSelectAll.do">객실안내</a></li>
				<!-- <li><a href="#">예약안내</a></li> -->
				<li><a href="/rev_list.jsp">리뷰게시판</a></li>
				<li><a href="/list.jsp">고객센터</a></li>
				<c:if test="${sessionScope.lvl eq 2 }">
				<li><a href="/Member/managerPage.jsp">관리자 페이지</a></li>
			</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.id eq null }">
					<li><a href="/Member/memberInsert.jsp"><span
							class="glyphicon glyphicon-user"></span> 회원가입</a></li>
					<li><a href="/Member/loginView.jsp"><span
							class="glyphicon glyphicon-log-in"></span>로그인</a></li>
				</c:if>
				<c:if test="${sessionScope.id != null }">
					<li><a href="/member/logout.do"><span
							class="glyphicon glyphicon-user"></span> 로그아웃</a></li>
					<li><a href="/member/myInfo.do"><span
							class="glyphicon glyphicon-log-in"></span>내정보</a></li>
					<li><a href="#"><span
							class="glyphicon glyphicon-log-in"></span>${sessionScope.id }님 환영합니다.</a></li>
							<input type="hidden"  id="sessionId" value = "${sessionScope.id }">
				</c:if>
			</ul>
		</div>
	</nav>
</body>
</html>
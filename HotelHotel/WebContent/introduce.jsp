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
body{
  font-family: "돋움", dotum, "굴림", gulim, arial, helvetica, sans-serif;
}
.introduce{
	width : 100%;
	max-width : 80%;
	height : auto;
	margin : 0 auto;
	padding : 0;
}
.introduce > .main{
	text-align: center; 
}
.introduce > .info {
	overflow-x: auto;
}
.introduce > .info > table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
.introduce > .info > th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
th:nth-child(2n), td:nth-child(2n) {
    background-color: #bbdefb;
  }
  th:nth-child(2n+1), td:nth-child(2n+1) {
    background-color: #e3f2fd;
  }

</style>
</head>
<body>
<jsp:include page="header.jsp" />

<section class="introduce">
	<div class="main">
	
	<h1>호텔 소개</h1>
	<img src="./src/lib/introduce/img/hotel.jpg" style="max-width:80%; height : auto;">
	<h2> 도심 속 로맨틱 아일랜드 HOTELHOTEL </h2>
	구름과 맞닿은 곳에서 남산의 자연과 여유로운 휴식을 즐길수 있는 곳<br><br><br>
	서울의 중심, 서울의 상징이자 서울의 가장 높은곳에서 서울의 가장 아름다운 모습을 한눈에 내려다 볼 수 있는 곳<br>
	한국에서 가장 발달한 곳에서 가장 자연을 즐길수 있는 곳에 여러분을 초대합니다.<br>
	
	<h2>HOTELHOTEL에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다.</h2>
	</div>

<div class="info">
<table>
	<tr>
		<td>
			등급
		</td>
		<td>
			<img src="./src/lib/introduce/img/star.png" alt>
			<img src="./src/lib/introduce/img/star.png" alt>
			<img src="./src/lib/introduce/img/star.png" alt>
			<img src="./src/lib/introduce/img/star.png" alt>
			<img src="./src/lib/introduce/img/star.png" alt>
		</td>
	</tr>
	<tr>
		<td>
			객 실 수
		</td>
		<td>
			12실
		</td>
	</tr>
	<tr>
		<td>
			부 대 시 설
		</td>
		<td>
			N서울타워, 수영장, 레스토랑, PC방, 당구장, 볼링장, 골프장, 스키장
		</td>
	</tr>
	<tr>
		<td>
			수 상 내 역
		</td>
		<td>
			<img src="./src/lib/introduce/img/trophy.png" alt> <h2>김지훈상(대상)</h2>
		</td>
	</tr>
	<tr>
		<td>
			비전과 철학
		</td>
		<td>
			HOTELHOTEL은 ‘아시아 TOP3 브랜드 호텔’ 로 성장한다는 비전 아래 지속적인 변화와 혁신을 추구하고 있습니다. <br>
			또한 전 부문에 걸친 Quality-Up을 위한 철학을 바탕으로 더욱 세련되고 정교한 품질의 서비스와 시설을 만들어가고 있습니다. <br>
			이제 HOTELHOTEL은 대한민국을 대표하는 글로벌 리딩 체인호텔로 발돋움하며 그 브랜드 가치를 세계적으로 더욱 높일 것입니다.<br>
			 또한 호텔리어들은 고객에게 감동을 주는 최고의 호텔리어가 되고 고객으로부터 프로로서의 자부심과 열정을 잊지 않는 사명감으로 일하고 있습니다.
		</td>
	</tr>
</table>
</div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>
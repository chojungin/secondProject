<%@page import="room.roomDAO.RoomDAO"%>
<%@page import="room.roomVO.RoomVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <link rel="stylesheet" href="/src/lib/style/common.css" />-->
<link rel="stylesheet" href="/src/lib/style/room/style.css" />
<title>객실 안내</title>
<!-- 객실 전체보기 -->
</head>
<body>
<script type="text/javascript">

$(document).ready(function() {
	$(document).on('click','#selectReq',selectReq);
});

function selectReq(){
	
	var option1 = $('#sortBox1  option:selected').val();
	var option2 = $('#sortBox2  option:selected').val();
	
	var param = {
			option1 : option1,
			option2 : option2
	}
	
	location.href="/room/RoomSort.do?option1=" + option1 + "&option2=" + option2;
}

	$(function(){
		//modal
		$("#roomList > .room").click(function(){
			
			var param = { room_no : $(this).children(".no").text() };
			
			$.ajax({
				url : 'RoomSelectOne.do',
				type : 'post',
				data : param,
				dataType : 'text',
				success : function(data){
					//console.log(data);
					var jsonObj = JSON.parse(data);
					//console.log(jsonObj.no);
					$(".modal > .layer > .tempBox").html(""); //.tempBox reset
					//var imgSrc = $(this).children("img").attr("src"); //선택한 이미지의 경로 받아오기
					var roomLev = jsonObj.lev;
					var roomNo = jsonObj.no;
					var roomPic = jsonObj.pic;
					var roomPrice = jsonObj.price;
					
					$(".modal").css("display","block");
					$(".modal > .layer > .tempBox").append("<img class='layerImg' src="+roomPic+">");
					//.tempBox에 선택한 이미지의 경로를 가진 img태그를 넣어줌
					$(".modal > .layer > .tempBox").append("<p><span>객실호수</span>"+roomNo+"호</p>");
					$(".modal > .layer > .tempBox").append("<p><span>객실등급</span>"+roomLev+"</p>");
					$(".modal > .layer > .tempBox").append("<p><span>기본가격</span>"+roomPrice+"원</p>");
					$(".modal > .layer > .tempBox").append("<p class='introduce'>서울의 야경을 한눈에 볼 수 있는 남산에<br />위치한 호텔호텔에서 인상적인 최상의 휴식을 경험하십시오.</p>");
										
					$(".modal > .layer > a.exit").click(function(){ //닫기버튼 클릭시 모달창 닫음
						$(".modal").css("display","none");
					});
					
				},
				error : function(error){
					console.log(error);
				}
			}); //ajax-end 
			
		}); //click-function-end
		
	}); //function-end
	
</script>
<!-- header -->
<jsp:include page="/header.jsp"/>
<div class="wrap">
	<div class="intro">
		<p class="pageTitle">
			<span>객실안내</span>
			<br/>
			객실에 대한 안내입니다.
		</p>
	</div>
	<div class="section">
		<form action="/RoomSort.do">
			<select name="sortBox1" id = "sortBox1">
			    <option selected="selected" value="all">객실층</option>
			    <option value="20">2층</option>
			    <option value="30">3층</option>
			    <option value="40">4층</option>
			</select>
			<select name="sortBox2" id="sortBox2">
			    <option selected="selected" value="all">객실등급</option>
			    <option value="single">single</option>
			    <option value="double">double</option>
			    <option value="twin">twin</option>
			</select>
			<input type="button" id="selectReq" value="조건검색"/>
		</form>
		<ul id="roomList">
		<c:forEach var="list" items="${roomlist}">
			<li class="room">
				<img src="${list.room_pic}" alt="객실이미지" />
				<p class="txt lev">${list.room_lev}</p>
				<p class="txt no">${list.room_no}</p>
			</li>
		</c:forEach>
		</ul>
	</div>
	</div>
<div class="modal"> 
	<div class="layer">
		<a class="exit" href="#">
			<img src="/src/lib/images/room/exit.png" alt="닫기" />
		</a>
		<div class="tempBox">
			<!-- 사용자가 클릭한 객실의 정보가 임시로 저장되어 출력되는 곳 -->
		</div>
		<button class="btnResv">예약하기</button>
	</div>
</div>
<!-- footer -->
<jsp:include page="/footer.jsp"/>
</body>
</html>
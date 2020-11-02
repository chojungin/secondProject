<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="reserv.reservVO.ReservVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reserv.reservDAO.ReservDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>

<%-- <%
    String name = (String)request.getAttribute("name");
    String phone = (String)request.getAttribute("phone");
    int totalPrice = (int)request.getAttribute("totalPrice");    
%> --%>

<!-- <script type="text/javascript" src="/Reservation/js/jquery-3.2.1.min.js"></script> -->

<style type="text/css">
.roomImg{
max-width: 100%;
  height: auto !important;

}
Sample>div.button {
	margin: auto;
	width: 50%;
}

div.button input {
	padding: 15px;
	width: 100%;
	font-size: 20px;
	font-style: bold;
	
	
}</style>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
table, th, td {
	border: 1px solid #bcbcbc;
}
</style>


<script type="text/javascript">

function change(color)
{
     document.bgColor = color;
}
	function changeTrColor(trObj, oldColor, newColor) {
		trObj.style.backgroundColor = newColor;
		trObj.onmouseout = function() {
			trObj.style.backgroundColor = oldColor;
		}
	}

	function clickTrEvent(trObj) {
		alert(trObj.id);
	}
	// 테이블의 Row 클릭시 값 가져오기
	$(document).ready(function() {

		/* <c:set var='status1' value = '1'/> */

		$(document).delegate('#RoomTable tr', 'click', clickedRoomInfo);
		$(document).delegate('#check', 'click', clickedCkeckInfo);
	});

	//테이블 클릭이벤트/////////////////////////////////////////////////////////////////////////
	function clickedRoomInfo() {

		var str = ""
		var tdArr = new Array(); // 배열 선언

		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();

		// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
		console.log("클릭한 Row의 모든 데이터 : " + tr.text());
		console.log(tr.length);
		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i) {
			tdArr.push(td.eq(i).text());
		});

		console.log("배열에 담긴 값 : " + tdArr);
		///////////////여기부터 다시시작///////////////

		// td.eq(index)를 통해 값을 가져올 수도 있다.
		//var room_no = td.eq(0).text();
		var lev = td.eq(0).text();
		var first = $('#first_date').val();
		var last = $('#Last_date').val();
		var lev2 = $('#roomClass option:selected').val();

		/* var pr = {
				
				for(td.length)
		} */

		console.log(first);
		console.log(last);
		var info = {

			lev : lev,
			first : first,
			last : last
		}

		location.href = "/reservation/RoomSelect.do?lev=" + lev + "&first="
				+ first + "&last=" + last;

		//location.href = "/reservation/RoomSelect.do?info = " +info + "";

		/* 
		$.ajax({
			url:'RoomSelect.do',
			type : 'post',
			data : info,
			dataType : 'text',
			success : function(data){
				alert(data);
				//var param = JSON.parse(data);
				var param;
				if(data == null){
					JSON.parse(data).status = 1;

				}else {
					JSON.parse(data).status = 2;

				}
				$('#status').val(2);
				console.log($('#status').val());
				console.log(${status1});
			},
			error : function(jqXHRm, status, error){
				console.log('failed',null)
			}
		}); */

		$("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());
		$("#ex1_Result2").html(str);
	}//테이블 클릭 이벤트 end----------------------------

	//제출버튼 이벤트 //////////////////////////////////////////////////////////////
	function clickedCkeckInfo() {

		var str = ""
		var tdArr = new Array(); // 배열 선언

		// 현재 클릭된 Row(<tr>)
		var tr = $('#RoomTable tr');
		var td = tr.children();
		console.log(tr);
		console.log(td.eq(1).text());

		// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.

		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i) {
			tdArr.push(td.eq(i).text());
		});

		///////////////여기부터 다시시작///////////////

		// td.eq(index)를 통해 값을 가져올 수도 있다.
		//var room_no = td.eq(0).text();
		var lev = td.eq(1).text();
		var first = $('#first_date').val();
		var last = $('#Last_date').val();
		var lev2 = $('#roomClass option:selected').val();
		var pic = $('#img3').val();
		var id = $('#sessionId').val();
		/* var option = $("input[name=option]:checked").each(function() { var test = $(this).val(); } */

		/*  $("input[name=option]:checked").each(function() { var option = $(this).val(); }; */
		/* var option = $('input:checkbox[name="option"]:checked').val(); */
		// 배열 선언
		var option = new Array();

		//each로 loop를 돌면서 checkbox의 check된 값을 가져와 담아준다.

		$("input:checkbox[name=option]:checked").each(function() {

			option.push($(this).val());

		});
		var option1;
		var option2;
		var option3;
		var option4;
		var option5;

		if (option.length == 1) {
			option1 = option[0]
			location.href = "/reservation/selectOption.do?lev=" + lev
					+ "&first=" + first + "&last=" + last + "&pic=" + pic
					+ "&option1=" + option1 + "&id=" + id;
		} else if (option.length == 2) {
			option1 = option[0];
			option2 = option[1];
			location.href = "/reservation/selectOption.do?lev=" + lev
					+ "&first=" + first + "&last=" + last + "&pic=" + pic
					+ "&option1=" + option1 + "&option2=" + option2 + "&id="
					+ id;
		} else if (option.length == 3) {
			option1 = option[0];
			option2 = option[1];
			option3 = option[2];
			location.href = "/reservation/selectOption.do?lev=" + lev
					+ "&first=" + first + "&last=" + last + "&pic=" + pic
					+ "&option1=" + option1 + "&option2=" + option2
					+ "&option3=" + option3 + "&id=" + id;
		} else if (option.length == 4) {
			option1 = option[0];
			option2 = option[1];
			option3 = option[2];
			option4 = option[3];
			location.href = "/reservation/selectOption.do?lev=" + lev
					+ "&first=" + first + "&last=" + last + "&pic=" + pic
					+ "&option1=" + option1 + "&option2=" + option2
					+ "&option3=" + option3 + "&option4=" + option4 + "&id="
					+ id;
		} else if (option.length == 5) {
			option1 = option[0];
			option2 = option[1];
			option3 = option[2];
			option4 = option[3];
			option5 = option[4];
			location.href = "/reservation/selectOption.do?lev=" + lev
					+ "&first=" + first + "&last=" + last + "&pic=" + pic
					+ "&option1=" + option1 + "&option2=" + option2
					+ "&option3=" + option3 + "&option4=" + option4
					+ "&option5=" + option5 + "&id=" + id;
		} else {
			location.href = "/reservation/selectOption.do?lev=" + lev
					+ "&first=" + first + "&last=" + last + "&pic=" + pic
					+ "&id=" + id;
		}
		console.log(option1);

		/* var pr = {
				
				for(td.length)
		} */

		/* 	location.href = "/reservation/selectOption.do?lev="+lev+"&first="+ first+"&last="+last+"&pic1="+pic1+"option="+option;   */

		//location.href = "/reservation/RoomSelect.do?info = " +info + "";
		/* 
		$.ajax({
			url:'RoomSelect.do',
			type : 'post',
			data : info,
			dataType : 'text',
			success : function(data){
				alert(data);
				//var param = JSON.parse(data);
				var param;
				if(data == null){
					JSON.parse(data).status = 1;

				}else {
					JSON.parse(data).status = 2;

				}
				$('#status').val(2);
				console.log($('#status').val());
				console.log(${status1});
			},
			error : function(jqXHRm, status, error){
				console.log('failed',null)
			}
		}); */

	}//테이블 클릭 이벤트 end----------------------------
</script>
<!--  ////////////////////////////////////날짜및 방등급 선택///////////////////////////////////////// -->
<body >
	<input type="hidden" id="status" value=0>


	<form action="/reservation/RoomSearch.do" method=post name="bgColor" value="yellow">
		<div align="center">
			<c:if test="${date1 != null }">
				<input type="date" name=firstDate id="first_date" value="${date1 }"
					style="width: 300px; height: 100px;"> ~ 
			
			<input type="date" name=lastDate id="Last_date" value="${date2 }"
					style="width: 300px; height: 100px;">
			</c:if>

			<c:if test="${date1 eq null }">
				<input type="date" name=firstDate
					style="width: 300px; height: 100px;"> ~ 
			
			<input type="date" name=lastDate style="width: 300px; height: 100px;">
			</c:if>

			<select name="roomClass" id="roomClass"
				style="width: 300px; height: 100px;" id="room">

				<option value="All">전체보기</option>

				<option value="twin">twin</option>

				<option value="double">double</option>


				<option value="single">single</option>
			</select> <input type=submit value=검색>
		</div>
	</form>



	<!-- ///////////////////////////////선택한 방 테이블 출력(예약가능한방만 출력)////////////////////////////////// -->
	<c:if test="${status eq 1 or status eq 2 }">
		<form action="/reservation/RoomSelect.do" method=post
			style="width: 100%; max-width: 65%; padding: 0 15%;">
			<table border="2" id=RoomTable class=RoomTable>

				<tr>
					<th colspan="2">등급</th>
				</tr>
				<c:forEach var="room" items="${alist1 }">
					<tbody>
						<tr>
							<td
								onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')"
								id="room_lev" colspan="2" width="200px" align="center"
								class=room_lev>${room.room_lev}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

		</form>
		<br>
		<br>
	</c:if>


	<!--  선택한 방의  사진, 옵션 , 토탈금액 및 예약버튼 출력-->

	<c:if test="${status eq 2 }">
		<form action="/reservation/selectOption.do" style="width: 100%; max-width: 65%; padding: 0 15%;">
			<c:forEach var="pic" items="${alist1 }">
			
			<table border="2">
				<tr><td><img src="${pic.room_pic }" id="img2" class = "roomImg"style="width: 600px; height: 450px;">
				<input type="hidden" id="img3" value="${pic.room_pic }"></td></tr>
				<tr><td><h3>기본가격:<fmt:formatNumber value="${pic.room_price }" pattern="#,###,###"/></h3></td></tr>
				</table>
			</c:forEach>
			<div>
			<br> <br> <input type="checkbox" name="option"
				value="조식">조식(￦10,000) <br> <input type="checkbox"
				name="option" value="풀장">풀장(￦30,000) <br> <input
				type="checkbox" name="option" value="석식">석식(￦100,000) <br>
			<input type="checkbox" name="option" value="레스토랑">레스토랑(￦250,000) <br>
			<input type="checkbox" name="option" value="스파">스파(￦20,000) <br>
			</div>
			<div class = "button">
		 <input type="button" value="제출" id=check style="width: 100%; max-width: 100%; padding: 0 100%;">
		 </div>
		</form>
	</c:if>










</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>



<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<jsp:include page="/Member/managerMenu.jsp" />


	<br>
	<div id="roomInsert"></div>
	<table class="table table-bordered table-hover text-center"	id="memberInfoList">
		<thead id="th3" name="th3"></thead>
		<tbody id="t3" name="t3"></tbody>
	</table>
	
	
	<table class="table table-bordered table-hover text-center"	id="roomClassList">
		<thead id="th5" name="th5"></thead>
		<tbody id="t5" name="t5"></tbody>
	</table>
	
	
	<div id="roomInsert2"></div>
	<table class="table table-bordered table-hover text-center"	id="roomList">
		<thead id="th7" name="th7"></thead>
		<tbody id="t7" name="t7"></tbody>
	</table>
	
	<table class="table table-bordered table-hover text-center"	id="roomList">
		<thead id="th6" name="th6"></thead>
		<tbody id="t6" name="t6"></tbody>
	</table>
		
	<div class="cent"><nav aria-label="Page navigation"><ul class="pagination" id="PageWrap"></ul></nav></div>

	<br>
	<form action="/member/insertRoomLvl.do" enctype="multipart/form-data" method="post">
		<table class="table table-bordered table-hover text-center"	id="roomInsertForm">
			<thead id="th4" name="th4"></thead>
			<tbody id="t4" name="t4"></tbody>
		</table>
	</form>
	
	
	<table class="table table-bordered table-hover text-center"	id="roomInsertForm2">
		<thead id="th8" name="th8"></thead>
		<tbody id="t8" name="t8"></tbody>
	</table>

	

		

	<style>
		.cent {
		display: table;
		margin-left: auto;
		margin-right: auto;
		}
	</style>
</body>
</html>
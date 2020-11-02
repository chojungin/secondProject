<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<!-- <script type="text/javascript" src="/Member/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/Member/js/memberUtil.js"></script>
<script type="text/javascript" src="/Member/js/ajaxUtil.js"></script> -->




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<jsp:include page="/header.jsp" />
	<table class="table table-bordered table-hover text-center"
		id="myReservTable">
		<thead>
			<tr>
				<th scope="col">RESERV_NO</th>
				<th scope="col">ROOM_LEV</th>
				<th scope="col">ROOM_NO</th>
				<th scope="col">IN_DATE</th>
				<th scope="col">DAT</th>
				<th scope="col">RESERV_DATE</th>
				<th scope="col">DEPOSIT</th>

			</tr>
		</thead>
		<tbody id="t2" name="t2">

		</tbody>
	</table>
	<style>
.cent {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>
	<div class="cent">
		<nav aria-label="Page navigation">
			<ul class="pagination" id="PageWrap">


			</ul>
		</nav>
	</div>

</body>
</html>
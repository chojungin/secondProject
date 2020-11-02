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
<br><br><br>
	<table class="table table-bordered table-hover text-center"
		id="myBoardTable">
		<thead>
			<tr>
				<th scope="col"class='text-center'>#</th>
				<th scope="col"class='text-center'>No</th>
				<th scope="col"class='text-center'>CATEGORY</th>
				<th scope="col"class='text-center'>TITLE</th>
				<th scope="col"class='text-center'>조회수</th>
				<th scope="col"class='text-center'>작성일</th>
				
			</tr>
		</thead>
		<tbody id="t1" name="t1">

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
	<style>
.container-fluid {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>
	<!-- <div class="container-fluid">
		<div class="row justify-content-center">
			<div class="card text-white bg-primary m-3" id="profile"
				style="max-width: 18rem;"></div>

		</div>
	</div> -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{
		background:url('/src/lib/images/slide1.jpg') center / cover;
	}
	
</style>
<script type="text/javascript" src="/Member/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(document).on('click', '#logo', logo);// 정보수정
	
});

function logo(){
	location.href="/index.jsp";
}

</script>
<br><br><br><br><br><br><br><br><br><br><br><br>
<div align="center">
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">
	<div class="card align-middle"
		style="width: 20rem; border-radius: 20px;">
		<div class="card-title" style="margin-top: 30px;">
			<h2 class="card-title text-center" id="logo" style="color: #113366;">HOTELHOTEL</h2>
		</div>
		<div class="card-body">
			<form class="form-signin" method="POST"	action="/member/loginCheck.do">
				<input type="text" id="uid" class="form-control" name = "lid"
					placeholder="ID" required autofocus><BR> <input
					type="password" id="upw" class="form-control" name = "lpw"
					placeholder="PW" required><br>
				<div class="checkbox"></div>
				<button id="btn-Yes" class="btn btn-lg btn-secondary btn-block"
					type="submit">로 그 인</button>
			</form>

		</div>
	</div>
</div>
	<div class="modal"></div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
<div>


</div>




</body>
</html>
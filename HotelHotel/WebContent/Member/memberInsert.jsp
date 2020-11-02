<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>


<!-- <script type="text/javascript" src="/Member/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/Member/js/memberUtil.js"></script>
<script type="text/javascript" src="/Member/js/ajaxUtil.js"></script> -->

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/header.jsp" />

	<br>
	<br>
	<br>
	<br>




	<div class="container">
		<div class="row">

			<table class="table table-hover" border=0>
				<tr>
					<td width="20%"><label>아이디</label></td>
					<td width="80%"  class='text-left'><div class=" col-lg-4"><input
						type="text" class="form-control form-control-sm" name="insertId" id="insertId"></div><label
						id="lblId"></label> <input type="hidden" name="idCheck"
						id="idCheck" value="1"></td>
				</tr>

				<tr>
					<td><label>비밀번호</label></td>
					<td><div class=" col-lg-4"><input type="password" class="form-control form-control-sm" name="insertPw1"
						id="insertPw1"></div></td>
				</tr>

				<tr>
					<td rowspan="2"><label>비밀번호 확인</label></td>
					<td rowspan="2"><div class=" col-lg-4"><input type="password" class="form-control form-control-sm" name="insertPw2"
						id="insertPw2"></div><br>
					<br>
					<label id="lblPW">비밀번호를 입력해주세요</label></td>

				</tr>
				<tr>

				</tr>

				<tr>
					<td><label>이름</label></td>
					<td><div class=" col-lg-4"><input type="text" class="form-control form-control-sm" name="insertName"
						id="insertName"></div></td>
				</tr>

				<tr>
					<td><label>닉네임</label></td>
					<td><div class=" col-lg-4"><input type="text"  class="form-control form-control-sm" name="insertNic"
						id="insertNic"></div> <input type="hidden" name="nicCheck"
						id="nicCheck" value="1"></td>

				</tr>


				<tr>
					<td><label>전화전호</label></td>
					<td><div class=" col-lg-4"><input type="text"  class="form-control form-control-sm" name="insertTel" id="insertTel"
						maxlength="13"></div> <input type="hidden" name="telCheck"
						id="telCheck" value="1"></td>
				</tr>


				<tr>
					<td colspan="2" align="center"><input type="button"
						class="btn btn-secondary" name="btnPwCheck" id="memberInsert"
						value="회원가입"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
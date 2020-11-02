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

			<table class="table table-hover" border=0 align="center">

				<tbody>
					<tr>
						<td width="20%"><label>아이디</label></td>
						<td width="80%"><label name="id" id="id">${id }</label></td>
					</tr>
					<tr>
						<td><label>비밀번호</label></td>
						<td><div class=" col-lg-4"><input type="password"  class="form-control form-control-sm" name="pw1" id="pw1"></div></td>
					</tr>
					<tr>
						<td rowspan="2"><label>비밀번호 확인</label></td>
						<td rowspan="2"><div class=" col-lg-4"><input type="password" class="form-control form-control-sm" name="pw2" id="pw2"></div><br><br>
						<label id="lblPW">비밀번호를
								입력해주세요</label>
						</td>
						
					</tr>
					<tr>
						
					</tr>
					<tr>
						<td><label>이름</label></td>
						<td><label name="name" id="name">${name }</label></td>
					</tr>
					<tr>
						<td><label>닉네임</label></td>
						<td><div class=" col-lg-4"><input type="text" class="form-control form-control-sm" name="nic" id="nic" value="${nic }"></div>
							<input type="hidden" name="nicCheck" id="nicCheck" value="0">
						</td>

					</tr>
					<tr>
						<td><label>전화전호</label></td>
						<td><div class=" col-lg-4"><input type="text" class="form-control form-control-sm" name="tel" id="tel" value="${tel }"
							maxlength="13"> <input type="hidden" name="telCheck"
							id="telCheck" value="0"></div></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button" class="btn btn-secondary"
							name="btnPwCheck" id="btnPwCheck" value="변경"> <input
							type="button" class="btn btn-secondary" name="btnMyBoardList" id="btnMyBoardList"
							value="내가 쓴 글 보기"> <input type="button" class="btn btn-secondary"
							name="btnMyReservList" id="btnMyReservList" value="내 예약정보 보기">
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>


</body>
</html>
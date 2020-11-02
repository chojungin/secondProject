<%@page import="java.util.Date"%>
<%@page import="foVO.foVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="foDAO.foDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//받아온 아이디
	String loginId ="admin";
	
	int cat=1;

	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	foDao fdao = new foDao();
	ArrayList<foVo> farray2 = fdao.getAll2(num);
	/* int comnum = Integer.parseInt(request.getParameter("comnum")); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 확인</title>
<style type="text/css" >

.sub{
font-family:'Nanum Gothic', 'dotum','돋움', sans-serif;
font-size:24px;
font-weight:bold;
color : #000000;
text-align:center;
text-decoration:none;



}


.title{
font-family:'Nanum Gothic', 'dotum','돋움', sans-serif;
font-size:12px;
font-weight:bold;
color : #000000;
text-align:center;
text-decoration:none;



}

.content{
font-family:'Nanum Gothic', 'dotum','돋움', sans-serif;
font-size:16px;
font-weight:200;
color : #000000;
text-align:center;
text-decoration:none;



}

.rev_btn {
	text-decoration:none;
	font-family:Impact;
	background:#000000;
	background:-o-linear-gradient(90deg, #000000, #756a75);
	background:-moz-linear-gradient( center top, #000000 5%, #756a75 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #000000), color-stop(1, #756a75) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#000000', endColorstr='#756a75');
	background:-webkit-linear-gradient(#000000, #756a75);
	background:-ms-linear-gradient(#000000, #756a75);
	background:linear-gradient(#000000, #756a75);
	text-indent:0px;
	line-height:1px;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:13px;
	color:#ffffff;
	width:74px;
	height:1px;
	padding:11px;
	border-color:#ffffff;
	border-width:2px;
	border-style:solid;
}

.rev_btn:active {
	position:relative;
	top:3px
}

.rev_btn:hover {
	background:#756a75;
	background:-o-linear-gradient(90deg, #756a75, #000000);
	background:-moz-linear-gradient( center top, #756a75 5%, #000000 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #756a75), color-stop(1, #000000) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#756a75', endColorstr='#000000');
	background:-webkit-linear-gradient(#756a75, #000000);
	background:-ms-linear-gradient(#756a75, #000000);
	background:linear-gradient(#756a75, #000000);
}

  
</style>
<script type="text/javascript">

function del(){

    if(confirm("삭제하시겠습니까?")){
    
        location.href = "deleteprocess.jsp?num=<%=num%>&cat=<%=cat%>&pageNum=<%=pageNum%>";
        
        return true;

    } else {

        return false;

    }

} 

</script>

</head>
<body>
<jsp:include page="header.jsp" />

<left class ="sub">Q&A 게시판</left>
<hr>


	<table style="border:1px solid #78635a; border-radius:10px; display: flex; justify-content: center; align-items: center;" width="70%" cellspacing="0" cellpadding="5"
		bgcolor="#ffffff" align="center">


		<%
			for (foVo imsi : farray2) {
		%>

		<input type="hidden" name="pageNum" value="<%=pageNum%>">

		<%-- 글번호 --%>
		<tr>
			<td width="20%" bgcolor="#ffffff" align="left">글번호 &nbsp</td>
			<td style="border:1px solid #78635a; border-radius:10px;" width="80%"><%=num%> <input type="hidden" name="num"
				value="<%=num%>"></td>

	<%cat=imsi.getCat(); %>
		</tr>



		<%-- 이름 --%>
		<tr>
			<td width="20%" bgcolor="#ffffff" align="left">아이디  &nbsp</td>


			<td style="border:1px solid #78635a; border-radius:10px;" width="80%"> <%=imsi.getWriter()%> <input type="hidden"
				name="writer" value="<%=imsi.getWriter()%>"></td>
		</tr>




		<%--제목 --%>
		<tr>
			<td width="20%" bgcolor="#ffffff" align="left">제 목</td>
			<td width="80%" style="border:1px solid #78635a; border-radius:10px;"> <%=imsi.getSubject() %><input type="hidden"
				name="subject" value="<%=loginId%>"></td>
		</tr>


		<%--글내용 --%>

		<tr>
			<td width="20%" bgcolor="#ffffff" align="left">내 용</td>
			<td width="80%" style="border:1px solid #78635a; border-radius:10px;"><textArea name="content" rows="16" cols="67"
					readonly><%=imsi.getContent()%></textArea></td>
		</tr>


		<%--목록보기 --%>

		<tr>
			<td align="right" colspan="2" bgcolor="#ffffff">
			
			
			<%if(loginId.equals("admin")){ %>
			<input type="button" class='rev_btn' value="답글쓰기"
				OnClick="window.location='recontent.jsp?num=<%=num%>&writer=<%=imsi.getWriter()%>&subject=<%=imsi.getSubject()%>&pageNum=<%=pageNum%>'">
			<%} %>
			
			<%if(loginId.equals(imsi.getWriter())){ %>
			<input type="button" class='rev_btn' value="삭제"
				OnClick="del();">
				
			<% } else if(loginId.equals("admin")){ %>
			<input type="button" class='rev_btn' value="삭제"
				OnClick="del();">
		<% } %>
			
			
			
				<input type="button" class='rev_btn' value="목록보기"
				OnClick="window.location='list.jsp?pageNum=1'"></td>
		</tr>

		<tr>

		</tr>
		<%
			}
		%>
	</table>
<!-- footer -->
<footer class="text-center">
	<a class="up-arrow" href="#myPage" data-toggle="tooltip"
		title="TO TOP"> <span class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<br><br>
	<p>COPYRIGHT © HOTELHOTEL ALL RIGHTS RESERVED.</p>
	<p>COMPANY : (주) NOSUKJA  OWNER : 여인숙</p>
	<p>ADDRESS : 서울특별시 용산구 용산2가동 남산공원길 105</p>
	<p>TEL : 000-1234-5678</p>
	<p>상담가능시간 (10:00~14:00)</p>
	<p>ACCOUNT INFO</p><br>
	<p>우리 1002-222-555999</p>
	<p>예금주 : (주) NOSUKJA 여인숙</p>
	<p style="opacity: 0.05;">
		Bootstrap Theme Made By 
		<a href="https://www.w3schools.com"	data-toggle="tooltip" title="Visit w3schools">
			www.w3schools.com
		</a>
	</p>
</footer>
<script>
	$(document).ready(
			function() {
				// Initialize Tooltip
				$('[data-toggle="tooltip"]').tooltip();

				// Add smooth scrolling to all links in navbar + footer link
				$(".navbar a, footer a[href='#myPage']").on('click',
						function(event) {

							// Make sure this.hash has a value before overriding default behavior
							if (this.hash !== "") {

								// Prevent default anchor click behavior
								event.preventDefault();

								// Store hash
								var hash = this.hash;

								// Using jQuery's animate() method to add smooth page scroll
								// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
								$('html, body').animate({
									scrollTop : $(hash).offset().top
								}, 900, function() {

									// Add hash (#) to URL when done scrolling (default click behavior)
									window.location.hash = hash;
								});
							} // End if
						});
			})
</script>
</body>
</html>
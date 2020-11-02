<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String loginId="admin";
    
    String uid = request.getParameter("uid");
//신규글은 list.jsp 에서 이동, 변수 초기값 사용
//답글은 content.jsp 에서 이동, 부모글에서 전달된 값을 반환받아 저장후 사용

int num=0, reg=0, reOrder=0, reLevel=0;

//list.jsp 로 이동할 경우 출력될 페이지번호를 저장하는 변수
//신규글:ㅣ 초기값사용
// 답글 : 부모글의 번호를 반환받아 저장



String pageNum="1";

//답글 => 부모글의 값(content.jsp에서 전달된 값) 을 반환받아 저장
if(request.getParameter("num")!=null){
	num=Integer.parseInt(request.getParameter("num"));
	reg=Integer.parseInt(request.getParameter("reg"));
	reOrder=Integer.parseInt(request.getParameter("reOrder"));
	reLevel=Integer.parseInt(request.getParameter("reLevel"));
	pageNum=request.getParameter("pageNum");
}

%>

<%--///////////////////////////////////// 글쓰기 답글쓰기 구분--%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>게시판</title>

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
<meta charset="UTF-8">
<script src="JS/jquery-3.1.1.js"></script>

<script>
 $(document).ready(function(){ 
	$("#submit").click(function(){

	if($("#subject").val().length==0){alert("제목을 입력해 주세요."); $("#subject").focus(); return false;}
	if($("#content").val().length==0){alert("본문을 입력해 주세요."); $("#content").focus(); return false;}
	});
});

 

 
 
/* function kaja() {
	if(subject.length==0 || subject.equals("")) {
		alert("제목을 입력하시오");
	}
} */
</script>



</head>
<body bgcolor="#ffffff">

<jsp:include page="header.jsp" />


<article id="contact">



<center><b>
<%-- <%if(num==0){ %> --%>
Q&A게시판
<%-- <% }else{ %> --%>
<%-- 답글쓰기
<%} %> --%>
</b><br></center>





<%--/////////////////////////////////////  답글일 경우 자동[답글]--%>


<div align="center">
<form method="post" name="writeform" action="writeProcess.jsp" onsubmit="return writeSave()">

<%--///////////////////////////////////// 페이징 변수--%>

<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="reg" value="<%=reg%>">
<input type="hidden" name="reOrder" value="<%=reOrder%>">
<input type="hidden" name="reLevel" value="<%=reLevel%>">
<input type="hidden" name="pageNum" value="<%=pageNum%>">



<table style="display: flex; justify-content: center; align-items: center; border : solid 1px gray;" width="70%"  cellspacing="0" cellpadding="5" bgcolor="#ffffff" align="center">





<%-- 이름 --%>
<tr>
<td width="20%" bgcolor="#ffffff" align="left">아이디 </td>
<td width="80%"><%=loginId %>
<input type="hidden" name="uid" value="<%=loginId%>">
</td>
</tr>




<%--제목 --%>
<tr>
<td width="20%" bgcolor="#ffffff" align="left">제 목</td>
<td width="80%">
<%-- <% if(num==0) { %> --%>
<input type="text" size="65" maxlength="50" id="subject" placeholder="제목을 입력하세요." name="subject">
<%-- <% } else { %>
<input type="text" size="65" maxlength="50" id="subject" name="subject" placeholder="subject" value="[답글]">
<% } %> --%>
</td>
</tr>


<%--글내용 --%>

<tr>
<td width="20%" bgcolor="#ffffff" align="left">내 용</td>
<td width="80%">
<textArea name="content" rows="16" cols="67" id="content" placeholder="내용을 입력하세요."></textArea>
</td>
</tr>


<%--목록보기 --%>

<tr>
<td colspan=2 align="center" colspan="2" bgcolor="#ffffff">
<input type="button" class='rev_btn' value="목록보기" OnClick="window.location='list.jsp?pageNum=1'">
<input type="submit" id="submit" class='rev_btn' value="입력">
<input type="reset" class='rev_btn' value="다시작성">
</td>
</tr> 

</table>

</form>
</div>
</article>
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
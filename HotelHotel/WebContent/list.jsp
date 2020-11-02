<%@page import="foDAO.foDao"%>
<%@page import="foVO.foVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%
    
    String loginId="admin";
    foDao fdao = new foDao();
    request.setCharacterEncoding("UTF-8");
    
    //페이징 처리 부분
    
    int pageNum=1; //페이지 번호 초기값
    if(request.getParameter("pageNum")!=null){
    	
    	pageNum=Integer.parseInt(request.getParameter("pageNum"));
    }
    
    //한 페이지 출력 게시글 수
    
    int pageSize =10;
    int startr = (pageNum -1)*pageSize+1;
    int endr = pageNum*pageSize;
    
    //전체 개시글 갯수
    int allCnt = fdao.getnumber(); 
    
    //역출력 
    
  
    int ende = allCnt-(pageNum-1)*pageSize;
    int starte = ende-(pageSize-1);
    
    //전체 페이지수
    
    int allPage = allCnt / pageSize + (allCnt%pageSize == 0 ? 0 : 1);
    
    
    //유효성 검사
    
    if(pageNum <=0 || pageNum > allPage){
    	pageNum = 1;
    }
    
    //게시판 출력부
    
    ArrayList <foVo> farray = fdao.getAll(startr,endr);
 
    
    //페이지에 출력될 페이지의 갯수
    int pageblock =5;
    
    //각 페이지 시작 번호를 계산 
    int startpg=(pageNum/pageblock-(pageNum%pageblock!=0?0:1))*pageblock+1;
    
    //각 페이지 마지막 번호를 계산
    int endpg=startpg+pageblock-1;
    if(endpg>allPage){
    	endpg = allPage;
    }
    
    %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial=scale=1">
<title>Q&A게시판</title>
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



</head>
<body>

<jsp:include page="header.jsp" />

<left class ="sub">Q&A 게시판</left>
<hr>
<center><b>글목록(전체 글 :<%=allCnt %>)</b>
<table class ="table table-hover" width="700" align="center">
<tr align="right" height="30">
<td align="center" style="position:relative; left:300px;" bgcolor="#ffffff">
<input type="button" class='rev_btn' value="글쓰기"
	onclick="location.href='writeForm.jsp'">
</td>
</tr>


</table>
<% if(allPage==0){%>
<table border="1" width="700" cellspacing="0" cellpadding="1" align="center">
<tr align="center">
<td>저장된 게시글이 하나도 없습니다.</td>
</tr>
</table>
<%}else{%>
<table  border="1" width="700" cellspacing ="0" cellpadding="1" align="center">
<thead>

<tr class ="title" height ="30" style="	background:-webkit-linear-gradient(#8f8f8f, #ffffff);
	background:-ms-linear-gradient(#8f8f8f, #ffffff);">
<th class='text-center' align="center" width="50">번 호</th>
<th class='text-center' align="center" width="250">제 목</th>
<th class='text-center' align="center" width="100">글쓴이</th>
<th class='text-center' align="center" width="150">작성일</th>
<th class='text-center' align="center" width="50">조회수</th>
<%--<td align="center" width="100">ip</td>--%>
</tr>
</thead>
<tbody>
<form method="get" action="content.jsp">

<%for(foVo imsi : farray) {%>



<tr class ="content" height="30">
<td align ="center" width ="50"><%=imsi.getNum() %></td>
<input type="hidden" name="num" value="<%=imsi.getNum()%>">
<td align ="center" width ="50"><a href="content.jsp?num=<%=imsi.getNum() %>&pageNum=<%=pageNum%>" style="text-decoration:none;"><%=imsi.getSubject() %></a></td>
<td align ="center" width ="50"><%=imsi.getWriter() %></td>
<td align ="center" width ="50"><%=imsi.getWriDate() %></td>
<td align ="center" width ="50"><%=imsi.getReadcnt()%></td>
</tr>

<!-- 댓글 출력부  -->
<% int num2 =  imsi.getNum();
	int comnum =  fdao.getComNo(num2);%>
	
 
<%if(comnum!=0){ %>

 <%ArrayList <foVo> carray = fdao.getCom(comnum);%>
 
 
 <%for(foVo imsi2 : carray){ %>


<tr height="30">

<%-- <input type="hidden" name="num" value="<%=imsi.getNum()%>"> --%>
<%if(loginId.equals(imsi.getWriter()) || loginId.equals("admin")) {%>
<td colspan="5" align ="center" width ="50"><a href="recontentResult.jsp?num=<%=comnum %>&pageNum=<%=pageNum%>&writerName=<%=imsi.getWriter()%>" style="text-decoration:none;"><img src="./img/scom.png"></a></td>
<%}else{ %><td colspan="5" align ="center" width ="50"><img src="./img/scom.png"></td><%} %>


</tr>
<input type="hidden" name="comnum" value="<%=comnum %>">

<%} %>
<%} %>
<%} %>
</form>
</tbody>
</table>
<%} %>
</center>

<%--페이징 처리 --%>
<br>
<div align="center">
<table  class = "page" align="center" border="0" width="700">
<tr align="center">
<td>
<% if(startpg>pageblock){ %>
<a href="list.jsp?pageNum=1">[처음]</a>
<a href="list.jsp?pageNum=<%=startpg-pageblock %>">[이전]</a>
<% } %>
<% for(int i = startpg;i<=endpg;i++) {%>

<%if(pageNum!=i){ %>
<a href="list.jsp?pageNum=<%=i %>">[<%=i%>] </a>
<% } else { %>
<span styple ="color: red; font-weight : bold;">[<%=i %>]</span>
<%} %>
<%} %>


<% if(endpg!=allPage) { %>
<a href="list.jsp?pageNum=<%=startpg+pageblock %>">[다음]</a>
<a href="list.jsp?pageNum=<%=allPage %>">[마지막]</a>
<%} %>
</td>
</tr>

</table>

</div>
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
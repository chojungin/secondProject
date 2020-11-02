<%@page import="foVO.foVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="foDAO.foDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 /*    HttpSession session2 = request.getSession();
String uid = (String)session2.getAttribute("id");  
 */

 String uid = "admin";
 
 
 /*   session.setAttribute("uid", uid);
   response.sendRedirect("rev_list.jsp");
   uid = (String)session.getAttribute("uid"); */
  
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
    int allCnt = fdao.getnumber2(); 
    
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
    
    ArrayList <foVo> farray2 = fdao.revGetAll(starte,ende);
 
    
    //페이지에 출력될 페이지의 갯수
    int pageblock =5;
    
    //각 페이지 시작 번호를 계산 
    int startpg=(pageNum/pageblock-(pageNum%pageblock!=0?0:1))*pageblock+1;
    
    //각 페이지 마지막 번호를 계산
    int endpg=startpg+pageblock-1;
    if(endpg>allPage){
    	endpg = allPage;
    	
    }
    int num =1;
    int num1=0;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>

<script type="text/javascript">

function hideMenu(con){
	
	if(con.style.display =='none'){
		con.style.display ='block';
	}else{
		con.style.display ='none';
	}
	
}





function del(){

    if(confirm("삭제하시겠습니까?")){

        location.href = "comdeleteprocess.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
        
        return true;

    } else {

        return false;

    }

} 






</script>

<style type="text/css">
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

<center><div style="font-weight:bold; font-size:20px ">리뷰게시판</div>
<br>
<hr>
<br>
<form method="post" name="rev_list" action="rev_listProcess.jsp">

<%if(uid!=null){ %>
<table  width=600px>
<tr>

<td><b>${sessionScope.id }</b>님! 소중한 리뷰를 남겨주세요 </td>
<input type="hidden" name="uid" value="<%=uid %>">

</tr>
<tr>
<td><center style="border:2px solid #78635a; border-radius:10px"><textArea  name="revcontent" rows=6 placeholder="내용을 입력하세요." style="resize:none; width:99%;"></textArea></td>
</center></tr>
<br>

<input type="hidden" name="pageNum" value="<%=pageNum%>">
<tr><td> <input class='rev_btn' type="submit" value= "리뷰작성" ></td></tr>




</table>
<%}else{ %>

<center><B>리뷰를 남기려면 회원가입을 해 주세요.</B></center>
<%} %>
</form>
<br>
<br>

<% if(allPage==0){%>
<table width="700" cellspacing="0" cellpadding="1" align="center">
<tr align="center">
<td>저장된 게시글이 하나도 없습니다.</td>
</tr>
</table>
<%}else{%>
<table border="1" width=700px>
<tr>
<td align ="center" width="400px">제목</td>
<td align ="center" width="300px">작성자</td>
<td  align ="center" width="200px">날짜</td>
</tr>


<%for(foVo imsi : farray2) {%>
<table border="1" width=700px>
<tr>

<td align ="center" width="400px"> <div style="font-weight:bold; font-size:16px"  onclick="hideMenu(document.getElementById('<%=imsi.getNum() %>'))">
<%if(imsi.getContent().length()>=10){ %>

<%=imsi.getSubject() %>...


<%} else { %>

<%=imsi.getSubject() %> </td>

<%} %></div>
<td align ="center" width="300px"> <%=imsi.getWriter() %> </td>

<td align ="center" width="200px"><%=imsi.getWriDate() %></td>
</tr>
</table>

<div id = "<%=imsi.getNum() %>" style="display:none">
<table border="1" width=700px>
<tr>
<td height = "100px" align =" center" colspan="3"> <%=imsi.getContent() %></td>
</tr>
<tr><td colspan="3"> 
<%num=imsi.getNum(); %>




<%if(uid.equals(imsi.getWriter())||uid.equals("admin")){ %>
			<input type="button" class='rev_btn' value="삭제" 
				OnClick="del()">
				
		<% } %>
</td></tr>


</center>


</table>
</div>
<br>
<%} %>
<%} %>

<%--페이징 처리 --%>

<table align="center" border="0" width="700">
<tr align="center">
<td>
<% if(startpg>pageblock){ %>
<a href="rev_list.jsp?pageNum=1&uid=<%=uid%>">[처음]</a>
<a href="rev_list.jsp?pageNum=<%=startpg-pageblock %>&uid=<%=uid%>">[이전]</a>
<% } %>
<% for(int i = startpg;i<=endpg;i++) {%>

<%if(pageNum!=i){ %>
<a href="rev_list.jsp?pageNum=<%=i %>&uid=<%=uid%>">[<%=i%>] </a>
<% } else { %>
<span styple ="color: red; font-weight : bold;">[<%=i %>]</span>
<%} %>
<%} %>


<% if(endpg!=allPage) { %>
<a href="rev_list.jsp?pageNum=<%=startpg+pageblock %>&uid=<%=uid%>">[다음]</a>
<a href="rev_list.jsp?pageNum=<%=allPage %>&uid=<%=uid%>">[마지막]</a>
<%} %>
</td>
</tr>

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
<%@page import="foDAO.foDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/header.jsp" />
<%
request.setCharacterEncoding("UTF-8");
foDao fdao = new foDao();

HttpSession session2 = request.getSession();
System.out.println(session2.getAttribute("id"));

String uid=(String)session2.getAttribute("id");
 String revcontent="";
 
revcontent = request.getParameter("revcontent"); 
String revsubject="";



 if(revcontent.length()>=10){
revsubject=revcontent.substring(0,10);
}
else
	revsubject=revcontent;  



  int pageNum = Integer.parseInt(request.getParameter("pageNum")); 

  int num1 = fdao.getRevNum()+1;
  int num = fdao.countNum2()+1;

 boolean b2 = fdao.insert_rev(num, uid, revsubject, revcontent);

if(b2) 
	
	response.sendRedirect("/rev_list.jsp?pageNum="+pageNum+"&uid=" + uid);
  
    
%>

</body>
</html>
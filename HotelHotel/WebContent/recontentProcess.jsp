<%@page import="foDAO.foDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%





if(request.getMethod().equals("GET")){
	response.sendRedirect("recontent.jsp");
	return;
}



int num1 = Integer.parseInt(request.getParameter("num"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
String uid1=request.getParameter("uid");

String content1=request.getParameter("content");



request.setCharacterEncoding("UTF-8");
foDao fdao = new foDao();
boolean b1 = fdao.insert_com(num1, uid1, content1);

if(b1)
	
	response.sendRedirect("list.jsp?pageNum="+pageNum); 

%>

</body>
</html>
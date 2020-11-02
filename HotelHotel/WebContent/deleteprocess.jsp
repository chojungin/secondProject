<%@page import="foDAO.foDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
    
    <%
	//받아온 아이디
	String loginId ="admin";
	
	int cat= Integer.parseInt(request.getParameter("cat"));

	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	foDao fdao = new foDao();
	

%>
  	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>


<%
boolean d1 = fdao.delete_data(num, cat);
if(d1){
	boolean d2 = fdao.delete_com(num);
	
response.sendRedirect("list.jsp?pageNum="+pageNum);
}
%>

</body>
</html>
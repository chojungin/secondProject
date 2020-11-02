<%@page import="foDAO.foDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- 글 내용을 전달받아 board 테이블에 저장후 list.jsp 로 이동하는 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(request.getMethod().equals("GET")){
	response.sendRedirect("writeForm.jsp");
	return;
}


request.setCharacterEncoding("UTF-8");
foDao fdao = new foDao();


/* int num=Integer.parseInt(request.getParameter("num"));  */
int reg=Integer.parseInt(request.getParameter("reg"));
int reOrder=Integer.parseInt(request.getParameter("reOrder"));
int reLevel=Integer.parseInt(request.getParameter("reLevel"));
String pageNum=request.getParameter("pageNum"); 

/* int num = 0; */
String uid=request.getParameter("uid");
String subject=request.getParameter("subject");
String content=request.getParameter("content");


//IP 주소 저장
//String ip = request.getRemoteAddr();
//System.out.println("ip="+ip);



int num1 = fdao.getnumber()+1; 
int num = fdao.countNum()+1; 




boolean b1 = fdao.insert_data(num, uid, subject, content);

if(b1)
	
	response.sendRedirect("list.jsp?pageNum="+pageNum);






%>


</body>
</html>
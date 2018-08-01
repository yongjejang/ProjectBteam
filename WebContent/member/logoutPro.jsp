<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
	
<%


if(session.getAttribute("login")!= null){
	//session.removeAttribute("userID");//"userID"라는 속성의 값을 지우고
	session.invalidate(); //현재 세션영역에 있는 모든 속성 제거

	response.sendRedirect("../index.jsp");
}




%>



</head>
<body>

	
	
	

</body>
</html>

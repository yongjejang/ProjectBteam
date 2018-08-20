<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
	
<%

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");


if(session.getAttribute("memberinfo")!= null){
	//session.removeAttribute("userID");//"userID"라는 속성의 값을 지우고
	session.invalidate(); //현재 세션영역에 있는 모든 속성 제거


	
	  out.println("<script>");
	  out.println("alert('로그아웃 완료되었습니다.');");
	  out.println("location.href='../index.jsp';");
	  out.println("</script>");
	
	
	//response.sendRedirect("../index.jsp");
}




%>



</head>
<body>

	
	
	

</body>
</html>

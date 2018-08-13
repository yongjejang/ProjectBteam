<%@page import="com.fishing.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원정보</h2>
<%  
	    if(session.getAttribute("memberinfo")!=null){
        	MemberVO mvo = (MemberVO) session.getAttribute("memberinfo");

	    %>
	<form action="" method="post" onsubmit="" name="frm">
	아이디 : ${memberinfo.id}
	비밀번호 :<input type="password">
	<input type="submit" value="탈퇴">
	<input type="button"  value="취소" onclick=""> 

</form>
        	<%
        } else{
        	response.sendRedirect("../member/loginForm.jsp");
        	%>
        
          
        <%
        }
        %>

</body>
</html>
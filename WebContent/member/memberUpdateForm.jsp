<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fishing.dto.MemberVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberVO member = (MemberVO) request.getAttribute("member");
	%>
	<form action = "memberUpdate.do" method="post">
	아이디 : <input type = "text" name = "id" value="<%=member.getId() %>"><br>
	
	비밀번호 변경하기 : <a href="../member.do?command=member_password_update">비밀번호 바꾸기</a>
	
	<%-- 이 름 : <input type = "text" name = "name"
	value="<%=member.getName() %>"><br> --%>
	이메일 : <input type = "text" name = "email" value="<%=member.getEmail() %>"><br>
	<input type="submit" value="수정하기">
	<input type="reset" value="다시쓰기">
	</form>
	</body>
</html>
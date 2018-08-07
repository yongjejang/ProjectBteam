<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.fishing.dto.MemberVO"%>
<%@page import="java.util.List"%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>

<style>

#memberListArea{

	width: 400px;
	border : 1px solid gray;
	margin : auto;

}

table{

	width: 380px;
	margin : auto;
	text-align:center;

}
	

</style>


</head>
<body>

<div id ="memberListArea">
<table>	
	<tr>
		<td colspan="2"><h1>회원 목록</h1></td>
	</tr>
	<c:forEach var ="mvo" items="${sessionScope.memberList }">
	<tr>
	
		<td>
			<a href="member.do?command=member_view?id=${mvo.id }">${mvo.id }</a>
		</td>
		
		<td>
			<a href='member.do?command=member_delete?id=${mvo.id }'>삭제</a>
		</td>
	
	</tr>
	
	</c:forEach>

</table>
</div>



</body>
</html>
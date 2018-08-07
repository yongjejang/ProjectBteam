<%@ page import ="com.fishing.dto.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.*"%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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

<div class="container">

          
  <table class="table table-striped">
    <thead>
      <tr>
 			<td colspan="2"><h1>회원 목록</h1></td>
      </tr>
    </thead>
   
    <c:forEach var ="member" items="${sessionScope.memberList}">
      <tr>
       <td>
			<a href="member.do?command=member_view&id=${member.id}">${member.id}</a>
		</td>
		
		<td>
			<a href="member.do?command=member_delete&id=${member.id}">삭제</a>
		</td>
      </tr>
      </c:forEach>
    
  </table>
  <a href="index.jsp" >홈으로 돌아가기</a>
</div>



</body>
</html>
<%@page import="com.fishing.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%MemberVO member=(MemberVO)session.getAttribute("member"); %>

<%member.toString(); %>
 --%>



<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>회원관리 시스템 관리자모드(회원정보보기)</title>

<style>

#memberInfoArea{

	width: 400px;
	/* margin : auto; */
	border: 1px solid gray;
	margin-top: 100px;


}

table{

	width: 380px;
	/* margin : auto; */
	text-align: center;
	margin-top: 200px;

}

h2{

	margin-top: 150px;
	text-align: center

}
</style>

</head>
<body>
<h2>회원관리 시스템 관리자모드(회원정보보기)</h2>
<div>
<jsp:include page="../nav.jsp"></jsp:include>
</div>
<div class="container">
       
  <table class="table table-striped">
    <thead>
      <tr>
         <th>아이디</th>
        <th>비밀번호</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>닉네임</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td> ${member.id }  </td>
        <td> ${member.pw }  </td>
        <td> ${member.email }  </td>
        <td> ${member.phone }  </td>
        <td> ${member.nickName }  </td>
      </tr>
      
    </tbody>
  </table>
  <a href="member.do?command=member_list">리스트로 돌아가기</a>
</div>
	<!-- <a href="member.do?command=member_list">리스트로 돌아가기</a> -->
	
<div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>

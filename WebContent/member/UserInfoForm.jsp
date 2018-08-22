<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="com.fishing.dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	//MemberInfoAction에서 넘긴 회원정보를 추출한다.
	MemberVO member=(MemberVO)request.getAttribute("memberInfo");
%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>현재 유저정보 출력화면</title>
	
	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
		}
		
		td{
			border:1px solid skyblue
		}
		
		#title{
			background-color:skyblue
		}
		h1{
			font-size : 50px;
			text-align : center;
			margin: 50px;
		}
	</style>
	
	<script type="text/javascript">
	
		function changeForm(val){
			if(val == "-1"){
				location.href="../index.jsp";
			}else if(val == "0"){
				location.href="member.do?command=member_modify_form";
			}else if(val == "1"){
				location.href="member.do?command=member_delete_form";
			}
		}
		
	</script>
	
</head>
<body>
		<br><br>
		<h1>내 정보</h1>
		<br><br><br>
		
		<!-- 회원정보를 가져와 member 변수에 담는다. -->
		<c:set var="member" value="${requestScope.memberInfo}"/>
		
		<!-- 가져온 회원정보를 출력한다. -->
<div>
<jsp:include page="../nav.jsp"></jsp:include>
</div>
<table class="table table-striped">
 
      <tr>
      	<th>아이디</th>
        <td>${member.id}</td>
      </tr>
      <tr>
      	<th>닉네임</th>
        <td>${member.nickName}</td>
      </tr>
      <tr>
      	 <th>이메일</th>
         <td>${member.email}</td>
      </tr>
      <tr>
      	 <th>전화번호</th>
         <td>${member.phone}</td>
      </tr>
        
      
    </tbody>
  </table>
		<br>
<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th width="10%">NO</th>
				<th width="50%">제 목</th>
				<th width="20%">작성일</th>
		<h3>내가 쓴 글</h3>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="cboard1" items="${writelist }">
			<tr>
				<td>${cboard1.communityNum}</td>
				<td><a href='community.do?command=community_view&communityNum=${cboard1.communityNum}'>${cboard1.title }</a></td>
				<td>${cboard1.date }</td>	
			</tr>
		</c:forEach>

			
		</tbody>
	 
	</table>

		
		
		<input type="button" value="회원정보 변경" onclick="changeForm(0)">
		<input type="button" value="회원탈퇴" onclick="changeForm(1)">
<div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>
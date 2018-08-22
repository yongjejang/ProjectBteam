+-<%@ page import ="com.fishing.dto.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.*"%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>

<style>

#memberListArea{

	width: 400px;
	border : 1px solid gray;
	margin : auto;
	margin-top: 100px;
	
}

table{

	width: 380px;
	margin : auto;
	text-align:center;
	margin-top: 100px;
	

}
	

</style>


</head>
<body>

<div>
<jsp:include page="../nav.jsp"></jsp:include>
</div>
<div class="container">

          
  <table class="table table-striped">
    <thead>
      <tr>
 			<td colspan="2"><h1>회원 목록</h1></td>
      </tr>
    </thead>
   
    <table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th width="10%">제못</th>
				<th width="50%">컨텐</th>
				<th width="20%">작성일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="cboard1" items="${communityList }">
			<tr>
				<td>${cboard1.communityNum }</td>
				<td>			
				<a href='community.do?command=community_view&communityNum=${cboard1.communityNum}'>${cboard1.title }</a>
				</td>
				<td>${cboard1.nicname }</td>
				<td><fmt:formatDate value="${cboard1.date }" /></td>
				<td>${cboard1.count }</td>	
				
			</tr>
		</c:forEach>

			
		</tbody>
	 
	</table>

    
  </table>
  <a href="index.jsp" >홈으로 돌아가기</a>
</div>
<div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>


</body>
</html>
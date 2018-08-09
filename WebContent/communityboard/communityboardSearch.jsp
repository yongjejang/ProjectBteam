<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>민물 낚시 게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

	#writing{
	margin-left : 120px;
	}
	#search{
	margin : auto;
	text-align: center;
	
	}
	.paging{
	text-align: center;
	align : center;
	}
	
	 #headtitle{
	 	margin-top: 100px;
	 	 
	 }
</style>
<jsp:include page="../nav.jsp"></jsp:include>

</head>
<body>
<div class="container">

<h2 id="headtitle">검색 결과</h2>
 <table class="table table-bordered">
	
	<div>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th width="10%">NO</th>
				<th width="50%">제 목</th>
				<th width="10%">작성자</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="cboard1" items="${indexlist }">
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
	</div>
	<div id = "writing">
	<c:choose>
            <c:when test="${ sessionScope.memberinfo.id != null }">
            <input type= button value="글쓰기" onclick="location.href='community.do?command=community_write_form';" />
            </c:when>
      	
      </c:choose>
	</div>
	
	
	<form method="post" action="community.do?command=community_search">
	
	     <select name="search1">
    		 <option value="title" selected>제목</option>
    		 <option value="content" selected>내용</option>
    		 <option value="nicName">작성자</option>
	     </select>
<input type="text" placeholder="내용을 입력해주세요" name="search2" class="search">
<input type="submit" value="검색">

</form>
<div class="paging">
	<!-- 페이징처리  -->
	
	</div>
	
	<div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
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

	<h2 id="headtitle">민물낚시 게시판</h2>
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
	</div>
	<div id = "writing">
	<c:choose>
            <c:when test="${ sessionScope.memberinfo.id != null }">
            <input type= button value="글쓰기" onclick="location.href='community.do?command=community_write_form';" />
            </c:when>
      	
      </c:choose>
	</div>
	<div id = "search">
	     <select>
    		 <option selected>제목</option>
    		 <option>작성자</option>
	     </select>
<input type="text" class="search">
<input type="button" value="검색">
</div>
<div class="paging">
		<%
// -----------------------------현제 페이지 처리----------------------
		int nowPage = 0;
		if(request.getParameter("page") == null){
		   nowPage =1;
		}else{
		   nowPage = Integer.parseInt(request.getParameter("page"));
		}
		
		
		int totalPost = (Integer)request.getAttribute("allNum"); // 총 게시물수 119
		int postPerPage = 10;  	// 1page당 출력할 글의 수
		
		
		//---------------------------전체 페이지 수 처리---------------------------
		// 전체 글 갯수를 페이지당 글 수로 나누어 페이지수를 구함(만약 나머지가 있다면 페이지수를 1증가 시킴)		
		int totalPage =(totalPost / postPerPage);   // 82/10 -> 8.2
		if(totalPost % postPerPage > 0){ // 나머지가 있으면 totalPage 1 증가
			totalPage++;    // totalPage = 9
		}

//---------------------------------- 페이지 블럭 처리--------------------------
		int pageBlock = 5; // 블록당 페이지 수
		int totalBlock =(int) (Math.ceil((double)totalPage/(double)pageBlock)); // totalPage = 9 / pageBlock = 5 -> 1.8 -> 2(올림) //5페이지씩 2블럭
		int curPageBlock =(int) Math.ceil((double)nowPage / pageBlock); // 현재페이지가 6 라면 6/5 -> 1.2 =>  2임(올림) // 현재페이지가 6이면 2번째블럭에있단소리
		int startPage = (int)(curPageBlock * pageBlock) - (pageBlock -1 ); // 현재블럭에서  시작 으로 보여줄 페이지 번호  (1*5)-(5-1) = 5-4 = 1	
		int endPage = (int)(curPageBlock * pageBlock); // 현재 블럭에서 마지막으로 보여줄 페이지 번호   1*5 = 5
		
		if (endPage >= totalPage) {
			endPage = totalPage;
		}

//-----------------------------------실제 페이지 네비게이션 출력--------------------------------
			
			int prevPage = nowPage -1;
			
			if(prevPage == 0){ // 이전 페이지가 없을떄는 1page로
				prevPage = 1 ;
			}

			if(nowPage > 1){
				out.print("<a href='community.do?command=community_list&page=1&category=0'>◀◀</a>&nbsp;&nbsp;&nbsp;"); // 첫페이지
				out.print("<a href='community.do?command=community_list&page=" + prevPage + "&category=0'>&nbsp;이전</a>&nbsp;&nbsp;&nbsp;");  //이전페이지로 이동
			}
			
			
			for(int i=startPage; i <= endPage; i++){ 
				out.print("<a href='community.do?command=community_list&page=" + i + "&category=0'>" + i + "</a>&nbsp;&nbsp;&nbsp;");
			}

			int nextPage = nowPage + 1;
			
			if(nowPage < totalPage){
				out.print("<a href='community.do?command=community_list&page=" + nextPage + "&category=0'>&nbsp;다음</a>&nbsp;&nbsp;&nbsp;");
				out.print("<a href='community.do?command=community_list&page=" + totalPage + "&category=0'>▶▶</a>&nbsp;&nbsp;&nbsp;");
			}
		%>
		

</div>

</body>
	<div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	
</html>

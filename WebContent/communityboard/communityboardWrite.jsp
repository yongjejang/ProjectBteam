<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
  <script src="//cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<jsp:include page="../nav.jsp"></jsp:include>
<style type="text/css">
.form-write{
	padding : 70px;
}

</style>
<script>
CKEDITOR.editorConfig = function( config ) {
	config.toolbarGroups = [
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'others', groups: [ 'others' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'cleanup', 'basicstyles' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'about', groups: [ 'about' ] },
		{ name: 'colors', groups: [ 'colors' ] }
	];

	config.removeButtons = 'Underline,Subscript,Superscript,About';
};


//function writeConfirm() {
//	var success = true;
//	var titleCheck= document.frm.title.value;
//	var contentCheck = document.frm.content.value;
//	   if(titleCheck.length != 0 && contentCheck.length != 0){
//		   success = true;
//	   }else if(titleCheck.length => 50){
//		   success = false;
//		   alert("제목은 50자까지 입니다.");
//	   }
//}

</script>

</head>
<body>
<% 
session.getAttribute("memberinfo");
%>
 
<div class="container">
    <form action="community.do?command=community_write" method="post" class="form-write" name="frm" onsubmit="return writeConfirm()" enctype="multipart/form-data">
		
  <!--  <form method="post" action="../login.do" name="loginForm">  -->
    <h2> 게시글 작성 </h2>
      <div class="form-group">
        <label for="subject">제목</label>
       
        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요." required>
       <select name="category">
        	<option value="0">민물게시판</option>
        	<option value="1">바다게시판</option>
        	<option value="2">문의하기</option>
        	<c:choose>
            <c:when test="${ sessionScope.memberinfo.id eq 'aaa' }">     <%--이거고쳐야해해해해해ㅐ해해해해해햏해해해해해해해해ㅐ해해해해해해해해해해해해해 --%>
            <option value="3">공지사항</option>
        	<option value="4">관리자</option>
			</c:when>
      </c:choose>
        	        </select>
      </div>
      <div class="form-group">
        <label for=content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="20" placeholder="내용을 입력하세요." required></textarea>
      </div>
      <input type="file" name = "file">
      <input type="hidden" name="nickname" value=${memberinfo.nickName }>
      <input type="submit" class="btn btn-primary" value = "저장">
      <input type="button" value="목록으로" class="btn btn-primary" onclick="history.back();" />
    </form>
</div>		
<jsp:include page="../footer.jsp"></jsp:include>

	
</body>
</html>
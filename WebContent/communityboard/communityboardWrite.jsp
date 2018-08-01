<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
</script>

</head>
<body>
<% 
session.getAttribute("memberinfo");
%>
 
<div class="container">
    <form action="community.do" method="post" class="form-write">
  <!--  <form method="post" action="../login.do" name="loginForm">  -->
    <h2> 게시글 작성 </h2>
      <div class="form-group">
        <label for="subject">제목</label>
        <input type="text" class="form-control" id="subject" name="title" placeholder="제목을 입력하세요.">
      </div>
      <div class="form-group">
        <label for=content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="20" placeholder="내용을 입력하세요."></textarea>
      </div>
      <input type="hidden" name="command" value="community_write">
      <input type="hidden" name="nickname" value=${memberinfo.nickName }>
      <input type="submit" class="btn btn-primary" value = "저장">
      <input type="button" value="목록으로" class="btn btn-primary" onclick="location.href='community.do?command=community_list';" />
    </form>
</div>		
<jsp:include page="../footer.jsp"></jsp:include>

	
</body>
</html>
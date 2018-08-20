<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
.container{
	padding : 70px;
}
</style>
<script>
	/* function check() {
		var title = document.frm.title.value;
		var userId = document.frm.userId.value;
		var content = document.frm.content.value;
		if (title.length > 0 && userId.length >0 && content.length != "") {
			return true;	
		} else {
			alert('제목이 없거나,\r\n작성자가 없거나,\r\n 내용이 없습니다!');
			return false;
		}
	} */
	function boardCheck() {
		if (document.frm.userId.value.length == 0) {
			alert("작성자를 입력하세요");
			return fals;
		}
		else {
			
		}if (document.frm.title.value.length == 0) {
			alert("제목을 입력하세요");
			return false;
		}
		return true;
	}

	
</script>

</head>
<body>

	
<div class="container">
<h2>게시글 수정</h2>
	<form method="post" name="frm" action="community.do?command=community_update" enctype="multipart/form-data">
		 <input type="hidden" name="communityNum" value="${cboard1.communityNum }" />
		 <input type="hidden" name="category" value="${cboard1.cartegory }" >
			<input type="hidden" name = "nicname" value="${cboard1.nicname }">
		 

		 <label for="subject">제목</label> 
		 <input type="text" class="form-control" name="title" value = '${cboard1.title }' required/> <br />
		 
		 <label for="subject">작성자</label> 
		 <input type="text" class="form-control" name="title" value = '${cboard1.nicname }' required/> <br /><br />
		<%--  ${cboard1.nicname }<br />  --%>
	 <div class="form-group">
		<label for=content">내용</label>
		<textarea class="form-control" rows="15" cols="70"name="content" required>${cboard1.content }</textarea>
	</div>
		<!--<input type="image" src="${cboard1.file }"/><br />-->
		<input type="file" name = file value= "${cboard1.file }"><br />
		<input type="submit" class="btn btn-primary" value="수정" onclick="return boardCheck()" />
		<input type="reset" class="btn btn-primary" value="다시작성" /> 
		
		
		<c:if test="${cboard1.cartegory eq 0}">
		<input type="button" value="목록으로" class="btn btn-primary"
			onclick="location.href='community.do?command=community_list&page=1&category=0'" />
			</c:if>
			<c:if test="${cboard1.cartegory eq 1}">
		<input type="button" value="목록으로" class="btn btn-primary"
			onclick="location.href='community.do?command=community_list&page=1&category=1'" />
			</c:if>
	</form>
</div>	
	<div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h2>게시글 수정</h2>
	<form method="post" name="frm" action="community.do?command=community_update" enctype="multipart/form-data">
		 <input type="hidden" name="communityNum" value="${cboard1.communityNum }" />
		 <input type="hidden" name="category" value="${cboard1.cartegory }" >
			<input type="hidden" name = "nicname" value="${cboard1.nicname }">
		제목(*) : <input type="text" name="title" value = '${cboard1.title }' required/> <br />
		 작성자(*) : ${cboard1.nicname }<br /> 
		 내용(*):
		<textarea rows="15" cols="70"name="content"required>
		${cboard1.content }
		</textarea><br />
		<input type="image" src="${cboard1.file }"/><br />
		<input type="file" name = file value= "${cboard1.file }"><br />
		<input type="submit" value="수정" onclick="return boardCheck()" />
		<input type="reset" value="다시작성" /> 
		<c:if test="${cboard1.cartegory eq 0}">
		<input type="button" value="목록으로"
			onclick="location.href='community.do?command=community_list&page=1&category=0'" />
			</c:if>
			<c:if test="${cboard1.cartegory eq 1}">
		<input type="button" value="목록으로"
			onclick="location.href='community.do?command=community_list&page=1&category=1'" />
			</c:if>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 달기</title>
<script>
	function check() {
		var title = document.frm.title.value;
		var userId = document.frm.userId.value;
		var content = document.frm.content.value;
		if (title.length > 0 && userId.length >0 && content.length != "") {
			return true;	
		} else {
			alert('제목이 없거나,\r\n작성자가 없거나,\r\n 내용이 없습니다!');
			return false;
		}
	}
</script>
</head>
<body>
	<h2>댓글 달기</h2>
	<form method="post" name="frm" action="community.do" onsubmit="return check();">
		제목(*) : <input type="text" name="title" /> <br />
		작성자(*) : <input type="text" name="userid" /> <br />
		<!-- 비밀번호 : <input type="text" name="password" /> <br /> -->
		내용(*) : <textarea rows="15" cols="70" name="content"></textarea> <br />
		<input type="hidden" name="command" value="community_reply" />
		<input type="hidden" name="communityNum" value="${param.communityNum }" />
		<input type="hidden" name="ref" value="${param.ref }" />
		<input type="hidden" name="step" value="${param.step }" />
		<input type="hidden" name="reforder" value="${param.reforder }" /> 
		<input type="submit" value="저장" /> <input type="reset" value="다시작성" />
		<input type="button" value="목록으로" onclick="location.href='community.do?command=community_list';" />
	</form>
</body>
</html>
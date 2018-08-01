<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

function boardCheck() {
	if(document.frm.userId.value.length == 0){
		alert("작성자를 입력하세요");
		return false;
	}
	if(document.frm.password.value.length == 0){
		alert("비밀번호를 입력하세요");
		return false;
	}
	if(document.frm.title.value.length == 0){
		alert("제목을 입력하세요");
		return false;
	}
	return true;
}

	
//밑에서 받아서 서버로 보낸다. insert 
function save(){
	var data= $("#frmData").serialize();
	console.log(data);
	$.ajax({
	    type: 'POST', // 통신방식(get/post) 
	    url: 'boardComment', // 통신할 대상 페이지(서블릿)
	    data: data, //서버에 보낼 데이터
	    success: function (data) { // 통신에 성공했을때
	        console.log(data);
	        
	    }
	    , error: function () { // 통신에 실패했을때
	        alert('통신실패');
	    }
	});
}


</script>
 
</head>
<body>
	<div id="container">
		<h2>게시글 보기</h2>
	</div>
	<div>
	
	<table table border="3">
	
	<tr>
		<td>글번호</td>
		<td>${cboard1.communityNum}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${cboard1.title }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${cboard1.nicname } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${cboard1.date }</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${cboard1.count }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${cboard1.content }</td>
	</tr>

	</table>
	<br/>

		<input type="button" value="목록으로" onclick="location.href='community.do?command=community_list';" />
		<input type="button" value="수정" onclick="location.href='community.do?command=community_update_form&communityNum=${cboard1.communityNum}'" />
		

		<input type="button" value="삭제" onclick="location.href='community.do?command=community_delete&communityNum=${cboard1.communityNum}'" />
		<input type="button" value="댓글달기" onclick="location.href='community.do?command=community_reply_form&communityNum =${cboard1.communityNum }&ref=${cboard1.ref}&step=${cboard1.step }&reforder=${cboard1.reforder }';" />
	
	</div>

</body>
</html>
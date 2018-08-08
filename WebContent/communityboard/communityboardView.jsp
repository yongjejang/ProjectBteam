<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>


<script>
	function boardCheck() {
		if (document.frm.userId.value.length == 0) {
			alert("작성자를 입력하세요");
			return false;
		}
		if (document.frm.password.value.length == 0) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (document.frm.title.value.length == 0) {
			alert("제목을 입력하세요");
			return false;
		}
		return true;
	}
	
	function deleteCheck(){	
		var deleteConfirm = confirm("정말삭제하시겠습니까?");
		if (deleteConfirm == true) { //확인
			location.href="community.do?command=community_delete&communityNum="+${cboard1.communityNum};
		} else if(deleteConfirm == false) { 
			return false;
		}
	}
	
	//밑에서 받아서 서버로 보낸다. insert 
	function save() {
		var data = $("#frmData").serialize();
		console.log(data);
		$.ajax({
			type : 'POST', // 통신방식(get/post) 
			url : 'community.do', // 통신할 대상 페이지(서블릿)
			data : data, //서버에 보낼 데이터
			success : function(data) { // 통신에 성공했을때
				console.log(data);
				$('#a').empty("");

				for (var i = 0; i < data.length; i++) {
					$('#a').append(
							'<tr><td>' + data[i].nicname + '</td><td>'
									+ data[i].content + '</td><td>'
									+ data[i].date + '</td></tr>');

				}

			},
			error : function(req) { // 통신에 실패했을때
				alert('통신실패,상태 : ' + req.responseText);
			}
		});
	}
</script>

</head>
<body>
<div>
<jsp:include page="../nav.jsp"></jsp:include>
</div>
<% 

%>
	<%
		
		session.getAttribute("memberinfo");
		session.getAttribute("reply");
		
	%>

	<div class="row">
		<div class="col-xs-2 col-md-2"></div>
		<div class="col-xs-8 col-md-8">
			<br />
			<h2 class="text-center">게시글 보기</h2>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>

			<div class="table table-responsive">
				<table class="table">
					<tr>
						<th class="success">글번호</th>
						<td>${cboard1.communityNum}</td>
						<th class="success">조회수</th>
						<td>${cboard1.count }</td>


					</tr>
					<tr>
						<th class="success">닉네임</th>
						<td>${cboard1.nicname }</td>
						<th class="success">작성일</th>
						<td>${cboard1.date }</td>
					</tr>

					<tr>
						<th class="success">제목</th>
						<td colspan="3">${cboard1.title }</td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td colspan="3">${cboard1.content }</td>
					</tr>
					<tr>
						<th class="success">이미지</th>
						<td colspan="3"><img src="${cboard1.file }"></td>
					</tr>	

					<tr>
						<td colspan="4" class="text-center"><input type="button"
							class="btn btn-primary" value="목록으로"
							onclick="location.href='community.do?command=community_list';" />
							<c:choose>
								<c:when
									test="${ cboard1.nicname eq sessionScope.memberinfo.nickName }">
									<input type="button" class="btn btn-warning" value="수정"
										onclick="location.href='community.do?command=community_update_form&communityNum=${cboard1.communityNum}'" />
									<input type="button" class="btn btn-danger" value="삭제"
										onclick="deleteCheck()" />
									<%-- <input type="button" class="btn btn-success" value="댓글달기" onclick="location.href='community.do?command=community_reply_form&communityNum =${cboard1.communityNum }&ref=${cboard1.ref}&step=${cboard1.step }&reforder=${cboard1.reforder }';" /> --%>


								</c:when>

							</c:choose> </td>
					</tr>
				</table>
			</div>

		</div>
	</div>

	<div class="container">
		<table class="table table-borderless" id="table">
			<thead>
				<tr>
					<th>닉네임</th>
					<th>내용</th>
					<th>작성시간</th>
				</tr>
			</thead>
			<tbody id='a'>
				<c:forEach var="reply" items="${reply }">
			<tr>
				<td>${reply.nicname }</td>
				<td>${reply.content }</td>
				<td><fmt:formatDate value="${reply.date }" /></td>
				</tr>
		</c:forEach>
			</tbody>
			<tbody>
			<tr>
			<td></td>
			</tr>
			</tbody>
		</table>
	</div>
	<div class="container">
		<form id="frmData">
			<div class="form-group">
				<!--<label for="comment">Comment:</label>-->
				<textarea class="form-control" rows="5" id="comment" name="content"></textarea>
			</div>
			<input type="hidden" name="nickname" value=${memberinfo.nickName }>
			<input type="hidden" name="command" value="community_reply">
			<input type="hidden" name=ref value=${cboard1.communityNum }>
			<input type="button" class="btn btn-info" value="등록" onclick="save()">
		</form>
	</div>


</body>
</html>
<%@page import="com.fishing.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%MemberVO member=(MemberVO)session.getAttribute("login"); %> 
<%-- <%//mvo.getId();
System.out.println(member.getId().toString()); 
%> --%>



<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원정보보기)</title>

<style type="text/css">

#memberInfoArea{

	width: 400px;
	margin : auto;
	border: 1px solid gray;


}

table{

	width: 380px;
	margin : auto;
	text-align: center;

}



</style>




</head>
<body>

<div>
<table>

		<tr>
			<td> 아이디 :  </td>
			<td> ${member.id }  </td>
		
		</tr>
		<tr>
			<td> 비밀번호 :  </td>
			<td> ${member.pw }  </td>
		
		</tr>
		<tr>
			<td> 이름 :  </td>
			<td> ${member.name }  </td>
		
		</tr>
		<tr>
			<td> 이메일 :  </td>
			<td> ${member.email }  </td>
		
		</tr>
		<tr>
			<td> 생일 :  </td>
			<td> ${member.birthday }  </td>
		
		</tr>
		<tr>
			<td> 주소 :  </td>
			<td> ${member.addr }  </td>
		
		</tr>
		<tr>
			<td> 전화번호 :  </td>
			<td> ${member.phone }  </td>
		
		</tr>
		<tr>
			<td colspan="2"> 
				<a href="../member.do?command=member_list">리스트로 돌아가기</a>
			
			
			</td>
		
		</tr>


</table>
</div>

	
</body>
</html>

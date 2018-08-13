<%@page import="com.fishing.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원정보</h2>
<%  
	    if(session.getAttribute("memberinfo")!=null){
        	MemberVO mvo = (MemberVO) session.getAttribute("memberinfo");

	    %>
	  	    	${memberinfo}<br>
	  	    	아이디 : ${memberinfo.id}
	  	    	닉네임 : ${memberinfo.nickName}<br>
	  	    	전화번호 : ${memberinfo.phone}<br>
	  	    	이메일 : ${memberinfo.email}<br>
	  	    	
	  	    	생일 : ${memberinfo.birthday}<br>
	  	    	주소 : ${memberinfo.addr}<br>
	  	    	
	  <input type="button" value="회원정보 수정" onclick="location.href='member.do?command=member_update_form';"/>
	  <input type="button" value="회원정보 탈퇴" onclick="location.href='member.do?command=member_delete_form';"/>
   
          
        	<%
        } else{
        	response.sendRedirect("../member/loginForm.jsp");
        	%>
        
          
        <%
        }
        %>

</body>
</html>
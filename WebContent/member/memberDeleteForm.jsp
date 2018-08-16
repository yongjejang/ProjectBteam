<%@page import="com.fishing.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<style>
	body{
	padding-top:150px;
	}

</style>
<jsp:include page="../nav.jsp"></jsp:include>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>


<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="member.do?command=member_delete" method="POST" name="Loginform"  onSubmit = "frm">
                    <fieldset>
			    	  	<div class="form-group">
			    	  		<h3>ID : ${memberinfo.id}</h3>
			    		</div>
			    		<div class="form-group">
			    			탈퇴하시려면 아래에 비밀번호를 입력해주세요. <br>
			    		
			    			<input class="form-control" placeholder="Password" name="password" id="pw" type="password">
			    		</div>
			    		<div class="checkbox">
			  			<input type="hidden" name="userid" value="${memberinfo.id}">
						<input type="hidden" name="pw" value="${memberinfo.pw}">
			    	    </div>
			    		<input class="btn btn-lg btn-danger btn-block" type="submit" value="탈퇴">
			    		<input class="btn btn-lg btn-primary btn-block" type="reset" value="취소" onclick="location.href='member.do?command=member_delete_form';">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>	
	</div>
</div>
	<div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
  </html>

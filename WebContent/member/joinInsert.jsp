<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
	body{
	padding-top:150px;
	}
	.form-control.div{
	display: inline-block;
	}

</style>
<jsp:include page="../nav.jsp"></jsp:include>
<html>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">회원가입</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="../member.do?command=member_join" method="post">
			    	 
                    <fieldset class="Edit-text">
			    	  	<div class="form-group">
			    		   아이디(*)  <input class="form-control" placeholder="ID" name="userId" type="text">
			    		</div>
			    		<div class="form-group">
			    			패스워드(*)  <input class="form-control" placeholder="PassWord" name="password" type="password" value="">
			    		</div>
			    		<div class="form-group">
			    			패스워드 확인(*)  <input class="form-control" placeholder="PassWord" name="password" type="password" value="">
			    		</div>
			    		<div class="form-group">
			    		     닉네임  <input class="form-control" placeholder="nickName" name="nickname" type="text">
			    		</div>
			    		
			    		<div class="form-group">
			    		   전화번호(*)   <input class="form-control" placeholder="phone" name="phone" type="text">
			    		</div>
			    		<div class="form-group">
			    		    이메일  <input class="form-control" placeholder="email" name="email" type="text">
			    		</div>
			    		<div class="checkbox">
			    		<label class="join-checked">
                <input id="agree" type="checkbox" autocomplete="off" chacked>
               <a href="#">이용약관</a> 에 동의 합니다.
			    	    </div>
			    	  <!--   <input type="hidden" name="command" value="member_join" /> -->
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="join us">
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
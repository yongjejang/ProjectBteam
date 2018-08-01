<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<style>
	body{
	padding-top:150px;
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
			    	<h3 class="panel-title">로그인</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="../member.do?command=member_login"method="POST" name="loginform">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="ID" name="id" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password" name="pw" type="password" value="">
			    		</div>
			    		<div class="checkbox">
			    	    	<label>
			    	    		<a href="../member/joinInsert.jsp">회원가입</a>
			    	    	</label>
			    	    </div>
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
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
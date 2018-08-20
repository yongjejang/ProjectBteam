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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

function LoginCheck(){
	
	var id = document.Loginform.id; //아이디
	var pw = document.Loginform.pw; //비밀번호
	
	console.log(id);
	console.log(pw);
	
	if(id.value == ""){
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}
	//아이디 입력 문자수를 4~12자로 제한하는 조건문
	if(id.value.length < 4 || id.value.length > 12){
		
		alert("아이디는 4~12자까지 입력해야 합니다.");
		id.focus();
		

		return false;
	} 
	if(pw.value == ""){
		alert("비밀번호를 입력해 주세요.");
		pw.focus();
		return false;
	}
	
}
//취소 버튼 클릭시 첫화면으로 이동
function goFirstForm() {
	location.href="../index.jsp";
}

</script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">로그인</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="../member.do?command=member_login" method="POST" name="Loginform"  onSubmit = "return LoginCheck();">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="ID" name="id" id="id" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password" name="pw" id="pw" type="password">
			    		</div>
			    		<!-- <div class="checkbox">
			    	    	<label>
			    	    		<a href="../member/joinInsert.jsp">회원가입</a>
			    	    	</label>
			    	    </div> -->
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
			    		<input class="btn btn-lg btn-success btn-block" type="button" value="회원가입" onClick="window.location='joinInsert.jsp'">
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
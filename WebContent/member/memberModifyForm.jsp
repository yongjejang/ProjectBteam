<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fishing.dao.*, com.fishing.dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>


<jsp:include page="../nav.jsp"></jsp:include>
<html>
<head>
<style>
	body{
	padding-top:150px;
	}
	.form-control.div{
	display: inline-block;
	}

</style>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function checkValue(){
	
	/* var userId = document.frm.userId.value; //아이디 */
	var password = document.frm.password.value; // 비밀번호
	var passwordcheck = document.frm.passwordcheck.value; // 비밀번호 확인
	/* var nickname = document.frm.nickname.value; // 닉네임 */
	var phone = document.frm.phone.value; // 폰
	var email = document.frm.email.value; // 이메일 
	
	
	
	/* 
	if(userId == ""){
		alert("아이디를 입력하지 않았습니다.");
		frm.userId.focus();
		
		return false;
	}
	if (userId.indexOf(" ") >= 0) {
        alert("아이디에 공백을 사용할 수 없습니다.")
       
        return false;
    }
	 //아이디 길이 체크 (4~12자)
    if (userId.length <4 || userId.length > 12) {
        alert("아이디를 4~12자까지 입력해주세요.")
       
        return false;
    } */
	 if(password == "" || password.length == 0){
		alert("비밀번호를 입력하지 않았습니다.");
	
		return false;
	}
	 if(passwordcheck == "" || passwordcheck.length == 0){
		alert("비밀번호를 확인해주시기 바랍니다.");
			
			return false;
	}
	 if(password !== passwordcheck){
		alert("비밀번호가 일치하지 않습니다.");
		    
		return false;
	}
	 /* if(nickname == ""){
		alert("닉네임을 입력하세요");
			
		return false;
	 }  */
	 var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/; // 전화번호 (정규식)표준식
	 if(phone == ""){
		
		 alert("전화번호를 입력하세요");
		 return false;
	 }else if(!regExp.test(phone)){
		 alert("전화번호 형식에 맞지 않습니다.");
		 return false;
	 }
	 var regEmail =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // 이메일 정규식
	 if(email == ""){
			
		 alert("이메일을 입력해주세요");
		 return false;
		 
	}else if(!regEmail.test(email)){
		
		alert("이메일 형식에 맞지 않습니다. 다시 입력해주세요");		
		return false;
		
	}     
	/* if(idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	} */
	
	
	}
	//취소 버튼 클릭시 첫화면으로 이동
	function goFirstForm() {
		location.href="../index.jsp";
	}
	// 아이디 중복체크 화면open
	
	





</script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>

<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">회원정보수정</h3>
			 	</div>
			  	<div class="panel-body">
			  		<!-- 회원정보를 가져와 member 변수에 담는다. -->
					<c:set var="member" value="${requestScope.memberInfo}"/>
					
			    	<form accept-charset="UTF-8" role="form" action="member.do?command=member_modify" method="post" name="frm" onSubmit = "return checkValue();">
			    	 
                    <fieldset class="Edit-text">
			    	  	<div class="form-group">
			    		   아이디 : ${member.id}
			    		 
			    		</div>
			    		<div class="form-group">
			    			새 패스워드(*)  <input class="form-control" placeholder="PassWord" name="password" id="password" type="text">
			    		</div>
			    		<div class="form-group">
			    			새 패스워드 확인(*)  <input class="form-control" placeholder="PassWord" name="passwordcheck" id="passwordcheck"  type="text" >
			    		</div>
			    		<%-- <div class="form-group">
			    		     닉네임  <input class="form-control" placeholder="nickName" name="nickname" id="nickname" type="text" value="${member.nickName }">
			    		</div> --%>
			    		<div class="form-group">
			    		     닉네임 : ${member.nickName }
			    		</div>
			    		
			    		<div class="form-group">
			    		   전화번호(*)   <input class="form-control" placeholder="phone" name="phone" id="phone" type="text">
			    		</div>
			    		<div class="form-group">
			    		    이메일  <input class="form-control" placeholder="email" name="email" id="email" type="text">
			    		</div>
			    		<!-- <div class="checkbox">
			    		
                <input id="agree" type="checkbox" autocomplete="off" chacked>
                <a href="#">이용약관</a> 에 동의 합니다.
               
			    	    </div> -->
			    	  <!--   <input type="hidden" name="command" value="member_join" /> -->
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="modify" >
			    		<input class="btn btn-lg btn-success btn-block" type="reset" value="cancel" onclick=" goFirstForm();" >
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
</body>
</html>
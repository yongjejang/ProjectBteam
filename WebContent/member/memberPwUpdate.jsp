<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>




function pwChange() {
	var success = true;
	var pwCheck1= document.frm.pw1.value;
	var pwCheck2= document.frm.pw2.value;
	   if(pwCheck1.equals(pwCheck2) && pwCheck1.length<4 && pwCheck1.length>13){
		   success = true;
	   }else{
		   success = false;
		   alert("비밀번호가 일치하지 않습니다");
	   }

	
	   
	   
	   
	

</script>
<body>
<form action="../member.do?command=member_password_update" method="post" onsubmit="return pwChange(this)" name="frm"><br>
<input type="password" name="pw" placeholder="현재 비밀번호를 입력해주세요"><br>
<input type="password" name="pw1" id="pwUpdate1" placeholder="바꿀 비밀 번호를 입력해주세요"><br>
<input type="password" id="pwUpdate2" placeholder="바꿀 비밀번호를 다시 한 번 입력해주세요."><br>
<span id="pwCheck"></span>
<input type="submit" value="변경">
<input type="reset" value="취소"> 
 </form>
</body>
</html>
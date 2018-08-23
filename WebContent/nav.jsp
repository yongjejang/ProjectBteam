<%@page import="com.fishing.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
<style>
        body {
  position : absolute;
  top : 0;
  background-color: #ECECEC;
  color: #444444;
  padding: 0;
  margin: 0;
  perspective: 1px;
  transform-style: preserve-3d;
  height: 100%;
  overflow-x: hidden;
  font-family: 'Roboto';
}
.left-underline {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  -moz-osx-font-smoothing: grayscale;
  position: relative;
  overflow: hidden;
}
.left-underline:before {
  content: "";
  position: absolute;
  z-index: -1;
  left: 0;
  right: 100%;
  bottom: 0;
  background: #ECECEC;
  height: 4px;
  -webkit-transition-property: right;
  transition-property: right;
  -webkit-transition-duration: 0.15s;
  transition-duration: 0.15s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.left-underline:hover:before, .left-underline:focus:before, .left-underline:active:before {
  right: 0;
}
div.navbar {
  position:absolute ;
  top: 0;
  left: 0;
  width: 100%;
  background: #ee6e73;
  -webkit-box-shadow: 0px 2px 6px 0px rgba(50, 50, 50, 0.75);
  -moz-box-shadow:    0px 2px 6px 0px rgba(50, 50, 50, 0.75);
  box-shadow:         0px 2px 6px 0px rgba(50, 50, 50, 0.75);
  z-index: 9999999;
}
div.navbar > ul.navbar-container {
  list-style-type: none;
  margin: 0;
  padding-left: 1em;
  padding-right: 1em;
  overflow: hidden;
}
div.navbar > ul > li.nav-item {
  float: left;
  background-color: rgba(0, 0, 0, 0.1);
  transition: all 0.5s ease;
}
div.navbar > ul > li.nav-item1 {
  float: right;
  background-color: rgba(0, 0, 0, 0.1);
  transition: all 0.5s ease;
}

div.navbar > ul > li.nav-item2 {
  float: right;
  background-color: rgba(0, 0, 0, 0.1);
  transition: all 0.5s ease;
}


div.navbar > ul > li.active {
  background-color: rgba(0, 0, 0, 0.18);
}
div.navbar > ul > li:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
a.nav-button {
  font-family: 'Roboto';
  text-decoration: none;
  line-height: 60px;
  padding-left: 20px;
  padding-right: 20px;
  color: rgba(228, 241, 254, 1);
  transition: all 0.5s ease;
}
a.nav-button:hover {
  text-decoration: none;
}
li.active > a.nav-button {
  cursor: default;
}
.brand-logo {
  float: left;
  cursor: default;
}

.logo{
	width:100px;
	height:60px;
}
}
</style>
<html>
<head>
<meta charset="UTF-8">
    <title>Parallax Template - uplusion23</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-smooth-scroll/1.5.5/jquery.smooth-scroll.min.js"></script>
  </head>
  <body>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
    <div class="navbar">
      <ul class="navbar-container">
        <li><a href="#" class="left-underline nav-button brand-logo"><img src="logo.jpg" class="logo" /></a></li>
        <li class="nav-item"><a href="index.jsp" class="left-underline nav-button" data-scroll >홈</a></li>
        <li class="nav-item"><a href="community.do?command=community_list&page=1&category=1" class="left-underline nav-button" data-scroll>바다게시판</a></li>
        <li class="nav-item"><a href="community.do?command=community_list&page=1&category=0" class="left-underline nav-button" data-scroll>민물게시판</a></li>
        <li class="nav-item active"><a href="fishingParse.jsp" class="left-underline nav-button" data-scroll>낚시터 정보</a></li>
        <li class="nav-item"><a href="community.do?command=community_list&page=1&category=2" class="left-underline nav-button" data-scroll>Q&A</a></li>
        <!-- <li class="nav-item1"><a href="member/loginForm.jsp" class="left-underline nav-button" data-scroll>로그인</a></li> -->
        
         <%  
	     
	    
	    if(session.getAttribute("memberinfo")!=null){
        
	    %>

	    <li class="nav-item2"><a href="member/logoutPro.jsp" class="left-underline nav-button" data-scroll>로그아웃</a></li>
        <li class="nav-item1"><a href="#" class="left-underline nav-button" data-scroll>${memberinfo.nickName }님 로그인 중 </a></li>
     	   
        <%
        
        	//System.out.println(session.getAttribute("login").toString());
        	MemberVO mvo = (MemberVO) session.getAttribute("memberinfo");
        		
        	//mvo.getId();
        	//System.out.println(mvo.getId().toString());
        	if(mvo.getId().toString().equals("admin")){
           %>
           		<li class="nav-item2"><a href="member.do?command=member_list" class="left-underline nav-button" data-scroll>회원보기</a> </li>
           
          
        	<%
        	}else
        	{
        	%>	
        	<li class="nav-item1"><a href="member.do?command=member_userinfo" class="left-underline nav-button" data-scroll>내정보</a></li>
        	<%
        	}
        	%>
        <%
        
        
        } else if(session.getAttribute("memberinfo")== null){
           %>
           <li class="nav-item1"><a href="member.do?command=member_login_form" class="left-underline nav-button" data-scroll>로그인</a> </li>
           
          
        <%
        }
        %>
        
      </ul>
    </div>
</body>
</html>
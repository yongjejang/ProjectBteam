<%@page import="util.DBMangement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Untitled Document</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    
</head>
<style>
.img-rounded{
 magin:auto;
 width : 100%;
 border-radius: 30px;
 
}
        body {
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
.brand-logo {
  float: left;
  cursor: default;
}
.parallax {
  height: 70vh;
  overflow: hidden;
  margin: 0;
  padding: 0;
}



.parallax-text {
  width: 24em;
  position: fixed;
  top: 20%;
  left: 50%;
  border: .5em solid #fff;
  margin-left: -10%;
  padding: 2em 0;
  text-align: center;
  z-index: 999;
}
.parallax > div.blur-image {
  position: relative;
  width: 100%;
  height: 100%;
} 
hgroup{
  display: inline-block;
  text-align: center;
  position: relative;
  top: 50%;
  left: 50%;
  transform: translateX(-50%) translateY(-50%);
  color: #fff;
  border: 5px solid #fff;
  padding: .5em 3em;
  
  background-color: rgba(0,0,0,.2);
  z-index: 2;
}
.row {
  width: 100%;
  padding-left: 5%;
  padding-right: 5%;
  padding-top: 15px;
  padding-bottom: 15px;
  min-height: 150px;
  text-align: center;
  position: relative;

}
.row:after {
  content: "";
  display: table;
  clear: both;
}
.row > .col-3 {
  display: inline-block;
  width: 33%;
  height: 100%;
  box-sizing: border-box;
  padding-left: 2px;
  padding-right: 2px;
  text-align: center;
  position: relative;
  }

}
.container {
  width: 85%;
  padding: 0 1.5rem;
  margin: 0 auto;
  max-width: 1280px;
}


/* Blank lines for ease and view */
/* */
</style>
    
<script>
 
if(location.href.indexOf("?") == -1) {
	   location.href="community.do?command=index";   
	}
        function EasyPeasyParallax() {
	scrollPos = $(this).scrollTop();
	$('.p1').css({
		'background-position' : '50% ' + (-scrollPos/4)+"px"
	});
  $('.p2').css({
		'background-position' : '50% ' + (-scrollPos/8)+"px"
	});
  $('.p3').css({
		'background-position' : '70% ' + (-scrollPos/16)+"px"
	});	
	$('.parallax-text').css({
		'margin-top': (scrollPos/2)+"px",
		'opacity': 1-(scrollPos/230)
	});	
}
$(document).ready(function(){
	$(window).scroll(function() {
		EasyPeasyParallax();
	
	});
});
</script>
    
    
    
<body>
<html>
  <head>
    <title>Parallax Template - uplusion23</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-smooth-scroll/1.5.5/jquery.smooth-scroll.min.js"></script>
  </head>
  <body>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
    
   <jsp:include page="nav.jsp"></jsp:include>


  
  <style>
* {box-sizing: border-box}
body {
	font-family: Verdana, sans-serif; margin:0
}

.mySlides {
	display: none;
	padding-top : 70px;

}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
  padding-top : 30px;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

.row.col-3.table{
  text-align: center;
  position: relative;
}
.slideshow-container{
	margin-top : 10px;
}


/* 플러스친구 배너 위치 */
.fltBanner1 {
	position: fixed;
	right: 20px; /* 좌측면으로부터 거리(px) */
	top: 260px; /* 상단으로부터 거리(px) */
	display: inline;
	z-index: 999;
}
/* 전화걸기 배너 위치 */
.fltBanner2 {
	position: fixed;
	right: 20px; /* 좌측면으로부터 거리(px) */
	top: 400px; /* 상단으로부터 거리(px) */
	display: inline;
	z-index: 999;
}

</style>
</head>
<body>

<!-- 플러스친구 -->
<a href="http://pf.kakao.com/_xnVlxfxl" class="fltBanner1" target="_blank">
	<img src="https://cdn.imweb.me/upload/S20170530592cf901c1430/5a5d4a959dc39.png" width="128px" height="128px">
</a>

<!-- 전화연락 -->
<a href="tel:02-123-1234" class="fltBanner2" target="_blank">
	<img src="https://cdn.imweb.me/upload/S20170530592cf901c1430/5a5d4a9583340.png" width="128px" height="128px">
</a>

<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="img1.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="500px">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="img4.jpg"class="img-rounded" alt="Cinque Terre" width="100%"height="500px">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="img3.jpg" class="img-rounded" alt="Cinque Terre" width="100%"height="500px">
  <div class="text">Caption Three</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

		<script>
	//	var slideIndex = 1;
	//	showSlides(slideIndex);
		
	//	function plusSlides(n) {
	//	  showSlides(slideIndex += n);
	//	}
		
	//	function currentSlide(n) {
	//	  showSlides(slideIndex = n);
	//	}
		
	//	function showSlides(n) {
	//	  var i;
	//	  var slides = document.getElementsByClassName("mySlides");
	//	  var dots = document.getElementsByClassName("dot");
	//	  if (n > slides.length) {slideIndex = 1}    
	//	  if (n < 1) {slideIndex = slides.length}
	//	  for (i = 0; i < slides.length; i++) {
	//	      slides[i].style.display = "none";  
	//	  }
	//	  for (i = 0; i < dots.length; i++) {
	//	      dots[i].className = dots[i].className.replace(" active", "");
	//	  }
	//	  slides[slideIndex-1].style.display = "block";  
	//	  dots[slideIndex-1].className += " active";
	//	}
	
	
	
	
	var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}
		</script>


    
    <div class="row">
      <div class="col-3">
        <h2>바다 낚시 게시판 조회수 top5</h2>
        <table border="0" width="100%" height="100%" align="center" class="table"> 
        <tr>
         <th>제목</th>   

      	</tr>
      
      <c:forEach var="bestsea" items="${communityList }">
			
			<tr>

				<td><a href='community.do?command=community_view&communityNum=${bestsea.communityNum}'>${bestsea.title }</a></td>

			</tr>
		</c:forEach>
   </table>
      </div>
      
      <div class="col-3">
        <h2>민물 낚시 게시판 조회수 top5</h2>
                <table border="0" width="100%" height="100%" align="center" class="table"> 
        <tr>
         <th>제목</th>   

      	</tr>
      
      <c:forEach var="bestsea" items="${communityList }">
			
			<tr>

				<td><a href='community.do?command=community_view&communityNum=${bestsea.communityNum}'>${bestsea.title }</a></td>

			</tr>
		</c:forEach>
   </table>
      </div>
      <div class="col-3">
        <h2>Q&A</h2>
                <table border="0" width="100%" height="100%" align="center" class="table"> 
        <tr>
         <th>제목</th>   

      	</tr>
      
      <c:forEach var="bestsea" items="${communityList }">
			
			<tr>

				<td><a href='community.do?command=community_view&communityNum=${bestsea.communityNum}'>${bestsea.title }</a></td>

			</tr>
		</c:forEach>
   </table>
      </div>
    </div>
   	<div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>

  </body>
</html>

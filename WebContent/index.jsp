<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Untitled Document</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
</head>
<style>
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
.parallax.p1 {
  background: url(http://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-70374.jpg) no-repeat fixed 50% 0;
  background-size: cover;
  color: #fff;
}
.parallax.p2 {
  background: url(http://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-126549.jpg) no-repeat fixed 50% 0;
  background-size: cover;
  color: #fff;
}
.parallax.p3 {
  background: url(http://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-95766.jpg) no-repeat fixed 70% 0;
  background-size: cover;
  color: #fff;
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
  width: 80%;
  padding-left: 10%;
  padding-right: 10%;
  padding-top: 15px;
  padding-bottom: 15px;
  min-height: 150px;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
.row > .col-3 {
  width: 30%;
  height: 100%;
  box-sizing: border-box;
  float: left;
  padding-left: 5px;
  padding-right: 5px;
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
   
    <div class="parallax p1" id="section-1">
      <hgroup>
        <h1>Hello.</h1>
        <h2>I’m a startup.</h2>
      </hgroup>
    </div>
    <div class="row">
      <div class="col-3">
        <h1>바다 낚시 게시판</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam cursus maximus quam et dignissim. Praesent felis arcu, euismod et ullamcorper ut, condimentum ut ante. Vestibulum vel libero commodo, aliquam libero eu, gravida arcu. Proin scelerisque faucibus ligula quis efficitur. Donec at sollicitudin purus, suscipit tempus augue. Sed imperdiet volutpat sapien at hendrerit. Mauris egestas ex a quam tincidunt gravida. Quisque interdum tempor lacinia. Nulla eget varius purus. Integer non sollicitudin dui. Phasellus sem turpis, maximus in auctor vulputate, porta id nunc.</p>
      </div>
      
      <div class="col-3">
        <h1>민물 낚시 게시판</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque imperdiet est id leo facilisis, quis egestas erat vehicula. Aenean nec facilisis leo, et tristique lorem. Aliquam porttitor, elit ac ornare lacinia, sapien augue sagittis dolor, tempor ultricies lorem arcu et ante. Nulla facilisi. Praesent facilisis lacus at blandit maximus. Ut at libero nisi. Cras eu augue tellus. Nam pretium eget nisi non viverra. Maecenas eget tincidunt nibh, vitae interdum dolor.</p>
      </div>
      <div class="col-3">
        <h1>고객센터 게시판</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac nibh dolor. Cras rutrum molestie ligula posuere hendrerit. Donec luctus vitae elit in gravida. Duis in viverra nunc. Nunc et metus blandit, blandit quam in, laoreet mi. In vitae mauris sit amet tellus dictum rhoncus malesuada non arcu. Ut lacus lacus, dignissim at commodo id, dapibus sed felis. Cras in nunc id est lobortis euismod. Sed egestas nulla et augue sagittis lacinia. Quisque finibus bibendum risus, vitae accumsan ante mollis ac. Aliquam fermentum, mauris eu gravida dictum, tortor risus finibus nibh, in tincidunt velit tortor vehicula mi.</p>
      </div>
    </div>
   	<div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>

  </body>
</html>

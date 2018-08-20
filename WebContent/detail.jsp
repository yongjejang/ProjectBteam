<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=147083ba214eba25dfc2dc373246233c"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	/* body{
			width:100%;
			height: 100%;
			background-image: url("img5.jpg");
			background-repeat: no-repeat;
			background-size: 100%;
	}
	h2{
            background-color: azure;
             padding : 10px;
            
        }
	h3{
            background-color: azure;
             padding : 10px;
          
        }  */
	h2{
		text-align: center;
	}
	#fishInfo{
		
		margin-top: 100px;
	
	}

</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
   <script>

      $(document).ready(
            function() {
               var url = location.href;
               console.log(url.split('?')[1]);
               var tmp = url.split('?')[1]; //물음표를 기준 num1을 찾겠다
               //    console.log(tmp);
               var paraArr = tmp.split('&'); //& 기준으로 또 잘라야한다.
               console.log(paraArr);
               for ( var i in paraArr) {
                  //console.log(papaArr[i].indexOf(pameterName));
                  if (paraArr[i].indexOf('lat') >= 0) {
                     var webLat = paraArr[0].split('=')[1]; //위도
                     var webLon = paraArr[1].split('=')[1]; //경도
                     console.log("함수내" + webLat + "," + webLon);
                     console.log("string" + typeof (webLat));

                  }
               }
                
                
               console.log("웹위도 : " + webLat + "웹경도 : " + webLon);

               var fishing = new Array();
               $.ajax({
                  type : 'GET',
                  url : 'fishing2.json',
                  dataType : 'json',
                  success : function(data) {
                     var array = new Array();

                     for (var i = 0; i < data.records.length; i++) {
                        var parseLat = data.records[i].위도;
                        var parseLon = data.records[i].경도;
                        
                        if (webLat == parseLat && webLon == parseLon) {
                           var fishingName = data.records[i].낚시터명;
                           var fishingType = data.records[i].낚시터유형;
                           var road = data.records[i].소재지도로명주소;
                           var addr = data.records[i].소재지지번주소;
                           var fishingNum = data.records[i].낚시터전화번호;
                           var ManagementagencyNum = data.records[i].관리기관전화번호;
                           var waterArea = data.records[i].수면적;
                           var fishes = data.records[i].주요어종;
                           var facility = data.records[i].수상시설물유형;
                           var convenience = data.records[i].편익시설현황;
                           var fee = data.records[i].이용요금;        
                           
                           console.log("parseLat : "+parseLat+"    webLat : "+webLat);
                           console.log("road : "+road+ " addr : "+ addr);
   						
                           if(!fishingNum){
                        	   fishingNum = ManagementagencyNum
                        	   
                           }
                           if(!road){
                        	   road = addr
                        	   
                           }
                           if(!fishes || !convenience || !facility ){
                        	   fishes = "감성돔 등 다양한 어종";
                        	   convenience = "화장실 2개소(저두쪽, 망호쪽),슈퍼2개소";
                        	   facility = "짚라인";
                           }
                           
                          /*  var box = "<h2>낚시터 : " + fishingName + "</h2><hr><h2>주소 : " + road + "</h2><h3>이용요금 : "+fee+"</h3><hr><h2>주요어종 : "+fishes+"</h2><h2>편의시설 : "+convenience+"</h2><h2>수상시설물 : "+facility+"</h2><h2>전화번호 : "+fishingNum+"</h2>";
                           $('#fishInfo').append(box); */
                        	var box = "";
                           box += "<div class='container'>";
                           box += "<table class='table table-striped table-bordered table-hover' width='10%'>";
                           box += "<thead>";
                           box += "<th>낚시터</th>";
                           box += "<tr class='active'><td>"+ fishingName + "</td> </tr>";
                           box += "<th>주소</th>";
                           box += "<tr class='info'><td>"+ road + "</td> </tr>";
                           box += "<th >이용요금</th>";
                           box += "<tr class='warning'><td>"+ fee + "</td> </tr>";
                           box += "<th>주요어종</th>";
                           box += "<tr class='info'><td>"+ fishes + "</td> </tr>";
                           box += "<th>편의시설</th>";
                           box += "<tr class='danger'><td>"+ convenience + "</td> </tr>";
                           box += "<th>수상시설물</th>";
                           box += "<tr class='success'><td>"+ facility + "</td> </tr>";
                           box += "<th>전화번호</th>";
                           box += "<tr class='info'><td>"+ fishingNum + "</td> </tr>";
                           box += "</thead>";
                           box += "</table></div>";
                           
                           $('#fishInfo').append(box);
                        }
                     }
                  }
               })

               console.log("전역변수 위도 : " + webLat + "    전역변수경도 : " + webLon);

               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
               mapOption = {
                  center : new daum.maps.LatLng(webLat, webLon), // 지도의 중심좌표
                  level : 3
               // 지도의 확대 레벨
               };

               // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
               var map = new daum.maps.Map(mapContainer, mapOption);
               var markerPosition  = new daum.maps.LatLng(webLat, webLon); 
               // 마커가 표시될 위치입니다 
               var markerPosition  = new daum.maps.LatLng(webLat, webLon); 

               // 마커를 생성합니다
               var marker = new daum.maps.Marker({
                   position: markerPosition
               });

               // 마커가 지도 위에 표시되도록 설정합니다
               marker.setMap(map);
               


            });
   </script>

   
  <div id="fishInfo">
  <h2>낚시터 정보</h2>
  <div id="map" style="width: 100%; height: 350px;"></div>
  </div>
  
   
   

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
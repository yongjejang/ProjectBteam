<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=147083ba214eba25dfc2dc373246233c"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<div>
<jsp:include page="nav.jsp"></jsp:include>
</div>

<body>

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
                           var addr = data.records[i].소재지번주소;
                           var fishingNum = data.records[i].낚시터전화번호;
                           var waterArea = data.records[i].수면적;
                           var fishes = data.records[i].주요어종;
                           var facility = data.records[i].수상시설물유형;
                           var convenience = data.records[i].편익시설현황;
                           var fee = data.records[i].이용요금;        
                           
                           console.log("parseLat : "+parseLat+"    webLat : "+webLat)
   						
                           var box = "<h2>낚시터 : " + fishingName + "</h2><hr><h2>주소 : " + road + "</h2><h3>이용요금 : "+fee+"</h3><hr><h2>주요어종 : "+fishes+"</h2><h2>편의시설 : "+convenience+"</h2><h2>수상시설물 : "+facility+"</h2><h2>전화번호 : "+fishingNum+"</h2>";
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

   <div id="map" style="width: 100%; height: 350px;"></div>
   <div id="fishInfo"></div>
   
   <div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
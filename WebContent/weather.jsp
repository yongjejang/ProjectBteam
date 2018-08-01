<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>지도 시작하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b58a34a53fb9d462d1363006082507f"></script>
    <script>
    	function a(array){
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(array[0], array[1]),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
        }
        $(document).ready(function () { // 온도
            $.ajax({
                type: 'GET', // 통신방식(get/post) 
                url: 'http://www.khoa.go.kr/oceangrid/grid/api/tideObsAirTemp/search.do?&ServiceKey=opFOJf4/Ing8bukYHXXrrVW0ju1TL0D/5OM5/pmwXx9SElX0Di8UnkUIWXlA6QmFdfoI44Z2wLRdbPgc5NGXw==&ObsCode=DT_0005&Date=20180703&ResultType=json', // 통신할 대상 페이지
                dataType: 'json', //서버로부터 받을 데이터 형식
                success: function (data) { // 통신에 성공했을때
                    console.log(data);
                   
//                  document.getElementById('name').innerHTML=data.name;
                    
                    //$('#temperature').text(data.result.data[0].air_temp);
                    
                    var array = new Array();
                    var lat = data.result.meta.obs_lat;
                    var lon = data.result.meta.obs_lon;
                    array.push(lat);
                    array.push(lon);
                    console.log(array[0]);
                    console.log(array[1]);
                    a(array);
                    
                }
                , error: function (req) { // 통신에 실패했을때
                    alert('통신실패, 상태 : ' + req.responseText);
                }
            });
        });
    </script>
    <script>
        $(document).ready(function () { //기압
            $.ajax({
                type: 'GET', // 통신방식(get/post) 
                url: 'http://www.khoa.go.kr/oceangrid/grid/api/tideObsAirPres/search.do?&ServiceKey=opFOJf4/Ing8bukYHXXrrVW0ju1TL0D/5OM5/pmwXx9SElX0Di8UnkUIWXlA6QmFdfoI44Z2wLRdbPgc5NGXw==&ObsCode=DT_0005&Date=20180703&ResultType=json', // 통신할 대상 페이지
                dataType: 'json', //서버로부터 받을 데이터 형식
                success: function (data) { // 통신에 성공했을때
                    console.log(data);
                   
//                  document.getElementById('name').innerHTML=data.name;
                    
                    $('#atm').text(data.result.data[0].air_pres);
                    
                    
                }
                , error: function (req) { // 통신에 실패했을때
                    alert('통신실패, 상태 : ' + req.responseText);
                }
            });
        });
    </script>
      <script>
        $(document).ready(function () { //수온
            $.ajax({
                type: 'GET', // 통신방식(get/post) 
                url: 'http://www.khoa.go.kr/oceangrid/grid/api/tideObsTemp/search.do?&ServiceKey=opFOJf4/Ing8bukYHXXrrVW0ju1TL0D/5OM5/pmwXx9SElX0Di8UnkUIWXlA6QmFdfoI44Z2wLRdbPgc5NGXw==&ObsCode=DT_0005&Date=20180703&ResultType=json', // 통신할 대상 페이지
                dataType: 'json', //서버로부터 받을 데이터 형식
                success: function (data) { // 통신에 성공했을때
                    console.log(data);
                   
//                  document.getElementById('name').innerHTML=data.name;
                    
                    $('#water_temp').text(data.result.data[0].water_temp);
                    
                    
                }
                , error: function (req) { // 통신에 실패했을때
                    alert('통신실패, 상태 : ' + req.responseText);
                }
            });
        });
    </script>
      <script>
        $(document).ready(function () { //풍속 및 풍향
            $.ajax({
                type: 'GET', // 통신방식(get/post) 
                url: 'http://www.khoa.go.kr/oceangrid/grid/api/tideObsWind/search.do?&ServiceKey=opFOJf4/Ing8bukYHXXrrVW0ju1TL0D/5OM5/pmwXx9SElX0Di8UnkUIWXlA6QmFdfoI44Z2wLRdbPgc5NGXw==&ObsCode=DT_0005&Date=20180703&ResultType=json', // 통신할 대상 페이지
                dataType: 'json', //서버로부터 받을 데이터 형식
                success: function (data) { // 통신에 성공했을때
                    console.log(data);
            
                    
                    $('#Wind_speed').text(data.result.data[0].wind_speed);
                    $('#wind_dir').text(data.result.data[0].wind_dir);
                    
                    
                }
                , error: function (req) { // 통신에 실패했을때
                    alert('통신실패, 상태 : ' + req.responseText);
                }
            });
        });
    </script>
   
    
</head>
<body>
	
    온도 : <span id="temperature"></span><br />
    기압 : <span id="atm"></span><br />
    수온 : <span id="water_temp"></span><br />
    풍속 : <span id="Wind_speed"></span><br />
    풍향 : <span id="wind_dir"></span><br />
   <div id="map" style="width:100%;height:350px;"></div>



</body>
</html>

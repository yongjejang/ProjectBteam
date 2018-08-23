<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>지도 시작하기</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93456e7efb933748f75cb87bc90efd86"></script>
    <script>
    	function a(array){
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(array[0], array[1]),
			level: 3
		};
		
		var map = new daum.maps.Map(container, options);
        }
    
        function temp(weather,today) { // 온도
            $.ajax({
                type: 'GET', // 통신방식(get/post) 
                url: 'http://www.khoa.go.kr/oceangrid/grid/api/tideObsAirTemp/search.do?&ServiceKey=opFOJf4/Ing8bukYHXXrrVW0ju1TL0D/5OM5/pmwXx9SElX0Di8UnkUIWXlA6QmFdfoI44Z2wLRdbPgc5NGXw==&ObsCode='+ weather +'&Date='+today+'&ResultType=json', // 통신할 대상 페이지
                dataType: 'json', //서버로부터 받을 데이터 형식
                success: function (data) { // 통신에 성공했을때
                    console.log(data);
                   
//                  document.getElementById('name').innerHTML=data.name;
                    var i = data.result.data.length
                    console.log("이거의 배열의 길이는" + i);
                    $('#temperature').text(data.result.data[i-1].air_temp + "℃");
                    
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
        };
    
       function airpres(weather,today) { //기압
            $.ajax({
                type: 'GET', // 통신방식(get/post) 
                url: 'http://www.khoa.go.kr/oceangrid/grid/api/tideObsAirPres/search.do?&ServiceKey=opFOJf4/Ing8bukYHXXrrVW0ju1TL0D/5OM5/pmwXx9SElX0Di8UnkUIWXlA6QmFdfoI44Z2wLRdbPgc5NGXw==&ObsCode='+ weather +'&Date='+today+'&ResultType=json', // 통신할 대상 페이지
                dataType: 'json', //서버로부터 받을 데이터 형식
                success: function (data) { // 통신에 성공했을때
                    console.log(data);
                    var i = data.result.data.length;
//                  document.getElementById('name').innerHTML=data.name;
                    
                    $('#atm').text(data.result.data[i-1].air_pres +"hPa" );
                    
                    
                }
                , error: function (req) { // 통신에 실패했을때
                    alert('통신실패, 상태 : ' + req.responseText);
                }
            });
        };
    
        function watertemp(weather,today) { //수온
            $.ajax({
                type: 'GET', // 통신방식(get/post) 
                url: 'http://www.khoa.go.kr/oceangrid/grid/api/tideObsTemp/search.do?&ServiceKey=opFOJf4/Ing8bukYHXXrrVW0ju1TL0D/5OM5/pmwXx9SElX0Di8UnkUIWXlA6QmFdfoI44Z2wLRdbPgc5NGXw==&ObsCode='+ weather +'&Date='+today+'&ResultType=json', // 통신할 대상 페이지
                dataType: 'json', //서버로부터 받을 데이터 형식
                success: function (data) { // 통신에 성공했을때
                    console.log(data);
                   
//                  document.getElementById('name').innerHTML=data.name;
                    var i = data.result.data.length;
                    $('#water_temp').text(data.result.data[i-1].water_temp + "℃");
                    
                    
                }
                , error: function (req) { // 통신에 실패했을때
                    alert('통신실패, 상태 : ' + req.responseText);
                }
            });
        };
   		
        function speed(weather,today) { //풍속 및 풍향
        	
            $.ajax({
                type: 'GET', // 통신방식(get/post) 
                url: 'http://www.khoa.go.kr/oceangrid/grid/api/tideObsWind/search.do?&ServiceKey=opFOJf4/Ing8bukYHXXrrVW0ju1TL0D/5OM5/pmwXx9SElX0Di8UnkUIWXlA6QmFdfoI44Z2wLRdbPgc5NGXw==&ObsCode='+weather+'&Date='+today+'&ResultType=json', // 통신할 대상 페이지
                dataType: 'json', //서버로부터 받을 데이터 형식
                success: function (data) { // 통신에 성공했을때
                    console.log(data);
            
                    var i = data.result.data.length;
                    
                    $('#Wind_speed').text(data.result.data[i-1].wind_speed +"m/s");
                    $('#wind_dir').text(data.result.data[i-1].wind_dir);
                    $('#name').text(data.result.meta.obs_post_name);
                    
                }
                , error: function (req) { // 통신에 실패했을때
                    alert('통신실패, 상태 : ' + req.responseText);
                }
            });
        };
        
        function selectweather() {
    		var weather = $(".form-control").val();
    		var date = new Date();
    	    var year = date.getFullYear();
    	    var month = date.getMonth()+1
    	    var day = date.getDate();
    	    if(month < 10){
    	        month = "0"+month;
    	    }
    	    if(day < 10){
    	        day = "0"+day;
    	    }
    	 
    	    var today = year+""+month+""+day;
			
    		speed(weather,today);
    		watertemp(weather,today);
    		airpres(weather,today);
    		temp(weather,today);
    	}

    </script>
</head>
<body>
<h2 style="margin-left: 29.5%">현재 날씨</h2>
<div id="all">
<select class="form-control" id="weather" onchange="selectweather()"  data-toggle="dropdown" style="width: 200px; margin-left: 29.5%"><br>
   
   <span class="caret"></span>
      <option value="지역선택">지역선택</option>
      <!-- <option value="제주특별자치도">제주도</option> -->
      <option value="DT_0001">인천</option>
      <option value="DT_0002">평택</option>
      <option value="DT_0003">영광</option>
      <option value="DT_0004">제주</option>
      <option value="DT_0005">부산</option>
      <option value="DT_0006">묵호</option>
      <option value="DT_0007">목포</option>
      <option value="DT_0008">안산</option>
      <option value="DT_0009">포항</option>
      <option value="DT_0010">서귀포</option>
      <option value="DT_0011">후포</option>
      <option value="DT_0012">속초</option>
      <option value="DT_0013">울릉도</option>
      <option value="DT_0014">통영</option>
      <option value="DT_0015">마산</option>
      <option value="DT_0016">여수</option>
      <option value="DT_0017">대산</option>
      <option value="DT_0018">군산</option>
      <option value="DT_0019">가덕도</option>
      <option value="DT_0020">울산</option>
      <option value="DT_0021">추자도</option>
      <option value="DT_0022">성산포</option>
      <option value="DT_0023">모슬포</option>
      <option value="DT_0024">장항</option>
      <option value="DT_0026">고흥발포</option>
      <option value="DT_0027">완도</option>
      <option value="DT_0028">진도</option>
      <option value="DT_0029">거제도</option>
      <option value="DT_0030">위도</option>
      <option value="DT_0031">거문도</option>
      <option value="DT_0034">안흥</option>
      <option value="DT_0035">흑산도</option>
      <option value="DT_0037">어청도</option>
      <option value="DT_0039">왕돌초</option>
      <option value="DT_0041">복사초</option>
      <option value="DT_0042">교본초</option>
      <option value="DT_0043">영흥도</option>
      <option value="DT_0050">태안</option>
      <option value="DT_0051">서천마량</option>
      <option value="DT_0052">인천송도</option>
      <option value="DT_0056">부산항신항</option>
      <option value="DT_0057">동해항</option>
      <option value="DT_0058">경인항</option>
      <option value="DT_0061">삼천포</option>
      <option value="IE_0060">이어도</option>
      <option value="IE_0061">신안가거초</option>
      <option value="IE_0062">옹진소청초</option>
   </select>
   <div id="map" style="width:500px;height:350px;"></div>
<div style="margin-left: 29.5%">
<h3>
지역 이름 : <span id="name"></span><br />   
온도 : <span id="temperature"></span><br />
기압 : <span id="atm"></span><br />
수온 : <span id="water_temp"></span><br />
풍속 : <span id="Wind_speed"></span><br />
풍향 : <span id="wind_dir"></span><br />
</h3>
</div>
   <h5 style="margin-left: 29.5%">해당 날씨는 바닷가 기준입니다.</h5>
   <h5 style="margin-left: 29.5%">해당 지도의 위도,경도는 관측소 기준입니다.</h5>
   </div>
 


</body>
</html>

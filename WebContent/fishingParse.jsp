<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
<style type="text/css">
.point{
margin-top: 8%;
text-align: center;
}
#result{
text-align: center;

}
#sido{
position: relative;
left: 90px;
margin-left: 100px;
}

</style>
 <jsp:include page="nav.jsp"></jsp:include>
 
<script>
   /* function search() {
      var inputText = $('#inputTextBox').val().trim();

      console.log("inputText :+"+inputText)
      $.ajax({
         type : 'GET',
         url : 'fishing2.json',
         dataType : 'json',
         success : function(data) {
            for(var i = 0; i = data.record.length; i++){ 
            	
            	
            	
               var fishingName = data.records[i].낚시터명; 
               if(fishingName.indexOf(inputText)=-1){ //낚시터명.indexOf(입력값)이 없으면 
                  console.log("입력 값: "+inputText+"가 없습니다.")
               }else{
                  var fishingName = data.records[i].낚시터명;
                  console.log(fishingName)
                  var lat = data.records[i].위도;
                  var lon = data.records[i].경도;
                  var road = data.records[i].소재지도로명주소;
             
                  var addr = data.records[i].소재지지번주소;
                  var fee = data.records[i].이용요금;
                  
                  
              	  console.log(road);
              	
                  var box = "<a href = 'detail.jsp?lat=" + lat + "&lon="
                        + lon + "'>" + fishingName
                        + "</a><span>&nbsp&nbsp&nbsp 주소: " + road
                        + "</span><span>&nbsp;&nbsp&nbsp&nbsp이용요금: "
                        + fee + "</span><hr>";

                  $('#inputTextBox').append(box);
               }

               
            }


         }

      })
   } */
   function selectCity() {
      $.ajax({
         type : 'GET',
         url : 'fishing2.json',
         dataType : 'json',
         success : function(data) {
            var sido = $("#sido").val();
            var bigyo;
            var array = new Array();
            $('#result').empty("");
            for (var i = 0; i < data.records.length; i++) {
               if (data.records[i].소재지도로명주소) {
                  bigyo = data.records[i].소재지도로명주소.split(" ")[0];
               } else {
                  bigyo = data.records[i].소재지지번주소.split(" ")[0];
               }
               if (bigyo == sido) {

                  var fishingName = data.records[i].낚시터명;
                  console.log(fishingName);
    
                  var lat = data.records[i].위도;
                  var lon = data.records[i].경도;
                  var road = data.records[i].소재지도로명주소;
                  var addr = data.records[i].소재지지번주소;
                  var fee = data.records[i].이용요금;
                  
                  console.log(road);
                  if(!road){
                	  road = addr;
                  }
                  var sido = $("#sido option:selected").val();
				  console.log(sido);
                  
                  

                  
                  var box = "<a href = 'detail.jsp?lat=" + lat + "&lon="
                        + lon + "'>" + fishingName
                        + "</a><span>&nbsp&nbsp&nbsp 주소: " + road
                        + "</span><span>&nbsp;&nbsp&nbsp&nbsp이용요금: "
                        + fee + "</span><hr>";

                        
                        
                        
                  $('#result').append(box);
               }

            }	

         }

      });
   }
</script>
</head>
<body id = "body">
<div class="point">
<h2>원하시는 낚시터 지역을 선택해주세요</h2>
</div>
<div id="all">
<select class="form-control" id="sido" onchange="selectCity()"  data-toggle="dropdown" style="width: 200px"><br>
   
   <span class="caret"></span>
      <option value="지역선택">지역선택</option>
      <!-- <option value="제주특별자치도">제주도</option> -->
      <option value="강원도">강원도</option>
      <option value="경기도">경기도</option>
      <option value="서울특별시">서울특별시</option>
      <option value="인천광역시">인천광역시</option>
      <option value="충청북도">충청북도</option>
      <option value="충청남도">충청남도</option>
      <option value="전라북도">전라북도</option>
      <option value="전라남도">전라남도</option>
      <option value="광주광역시">광주광역시</option>
      <option value="경상북도">경상북도</option>
      <option value="경상남도">경상남도</option>
      <option value="부산광역시">부산광역시</option>
      <option value="울산광역시">울산광역시</option>
   </select>
   
   <br>
   </div>
   <div id="result">
   <img  id ="img" src="fishing-164977_960_720.jpg"  height="75%" width="75%">
   	</div>
   	<div id="map" style="width: 500px; height: 400px; "></div>

<div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
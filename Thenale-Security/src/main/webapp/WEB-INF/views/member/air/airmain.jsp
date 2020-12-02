<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
<body>
		<h2>항공사 메인page</h2>
	
	 <form action="airsearch" method="post" id="airsearch" name="airsearch"><br>
		출발 공항<br>
		<input type="radio" name="depAirportId" id="depAirportId" value="NAARKSI">인천
		<input type="radio" name="depAirportId" id="depAirportId" value="NAARKSS">김포
		<input type="radio" name="depAirportId" id="depAirportId" value="NAARKPC">제주<br>
		<input type="radio" name="depAirportId" id="depAirportId" value="NAARKPU">울산
		<input type="radio" name="depAirportId" id="depAirportId" value="NAARKTN">대구
		<input type="radio" name="depAirportId" id="depAirportId" value="NAARKTU">청주<br><br>
		
		도착 공항<br>
		<input type="radio" name="arrAirportId" id="arrAirportId" value="NAARKSI">인천
		<input type="radio" name="arrAirportId" id="arrAirportId" value="NAARKSS">김포
		<input type="radio" name="arrAirportId" id="arrAirportId" value="NAARKPC">제주<br>
		<input type="radio" name="arrAirportId" id="arrAirportId" value="NAARKPU">울산
		<input type="radio" name="arrAirportId" id="arrAirportId" value="NAARKTN">대구
		<input type="radio" name="depAirportId" id="arrAirportId" value="NAARKTU">청주<br><br>
		출발 날짜<br>
		<input type="text" name="startDate" id="startDate"><br><br>
		
	<button type="submit" id="airsearchBtn">검색</button>
	</form>
	
	
	
	
	
	<!-- 따온거 -->
<body class="basicFont container">
<div class="logo"><a href="index.jsp"><img src="resources/images/bomair_logo.png"/></a></div>
<br><br><br>
* 도시 항공노선 정보 입력 * <p/>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
  $('#btn_go').click(function(){
		var aa = $('#month').val();
		var bb = $('#year').val();
		$('input[name=o_sdate]').attr('value', bb+'-'+aa+'-01');
		
		if($('#depAirportId').val() === ''){
			alert("도시를 입력해주세요");
		}else if(bb === ''){
			alert("년도를 입력해주세요");				
		}else if(aa === ''){
			alert("월을 입력해주세요");				
		}else{
			
		if($('#depAirportId').val() === 'NAARKPC'){
		$('input[name=o_soyo]').attr('value','70');
		//var bb = $('#o_sdate').val();
		//alert(bb);
		}else if($('#depAirportId').val() === 'NPT'){
			$('input[name=o_soyo]').attr('value','135');			
		}else if($('#depAirportId').val() === 'KIX'){
			$('input[name=o_soyo]').attr('value','95');			
		}else if($('#depAirportId').val() === 'FUK'){
			$('input[name=o_soyo]').attr('value','80');			
		}else if($('#depAirportId').val() === 'HKG'){
			$('input[name=o_soyo]').attr('value','220');			
		}else if($('#depAirportId').val() === 'BKK'){
			$('input[name=o_soyo]').attr('value','350');			
		}else if($('#depAirportId').val() === 'BKI'){
			$('input[name=o_soyo]').attr('value','410');			
		}else if($('#depAirportId').val() === 'WO'){
			$('input[name=o_soyo]').attr('value','270');			
		}else if($('#depAirportId').val() === 'JFK'){
			$('input[name=o_soyo]').attr('value','995');			
		}	
		alert($('#depAirportId').val() + "공항 " +  bb + "년 " + aa + "월의 db추가가 완료 되었습니다");

  		$("form:first").submit();
		}
  });
  
});
</script>

<form action="insert" method="post">
<!-- 
노선코드 : <input type="text" name="l_code" id="l_code"><br>
 -->

도시선택 : <select name="depAirportId" id=depAirportId>
    <option value="">도시선택</option>
    <option value="NAARKSI">인천</option>
    <option value="NAARKSS">김포</option>
    <option value="NAARKPC">제주</option>
    <option value="NAARKPU">울산</option>
    <option value="NAARKTN">대구</option>
    <option value="NAARKTU">청주</option>
</select><br>

년 : <input type="text" name="year" id="year" value="2020"><br>
월 : <input type="text" name="month" id="month"><br>
<input type="hidden" name="air_name">
<input type="hidden" name="o_sdate" id="o_sdate">
<input type="hidden" name="o_price"><br>
<input type="hidden" name="o_soyo" id="o_soyo">
<input type="hidden" name="o_stime">


<br>
<input type="button" value="추가" id="btn_go" >
<a href="list">리스트보기</a>
</form>

</body>
</html>
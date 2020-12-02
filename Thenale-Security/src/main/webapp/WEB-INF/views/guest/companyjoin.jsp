<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d408679cf9dd6620195c2436c57215d8&libraries=services"></script>
</head>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
            
            var gap = address.value; // 주소검색어
            if (gap=="") {
             alert("주소 검색어를 입력해 주십시오.");
             address.focus();
             return;
            }
            
            // 주소-좌표 변환 객체를 생성
            var geocoder = new daum.maps.services.Geocoder();

            // 주소로 좌표를 검색
            geocoder.addressSearch(gap, function(result, status) {
             
             // 정상적으로 검색이 완료됐으면,
             if (status == daum.maps.services.Status.OK) {
              
              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

              y = result[0].x;
              x = result[0].y;

              // 결과값으로 받은 위치를 마커로 표시합니다.
              var marker = new daum.maps.Marker({
               map: map,
               position: coords
              });



              // 인포윈도우로 장소에 대한 설명표시
              var infowindow = new daum.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:5px 0;">좌표위치</div>'
              });

              infowindow.open(map,marker);
              
              // 지도 중심을 이동
              map.setCenter(coords);

              document.getElementById("c_x").value= x;
              document.getElementById("c_y").value= y;
              
             }
            });
        }
    }).open();
}

</script>
<body>
	<h1>업체등록</h1>

	<form action="comjoinform" method="post" enctype="multipart/form-data"
		onsubmit="searchPlaces(); return false;">
		아이디<br> 
		<input type="text" name="c_id" id="c_id" onkeyup="idOverlap()"> <span id="idch"></span> 
		<input type="button" value="아이디중복확인" onclick="idOverlap()"><br>
		<p></p>
		비밀번호<br>
		<input type="text" name="c_password" id="c_password" onkeyup="pwdCheck1()"><br> <span id="pwdch"></span>
		<p></p>
		비밀번호 확인<br> 
		<input type="text" name="c_passwordch" id="c_passwordch" onkeyup="pwdEqFn1()"><br> 
		<span id="pwdEq"></span>
		<p></p>
		업체명<br> <input type="text" name="c_name" id="c_name"><br>
		<p></p>
		프로필<br> <input type="file" name="cfile" id="cfile"><br>
		<p></p>
		설명<br> <input type="text" name="c_contents" id="c_contents"><br>
		<p></p>
		주소<br> 
		<input type="text" id="sample6_postcode" name="c_address" placeholder="우편번호">
		<p></p>
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<p></p>
		<input type="text" id="sample6_address" name="c_address" placeholder="주소"><br>
		<p></p>
		<input type="text" id="sample6_detailAddress" name="c_address" placeholder="상세주소"> 
		<input type="text" id="sample6_extraAddress" name="c_address" placeholder="참고항목"><br>
		<p></p>

		<!-- 지도 api -->
		<div id="map" style="width: 40%; height: 350px;"></div>
		<!-- y 좌표<br> -->
		<input type="text" id="c_y" name="c_y">
		<!-- x 좌표<br> --> 
		<input type="text" name="c_x" id="c_x">
		
		업종<br> 
		<select name="c_sort">
			<option value="숙박">숙박</option>
			<option value="식당">식당</option>
		</select><br> 
		전화번호
		 <input type="text" id="c_ceo_tel" name="c_ceo_tel"><br>
		<p></p>
		이름 <input type="text" id="c_ceo" name="c_ceo"><br>
		<p></p>
		지역 <select name="c_area">
			<option value="제주">제주</option>
			<option value="전주">전주</option>
			<option value="경주">경주</option>
			<option value="부산">부산</option>
			<option value="강릉,속초">강릉,속초</option>
		</select><br>
		<p></p>
		<input type="submit" value="회원가입">
	</form>



	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2ae2da091765540d6419c005c1a3c6c&libraries=services"></script>
	<script>
	var address      = document.getElementById("sample6_address");
	var mapContainer = document.getElementById("map");
	var coordXY   = document.getElementById("coordXY");
	var mapOption;
	var map;
	var x,y          = "";

	if (address.value=="") {

	 mapOption = {
	  center: new daum.maps.LatLng(33.450701, 126.570667), // 임의의 지도 중심좌표 , 제주도 다음본사로 잡아봤다.
	        level: 4            // 지도의 확대 레벨

	 };
	}

	// 지도 생성
	map = new daum.maps.Map(mapContainer, mapOption);
</script>
</body>
</html>
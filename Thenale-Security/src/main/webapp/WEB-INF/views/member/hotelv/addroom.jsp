<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>addroom입니다.</h2>
<form action="hotelroomadd" method="post" enctype="multipart/form-data">
<input type="text" id="h_c_id" name="h_c_id" value="${loginId}" readonly>님 안녕하세요.<br>
객실 호수 : <input type="text" name="h_title" id="h_title"> <br>
가격 : <input type="text" name="h_price" id="h_price"><br>
사진 : <input type="file" name="hrfile" id="hrfile"><br>
객실 설명 : <input type="text" name="h_detail" id="h_detail"><br>
예약 가능 인원수 : <input type="text" name="h_person" id="h_person"><br>
<input type="hidden" id="h_num" name="h_num" value="${addroomResult}">
<button type="submit">추가하기!</button>



</form>

</body>
</html>
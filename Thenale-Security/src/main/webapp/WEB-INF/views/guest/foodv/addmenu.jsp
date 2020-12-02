<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>addmenu입니다.</h2>
<form action="foodmenuadd" method="post" enctype="multipart/form-data">
<input type="text" id="f_c_id" name="f_c_id" value="${loginId}" readonly>님 안녕하세요.<br>
메뉴이름 : <input type="text" name="f_m_name" id="f_m_name"> <br>
가격 : <input type="text" name="f_m_price" id="f_m_price"><br>
사진 : <input type="file" name="f_m_file" id="f_m_file"><br>
<input type="hidden" id="f_m_f_num" name="f_m_f_num" value="${addmenuResult}">
<button type="submit">추가하기!</button>



</form>


</body>
</html>
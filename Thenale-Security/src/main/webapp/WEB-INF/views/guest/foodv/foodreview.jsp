<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>foodreview입니다.</h2>
	
	






	<form action="freviewwrite" method="post" enctype="multipart/form-data">
		<input type="text" id="f_r_m_id" name="f_r_m_id" value="${sessionScope.loginId}" readonly><br>
		<input type="text" id="f_r_title" name="f_r_title" placeholder="제목"><br>
		<input type="text" id="f_r_contents" name="f_r_contents" placeholder="내용"> <br>
	사진  <input type="file" id="ffile" name="ffile"><br>

		<button type="submit">리뷰 작성!!</button>
	</form>




</body>
</html>
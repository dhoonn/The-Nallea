<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goKakaoLogin() {
		location.href="${kakaoUrl}";
	}
</script>
<style>
* {
	text-align:center;
	background: #e5e5e5;
}
</style>
</head>
<body onload="goKakaoLogin()">
	카카오<br>
	
</body>
</html>
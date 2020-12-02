<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goNaverLogin() {
		location.href="${naverUrl}";
	}
</script>
<style>
* {
	text-align:center;
	background: #e5e5e5;
}
</style>
</head>
<body onload="goNaverLogin()">
	<h2>NaverLogin.jsp</h2>
</body>
</html>
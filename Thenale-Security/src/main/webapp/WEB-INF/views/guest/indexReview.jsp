<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Review입니다.</h1>
	<h3>Hotel</h3>
	<div>
	
		<c:forEach var="hrL" items="${hrList}">
		<a href=""><img alt="리뷰용" src="${hrL.h_r_photo}"></a>
		<p>${hrL.h_r_title}</p>
		<p>${hrL.h_r_contents}</p>
		</c:forEach>

		<div></div>
		<div></div>
		<div></div>

	</div>
	<h3>Food</h3>
	<div>
	
		<c:forEach var="frL" items="${frList}">
		<a href=""><img alt="리뷰용" src="${frL.f_r_photo}"></a>
		<p>${frL.f_r_contents}</p>
		<p>${frL.f_r_title}</p>
		</c:forEach>

		<div></div>
		<div></div>
		<div></div>

	</div>
</body>
</html>
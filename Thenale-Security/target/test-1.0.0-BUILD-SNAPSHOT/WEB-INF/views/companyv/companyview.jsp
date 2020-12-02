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
	<table>
		<tr>
			<th>아이디</th>
			<th>업체명</th>
			<th>사진</th>
			<th>설명</th>
			<th>주소</th>
			<th>y좌표</th>
			<th>x좌표</th>
			<th>업종</th>
			<th>번호</th>
			<th>이름</th>
			<th>지역</th>
			<th>등급</th>
			<th>신청</th>
		</tr>
		<tr>
				<td>${cDTO.c_id}</td>
				<td>${cDTO.c_name}</td>
				<td>${cDTO.c_photo}</td>
				<td>${cDTO.c_contents}</td>
				<td>${cDTO.c_address}</td>
				<td>${cDTO.c_y}</td>
				<td>${cDTO.c_x}</td>
				<td>${cDTO.c_sort}</td>
				<td>${cDTO.c_ceo_tel}</td>
				<td>${cDTO.c_ceo}</td>
				<td>${cDTO.c_area}</td>
				<td>${cDTO.c_auth}</td>
				<td><button onclick="location.href='admission?c_id=${cDTO.c_id}'">신청하기</button></td>
		</tr>
	</table>
	<button onclick="location.href='index'">메인</button>
</body>
</html>
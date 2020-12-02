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
<h3>all Place List</h3>
gg:${sche}
<h2>여행지 둘러보기</h2>
	<table border=1>
		<tr>
			<th>지역</th>
			<th>장소</th>
			<th>사진</th>
			<th>설명</th>
		</tr>
		<c:forEach var="pDTO" items="${pDTO}" varStatus="status" begin="0" end="3">
			<tr>
				<td>${pDTO.p_name}</td>
				<td>${pDTO.p_a_name}</td>
				<td><img src="${pageContext.request.contextPath}/resources/profile/${pDTO.p_photo}" width="200" height="200"></td>
				<td>${pDTO.p_contents}</td>
				
			</tr>
		</c:forEach>
	</table>

	<h2>숙소 둘러보기</h2>
	<table border=1>
		<tr>
			<th>가게 이름</th>
			<th>설명</th>
			<th>지역</th>
			<th>주소</th>
			<th>사진</th>
		</tr>
		<c:forEach var="hDTO" items="${hDTO}" varStatus="status" begin="0" end="3">
			<tr>
				<td>${hDTO.h_name}</td>
				<td><a href="hotelview?h_num=${hDTO.h_num}">${hDTO.h_contents}</a></td>
				<td>${hDTO.h_area}</td>
				<td>${hDTO.h_address}</td>
				<td><img src="${pageContext.request.contextPath}/resources/profile/${hDTO.h_photo}" width="200" height="200"></td>
			</tr>
		</c:forEach>
	</table>
	
	<h2>식당 둘러보기</h2>
	<table border=1>
		<tr>
			<th>가게 이름</th>
			<th>설명</th>
			<th>지역</th>
			<th>주소</th>
			<th>사진</th>
		</tr>
		<c:forEach var="fDTO" items="${fDTO}" varStatus="status" begin="0" end="3">
			<tr>
				<td>${fDTO.f_name}</td>
				<td><a href="foodview?h_num=${fDTO.f_num}">${fDTO.f_contents}</a></td>
				<td>${fDTO.f_area}</td>
				<td>${fDTO.f_address}</td>
				<td><img src="${pageContext.request.contextPath}/resources/profile/${fDTO.f_photo}" width="200" height="200"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
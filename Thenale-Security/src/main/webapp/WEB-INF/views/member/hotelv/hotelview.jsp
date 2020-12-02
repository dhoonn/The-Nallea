<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>숙소 둘러보기</h2>
	<table border=1>
		<tr>
			<th>가게 이름</th>
			<th>설명</th>
			<th>지역</th>
			<th>주소</th>
			<th>사진</th>
		</tr>
			<tr>
				<td>${hDTO.h_name}</td>
				<td>${hDTO.h_contents}</a></td>
				<td>${hDTO.h_area}</td>
				<td>${hDTO.h_address}</td>
				<td><img src="${pageContext.request.contextPath}/resources/profile/${hDTO.h_photo}" width="200" height="200"></td>
			</tr>
	</table>
</body>
</html>
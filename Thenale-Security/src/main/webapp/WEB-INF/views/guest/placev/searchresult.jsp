<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>지역</th>
			<th>장소</th>
			<th>사진</th>
			<th>x좌표</th>
			<th>y좌표</th>
			<th>내용</th>
		</tr>
		<tr>
				<td>${typechoice.p_name}</td>
				<td>${typechoice.p_a_name}</td>
				<td>${typechoice.p_photo}</td>
				<td>${typechoice.p_x}</td>
				<td>${typechoice.p_y}</td>
				<td>${typechoice.p_contents}</td>
		</tr>
	</table>
</body>
</html>
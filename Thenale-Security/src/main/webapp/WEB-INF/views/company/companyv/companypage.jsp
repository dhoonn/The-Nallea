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
	<h1>company 관리 페이지</h1>
	<c:if test="${loginId != null}">
		<h3>${loginId}님환영합니다.</h3>
	</c:if>
	<c:if test="${loginId != null}">
	</c:if>
	가게명 : ${companyview.c_name}
	<br> 메인 사진 :
	<img
		src="${pageContext.request.contextPath}/resources/profile/${companyview.c_photo}"
		width="200" height="200">
	<br> 주소 : ${companyview.c_address}
	<br> 업종 : ${companyview.c_sort}
	<br> 전화번호 : ${companyview.c_ceo_tel}
	<br> 업주 성명 : ${companyview.c_ceo}
	<br> 지역 : ${companyview.c_area}
	<br> 승인 여부 :
	<c:if test="${companyview.c_auth eq 'b'}">
O<br>
		<c:if test="${companyview.c_sort eq '식당'}">

			<a href="<c:url value='/addmenu?f_c_id=${companyview.c_id}'/>">
				메뉴추가하기</a>
		</c:if>
		<c:if test="${companyview.c_sort eq '숙박'}">

			<a href="<c:url value='/addroom?h_c_id=${companyview.c_id}'/>">객실
				추가하기</a>


		</c:if>
	</c:if>
	
	<c:if test="${companyview.c_auth eq 'c'}">
X<br>
	</c:if>





	<button onclick="location.href='index'">메인</button>
</body>
</html>
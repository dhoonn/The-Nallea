<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function joinform() {
		location.href = "memberjoinform";
	}
	function loginform() {
		location.href = "memberloginform";
	}
	function com() {
		location.href = "comjoin";
	}
	function comlogin() {
		location.href = "comlogin";
	}
	function Search() {
		searchform.submit();
	}
</script>
</head>
<body>
	<h1>index 홈페이지</h1>
	<c:if test="${sessionScope.loginId eq null}">
		<button onclick="joinform()">회원가입</button>
		<button onclick="loginform()">로그인</button>
	</c:if>
	<c:if test="${sessionScope.loginId ne null }">
		<h3>${sessionScope.loginId}님환영합니다.</h3>
		<button onclick="location.href='memberlogout'">로그아웃</button>
		<button onclick="location.href='mypage?m_id=${loginId}'">내 정보</button>
	</c:if>
	<c:if test="${sessionScope.loginId eq 'admin'}">
		<button onclick="location.href='manager'">관리자</button>
	</c:if>
	<button onclick="com()">업체 등록</button>
	<button onclick="comlogin()">업체 로그인</button>
	<button onclick="location.href='goemail'">이메일</button>

	<form action="search" method="get" name="searchform">
		<input type="text" name="keyword" placeholder="검색어입력"> 
		<input type="button" onclick="Search()" value="검색">
	</form>
</body>
</html>

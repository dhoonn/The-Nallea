<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<s:authentication property="name" var="loginId"/>
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	function placesearch() {
		location.href="placesearch";
	}
 
</script>
<style type="text/css">
/* header */
body{
    margin: 0;
    font-family: Poppins;
    font-style: normal;
    font-weight: bold;
    text-transform: uppercase;
}
.top{
    height: 30px;
    left: 0px;
    top: 0px;
    background: #232122;
    font-size: 8px;
    color: white;
    padding-left: 110px;
    padding-right: 520px;
}

.topbtn{
	border : 0;
	margin:0;
	text-size: 8px;
	color: white;
	background-color: #232122;
	float:right;
	margin-right:-630px;
	margin-top:-31px;
}

.topnav {
  overflow: hidden;
  background: #FFFFFF;
  height: 80px;
  padding-right: 130px;
}

.topnav a {
  float: left;
  text-align: center;
  padding: 25px 25px;
  text-decoration: none;
  font-family: Poppins;
  font-style: normal;
  font-weight: bold;
  line-height: 45px;
  /* identical to box height */
  text-transform: uppercase;
  color: #232122;
}

.topnav-right {
  float: right;
}

</style>
</head>
<body>
    <div class="top">
        <div>
            <span style="color: #8C8C8C;">11월 11일 월요일 : </span>
            <span style="color: #FFFFFF;">9:00 AM - 5:30 PM</span>
            <span style="float: right;">
            <sec:authorize access="isAnonymous()">
                    <span style="color: #8C8C8C;">예약 관리 및 웹 사이트의 모든 기능을 이용하시려면 회원가입을 해주세요.
                    <a href="/memberjoinform" style="color: #FFFFFF; text-decoration: none;">회원가입</a></span>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
          	<p style="margin-top: -0.6px; padding-right:157px; ">${loginId}님, 반갑습니다.</p>
          </sec:authorize>
        </div>
    </div>
        <div>
         <sec:authorize access="isAuthenticated()">
	        <form action='<c:url value="/logout"/>' method="POST">
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                <button type="submit" class="topbtn">LOGOUT</button>
	        </form>
          </sec:authorize>
        </div>
    <div class="topnav">
			<sec:authorize access="isAnonymous()">
        <a href="/" style="padding-left: 130px; font-size: 35px;">THE NALLAE</a>
        <div class="topnav-right">
			<a href="<c:url value='/hotellist'/>">호텔</a>
			<a href="<c:url value='/placesearch'/>">즐길거리</a>
			<a href="<c:url value='/foodlist'/>">식당</a>
			<a href="<c:url value='/reviewlist'/>">리뷰</a>
            <a href="">항공권</a>
			<a href='<c:url value="/secu/loginPage"/>'>로그인</a>
			<a href="<c:url value='/areasearch'/>" style="margin-top: 15px;"><i class="fas fa-search" id="h_area"></i></a>
        </div>
			</sec:authorize> 
      </div>
			<sec:authorize access="hasRole('ROLE_MEMBER')">
	<div class="topnav" style="margin-top:-73px">
		<a href="" style="padding-left: 130px; font-size: 35px;">THE NALLAE</a>
		<div class="topnav-right">
			<a href="<c:url value='/hotellist'/>">호텔</a>
			<a href="<c:url value='/placesearch'/>">즐길거리</a>
			<a href="<c:url value='/foodlist'/>">식당</a>
			<a href="<c:url value='/reviewlist'/>">리뷰</a>
			<a href="">항공권</a>
			<a href="mypage?m_id=${loginId}">마이페이지</a>
			<a href="<c:url value='/areasearch'/>" style="margin-top: 15px;"><i class="fas fa-search" id="h_area"></i></a>
		</div>
</div>
</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
	<div class="topnav" style="margin-top:-73px">
		<a href="" style="padding-left: 130px; font-size: 35px;">THE NALLAE</a>
		<div class="topnav-right">
			<a href="<c:url value='/hotellist'/>">호텔</a>
			<a href="<c:url value='/placesearch'/>">즐길거리</a>
			<a href="<c:url value='/foodlist'/>">식당</a>
			<a href="<c:url value='/reviewlist'/>">리뷰</a>
			<a href="">항공권</a>
			<a href="<c:url value='/manager'/>">관리자</a>
			<a href="<c:url value='/areasearch'/>" style="margin-top: 15px;"><i class="fas fa-search" id="h_area"></i></a>
		</div>
	</div>
</sec:authorize>
</body>
</html>
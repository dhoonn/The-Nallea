<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
/* header */
.top {
	max-width: 100%;
	z-index: 9;
	align-items: center;
	height: 30px;
	top: 0px;
	background: #232122;
	font-size: 12px;
	color: white;
	padding-left: 110px;
	padding-right: 520px;
	margin-left: -100px;
	width: 120%;
	position: fixed;
}
.topnav {
	z-index: 8;
	overflow: hidden;
	background: #FFFFFF;
	height: 80px;
	padding-right: 130px;
	position: fixed;
	width: 100%;
	border-bottom: 1px black solid;
	margin-left: -100px;
}
.topnav a {
	float: left;
	text-align: center;
	padding: 20px 20px;
	text-decoration: none;
	font-family: Poppins;
	font-style: normal;
	font-weight: bold;
	line-height: 45px;
	text-transform: uppercase;
	color: #232122;
}
.topnav-right {
	float: right;
	font-size: 20px;
	margin-right: 80px;
}

/* body */
body {
	margin: 0;
	font-family: Poppins;
	font-style: normal;
	font-weight: bold;
	text-transform: uppercase;
	margin-top: 30px;
	margin-right: 100px;
	margin-left: 100px;
	line-height: 30px;
}

button {
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	border-radius: 29px;
	background-color: white;
	font-size: 13px;
	text-align: center;
	padding: 20px 40px;
}

.body1 {
	padding-left: 150px;
	padding-top: 280px;
}

/* body img */
.mySlides {
	display: none
}

img {
	vertical-align: middle;
}
/* Slideshow container */
.slideshow-container {
	max-width: 840px;
	max-height: 530px;
	position: relative;
	margin: auto;
	float: right;
	margin-right: 130px;
	margin-top: -500px;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@keyframes fade {
	from {opacity: .4
}
}
to {
	opacity: 1
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}
/* body2 */
.body2 img {
	padding-right: 10px;
}

.body3 {
	padding-left: 130px;
	margin-top: 320px;
}

footer {
	font-family: Poppins;
	font-style: normal;
	line-height: 30px;
	background-color: rgb(233, 231, 231);
	align-items: center;
	margin-top: 100px;
	padding-left: 225px;
	margin-left: -100px;
	width: 120%;
}

.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	font-size: 25px;
	margin: 8px 0px;
}

.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 8.35);
	height: 1px;
	line-height: 0px;
	margin: 0px 16px;
}

.join {
	margin-right: 100px;
}
.table {
    margin-top: 100px;
    margin-left: 300px;

}
</style>
<header>
<div class="top">
		<div>
			<span style="color: #8C8C8C;">11월 11일 월요일 : </span> <span
				style="color: #FFFFFF;">9:00 AM - 5:30 PM</span> <span>
				<div style="float: right;">
				
				
				<c:choose>
				
				<c:when test="${sessionScope.loginId ne null}">
				<h4 style="font-size: 15px; margin-top: -3px;">${sessionScope.loginId}님환영합니다.</h4>
				</c:when>
				
				<c:otherwise>
				<div class="join">
					<span style="color: #8C8C8C;">예약 관리 및 웹 사이트의 모든 기능을 이용하시려면
						회원가입을 해주세요.<a href="<c:url value='/memberjoinform'/>" style="color: #FFFFFF; text-decoration: none;">회원가입</a>
					</span>
				</div>
				</c:otherwise>
				
				</c:choose>
				</div>
			</span>
		</div>
	</div>

	<div class="topnav">
		<a href="<c:url value='/'/>" style="padding-left: 240px; font-size: 45px;">THE
			NALLAE</a>
			
		<div class="topnav-right">
		
		<a href="<c:url value='/hotellist'/>">호텔</a>
		<a href="">즐길거리</a>
		<a href="">식당</a>
		<a href="">리뷰</a>
		<a href="">항공권</a>
			<c:if test="${sessionScope.loginId eq 'admin'}">
				<a href="<c:url value='/manager'/>">관리자</a>
			</c:if>
			<c:if test="${sessionScope.loginId eq null}">
				<a href="<c:url value='/memberloginform'/>">로그인</a>
			</c:if>
			<c:if test="${sessionScope.loginId ne null}">
				<a href="<c:url value='/mypage?m_id=${loginId}'/>">내 정보</a>
				<a href="<c:url value='/memberlogout'/>">로그아웃</a>
			</c:if>
			<a href="<c:url value='/areasearch'/>"style="margin-top: 0px;"><i class="fas fa-search"></i></a>
</div>
		
		</div>
</header>
<body>



<h1>placelist.jsp</h1>




	<h2>숙소 둘러보기</h2>
	<table border=1 class="table">
		<tr>
			<th>설명</th>
			<th>지역</th>
			<th>주소</th>
			<th>사진</th>
		</tr>
			<c:forEach var="pDTO" items="${pDTO}" varStatus="status" begin="0" end="3">
			<tr>
				<%-- <td><a href="hotelview?h_num=${hDTO.h_num}">${hDTO.h_contents}</a></td> --%>
				<td>${pDTO.p_area}</td>
				<td>${pDTO.p_address}</td>
				<td><img src="${pageContext.request.contextPath}/resources/profile/${pDTO.p_photo}" width="200" height="200"></td>
			</tr>
			</c:forEach>
	</table>



</body>
</html>
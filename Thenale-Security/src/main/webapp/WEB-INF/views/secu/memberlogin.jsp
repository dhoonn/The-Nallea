<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
	background: #ffffff;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

#logo {
	width: 240px;
	height: 44px;
	cursor: pointer;
}

#header {
	padding-top: 200px;
	padding-bottom: 20px;
	text-align: center;
}

#wrapper {
	position: relative;
}

#content {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
}

/* 입력폼 */
h3 {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.box {
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}

input {
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

.box.int_id {
	padding-right: 110px;
}

.box.int_pass {
	padding-right: 40px;
}

.box.int_pass_check {
	padding-right: 40px;
}

.step_url {
	/*@naver.com*/
	position: absolute;
	top: 16px;
	right: 13px;
	font-size: 15px;
	color: #8e8e8e;
}

.pswdImg {
	width: 18px;
	height: 20px;
	display: inline-block;
	position: absolute;
	top: 50%;
	right: 16px;
	margin-top: -10px;
	cursor: pointer;
}

#bir_wrap {
	display: table;
	width: 100%;
}

#bir_yy {
	display: table-cell;
	width: 147px;
}

#bir_mm {
	display: table-cell;
	width: 147px;
	vertical-align: middle;
}

#bir_dd {
	display: table-cell;
	width: 147px;
}

#bir_mm, #bir_dd {
	padding-left: 10px;
}

select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	background: #fff
		url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100%
		50% no-repeat;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

.btn_area {
	margin: 30px 0 91px;
}

#btnJoin {
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: #fff;
	background-color: #176af0;
	font-size: 20px;
	font-weight: 400;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

.float-right {
	float: right;
	position: relative;
	top: -50px;
}

.inline {
	display: inline;
}
</style>
</head>
<body>
	<!-- header -->
	<div id="header">
		<a href="<c:url value='/'/>" title="The날래 회원가입 페이지 보러가기"><img
			src="${pageContext.request.contextPath}/resources/source/main.PNG"
			id="logo"></a>
	</div>


	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">

			<!-- ID -->
			<form action="memberlogin" method="post">
				<div>
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id"> <input type="text" id="id"
						name="m_id" class="int" maxlength="20">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- PW1 -->
				<div>
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input type="text" id="pswd1"
						name="m_password" class="int" maxlength="20"> <img
						src="m_icon_pass.png" id="pswd1_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- JOIN BTN-->
				<div class="btn_area">
					<button type="submit" id="btnJoin">
						<span>로그인</span>
					</button>
				</div>
				<h3>카카오 로그인</h3>
				<a href="kakaologin"> <img
					src="${pageContext.request.contextPath}/resources/profile/kakao_login_medium_narrow.png">
				</a><br>

				<h3>네이버 로그인</h3>
				<a href="naverlogin"> <img
					src="${pageContext.request.contextPath}/resources/profile/네이버 아이디로 로그인_완성형_Green.PNG"
					style="width: 183px; hight: 45px;">
				</a><br>
			</form>
			</form>
		</div>
	</div>

</body>
</html>
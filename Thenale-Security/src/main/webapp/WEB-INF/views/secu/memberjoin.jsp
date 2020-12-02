<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	
</script>
</head>
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
	padding-top: 62px;
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

/* 에러메세지 */
.error_next_box {
	margin-top: 9px;
	font-size: 12px;
	color: red;
	display: none;
}

#alertTxt {
	position: absolute;
	top: 19px;
	right: 38px;
	font-size: 12px;
	color: red;
	display: none;
}

/* 버튼 */
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

.email_injeung {
	font-size: 15px;
	font-weight: 500;
	position: relative;
	top: -7px;
}
</style>
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
			<form action="memberjoin" method="post" enctype="multipart/form-data">
				<div>
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id" style="width: 330px;"> <input
						type="text" id="id" name="m_id" onkeyup="idOverlap()" class="int"
						maxlength="20">
					</span> <span class="idch"></span>
				</div>

				<!-- id 중복 버튼 -->
				<button class="float-right" type="button" id="btnJoin"
					onclick="idOverlap()" style="width: 130px; height: 49.5px;">
					<span class="email_injeung">아이디 중복 체크</span>
				</button>

				<!-- PW1 -->
				<div>
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input type="text" id="pswd1"
						name="m_password" class="int" maxlength="20"> <span
						id="alertTxt">사용불가</span> <img src="m_icon_pass.png"
						id="pswd1_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- PW2 -->
				<div>
					<h3 class="join_title">
						<label for="pswd2">비밀번호 재확인</label>
					</h3>
					<span class="box int_pass_check"> <input type="text"
						id="pswd2" class="int" maxlength="20"> <img
						src="m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- NAME -->
				<div>
					<h3 class="join_title">
						<label for="name">이름</label>
					</h3>
					<span class="box int_name"> <input type="text" id="name"
						name="m_name" class="int" maxlength="20">
					</span> <span class="error_next_box"></span>
				</div>


				<!-- EMAIL -->
				<div>
					<h3 class="join_title">
						<label for="email">이메일</label>
					</h3>
					<span class="box int_email" style="width: 330px;"> <input
						type="text" id="m_email" name="m_email" class="int inline"
						maxlength="100" placeholder="ex) thenale@naver.com">
					</span>

					<!--email 인증버튼 -->
					<button class="float-right" type="button" id="btnJoin"
						onclick="btn_submit()" style="width: 130px; height: 49.5px;">
						<span class="email_injeung">이메일 인증</span>
					</button>
				</div>

				<!-- email 인증  input -->
				<div>
					<h3 class="join_title">
						<label for="phoneNo">이메일 인증번호</label>
					</h3>
					<span class="box int_mobile"> <input type="tel" id="mobile"
						class="int" maxlength="16" placeholder="인증번호 입력">
					</span> <span class="error_next_box"></span>
				</div>



				<!-- MOBILE -->
				<div>
					<h3 class="join_title">
						<label for="phoneNo">휴대전화</label>
					</h3>
					<span class="box int_mobile"> <input type="tel" id="mobile"
						name="m_phone" class="int" maxlength="16" placeholder="전화번호 입력">
					</span> <span class="error_next_box"></span>
				</div>


				<!-- PROFILE -->
				<div>
					<h3 class="join_title">
						<label for="phoneNo">프로필</label>
					</h3>
					<span class="box int_mobile"> <input type="file" id="mobile"
						name="mfile" class="int" maxlength="16" placeholder="전화번호 입력">
					</span> <span class="error_next_box"></span>
				</div>


				<!-- JOIN BTN-->
				<div class="btn_area">
					<button type="submit" id="btnJoin">
						<span>가입하기</span>
					</button>
				</div>
			</form>
			<h3>카카오로 회원가입</h3>
			<a href="kakaojoin"> <img
				src="${pageContext.request.contextPath}/resources/profile/kakao_login_large_wide.png"
				style="width: 600; height: 100;">
			</a>

			<h3>네이버로 회원가입</h3>
			<a href="naverjoin"> <img
				src="${pageContext.request.contextPath}/resources/profile/Log_in_with_NAVER_Official_White.PNG"
				style="width: 600; height: 100;">
			</a>
		</div>
	</div>

</body>
<script>
	// 아이디 중복 체크
	function idOverlap() {

		var inputId = $("#m_id").val();
		var checkresult = document.getElementById("checkresult");
		console.log(inputId);
		console.log(checkresult);

		$.ajax({
			type : "post",
			url : "idoverlap",
			data : {
				"m_id" : inputId
			},
			dataType : "text",
			success : function(result) {
				if (result == "OK") {
					alert("사용가능한 ID 입니다.");
				} else {
					alert("이미 사용중인 ID 입니다.");
				}
			},
			error : function() {
				console.log("실패!!");
			}
		});
	}

	// 이메일 인증 보내기
	function btn_submit() {

		var m_email = $("#m_email").val();
		$.ajax({
			type : "post",
			url : "auth_do",
			data : {
				"m_email" : m_email
			},
			dataType : "text",
		});
		alert("이메일을 보냈습니다");
	}

	$(document).ready(function() {
		$("button[name=mail_ok]").click(function() {
			$("form[name=btn_injeung]").attr({
				action : "join_injeung.do${dice}"
			}).submit();
		});
	});

	//아이디 정규식
	function idCheck() {
		var exp = /^[a-z]+[a-z0-9]{4,19}$/g;
		var id = document.getElementById("m_id").value;

		if (id.match(exp)) {
			alert('완료되었습니다.');
		} else if (id.length == 0) {
			alert('아이디를 입력하세요');

		} else {
			alert('아이디를 5~20자로 입력하세요');
		}

		var inputId = document.getElementById("m_id").value;
		var idch = document.getElementById("idch");

		$.ajax({
			type : "post",
			url : "idchk",
			data : {
				"m_id" : inputId
			},
			dataType : "text",

			success : function(result) {
				if (result == "OK") {
					idch.style.color = "green";
					idch.innerHTML = "사용가능한 ID 입니다.";
				} else {
					idch.style.color = "red";
					idch.innerHTML = "이미 사용중인 ID 입니다.";
				}
			},
			error : function() {
				idch.style.color = "red";
				idch.innerHTML = "ajax 실패!!";
			}
		});
	}

	//비밀번호 확인
	function pwdEqFn1() {
		var pwd = document.getElementById("m_password").value;
		var pwdch = document.getElementById("m_passwordch").value;
		var eqmsg = document.getElementById("pwdEq");
		if (pwd == pwdch) {
			eqmsg.style.color = "green";
			eqmsg.style.fontSize = "12px";
			eqmsg.innerHTML = "일치";
		} else {
			eqmsg.style.color = "red";
			eqmsg.style.fontSize = "12px";
			eqmsg.innerHTML = "불일치";
		}
		if (pwd != pwd.lean) {
		}
		//비밀번호 형식 확인
		function pwdCheck1() {
			var exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%#?&])[A-Za-z\d$@$!%#?&]{8,16}$/;
			var pwd = document.getElementById("m_password").value;
			var pwdch = document.getElementById("pwdch");
			if (pwd.match(exp)) {
				pwdch.style.color = "green";
				pwdch.innerHTML = "비밀번호 형식 맞음";
				pwdch.style.fontSize = "12px";
			} else {
				pwdch.style.color = "red";
				pwdch.innerHTML = "소문자,대문자,숫자,특수문자가 포함되고 자릿수는 8~16";
				pwdch.style.fontSize = "12px";
			}
		}

		//전화번호 정규식
		function phonech() {
			var pnum = document.getElementById("m_phone").value;
			var exp = /^\d{3}-\d{4}-\d{4}$/;
			var num = document.getElementById("pch");
			if (pnum.match(exp)) {
				num.style.color = "green";
				num.innerHTML = "전화번호 형식 맞음";
				num.style.fontSize = "12px";
			} else {
				num.style.color = "red";
				num.style.fontSize = "12px";
				num.innerHTML = "전화번호 형식 안맞음";
			}
		}
	}
</script>
</html>
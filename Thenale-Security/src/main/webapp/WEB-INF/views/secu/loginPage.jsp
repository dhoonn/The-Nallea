<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"  %>
<title>Login</title>
</head>
<body>
    <form class="px-4 py-3" action="/login" method="post">
  	아이디<br>
    <input type="text" class="form-control" name="loginId" placeholder="example" style="width:500px;">
    <p><p>
         비밀번호<br>
    <input type="password" class="form-control" name="loginPwd" placeholder="Password" style="width:500px;">
    <p><p>
    <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
    <font color="red">
        <p>Your login attempt was not successful due to <br/>
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
    </font>
</c:if>
		<div class="form-check">
			<label class="form-check-label"> <input type="checkbox"
				class="form-check-input"> Remember me
			</label>
		</div>
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
    <p><p>
    <button type="submit" class="btn btn-primary">Sign in</button>
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
	      <div class="dropdown-divider"></div>
	      <a class="dropdown-item" href="#">New around here? Sign up</a>
	      <a class="dropdown-item" href="#">Forgot password?</a>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 /* footer */

footer{
  font-family: Poppins;
    font-style: normal;
    line-height: 30px;
    background-color: rgb(233, 231, 231);
    align-items: center;
    margin-top: 400px;
    padding-left: 130px; 
}
</style>
</head>
<footer id="footer">
  <div class="footer_top">
    <div class="inr03">
		<ul data-footer="menu">
			<li><a href="info_02.html">개인정보처리방침</a></li>
			<li><a href="info_01.html">이용약관</a></li>
			<li><a href="info_03.html">이메일무단수집거부</a></li>
			<li><a href='<c:url value="/company/page"/>' role="button"
				class="btn btn-outline-secondary btn-block">COMPANY</a></li>
		<%-- 	<li><sec:authorize access="isAnonymous()">
					<a href='<c:url value="/comlogin"/>'>COMPANY LOGIN</a>
				</sec:authorize></li> --%>
		</ul>
		<address>
        <div>
          <span>THE NALLEA</span>
          <span><em>주소</em>ICIA</span>
        </div>
      </address>
    </div>
  </div>
  <div class="footer_bottom">
    <div class="inr03">
      <p>
        Copyright © THE NALLEA. All right reserved.
      </p>
    </div>
  </div>
</footer>
</html>
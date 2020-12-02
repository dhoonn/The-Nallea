<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
 <%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String name = "";
	if(principal != null) {
		name = auth.getName();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
	function areasearch() {
		location.href="areasearch";
	}
	   function calendar(){
		      location.href="membercalender";
		   }
</script>
<style>
/* body    ()*/
body{
    font-family: Poppins;
    font-style: normal;
    line-height: 30px;
}
.btn{
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 29px;
    background-color: white;
    font-size: 13px;
    text-align: center;
    padding: 20px 40px;
}
.body1{
    padding-left: 150px;
    padding-top: 200px;
}

/* body img */
.mySlides {display: cover}
img {vertical-align: middle;}
/* Slideshow container */
.slideshow-container {
  max-width: 600px;
  max-height: 500px;
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
  background-color: rgba(0,0,0,0.8);
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

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
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

/* 모달 */
  .modal_wrap{
       display: none;
       width: 550px;
       height: 150px;
       position: absolute;
       top:50%;
       left: 45%;
       margin: -250px 0 0 -250px;
       background:#eee;
       z-index: 2;
       padding : 25px;
   }
   .black_bg{
       display: none;
       position: absolute;
       content: "";
       width: 100%;
       height: 100%;
       background-color:rgba(0, 0,0, 0.5);
       top:0;
       left: 0;
       z-index: 1;
   }
   .modal_close{
       width: 26px;
       height: 26px;
       position: absolute;
       top: -30px;
       right: 0;
   }
   .modal_close> a{
       display: block;
       width: 100%;
       height: 100%;
       background:url(https://img.icons8.com/metro/26/000000/close-window.png);
       text-indent: -9999px;
   }
  .hotelkeyword {
     border-style : none;
  }
.place {
   display: inline;
   float: left;
   margin-left: 20px;
   text-align: center;
   border: 0.1px solid rgba(116, 241, 133, 0.411);
   padding: 5px 5px 5px 5px;
}
.clearfix {
	clear:value;
}


</style>
</head>
<body>
<div id="nav">
	<%@ include file="../include/nav.jsp"%>
</div>
	<div class="body1">
		<div>
			<h3 style="font-size: 15px; color: #232122;">THE NALLAE</h3>
		</div>
		<p
			style="font-size: 50px; line-height: 108px; font-family: Poppins; margin-top: -40px;">
			떠날래와 함께 <br> 여행을 준비해 볼까요?
		</p>
		<p
			style="font-size: 15px; color: #8C8C8C; margin-top: -40px; margin-bottom: 50px;">
			떠나고 싶은 여행지를 등록하고 본인이 준비한 여행 일정을 등록 해보세요. <br> 시간과 장소 여행 관리를 한번에!
			여기는 떠날래 입니다.
		</p>
		<button onclick="calendar()" class="btn" style="font-size: 15px;">
			<strong>일정짜러 가기</strong>
		</button>
		<div class="slideshow-container">

			<div class="mySlides fade">
				<a href="#"><img src="${pageContext.request.contextPath}/resources/place_ph/서울3.jpg"
					style="width: 100%; height: 550px;"></a>
			</div>

			<div class="mySlides fade">
				<a href="#"><img src="${pageContext.request.contextPath}/resources/place_ph/여수3.jpg"
					style="width: 100%; height: 550px;"></a>
			</div>

			<div class="mySlides fade">
				<a href="#"><img src="${pageContext.request.contextPath}/resources/place_ph/제주4.png"
					style="width: 100%; height: 550px;"></a>
			</div>
			
			<div class="mySlides fade">
				<a href="#"><img src="${pageContext.request.contextPath}/resources/place_ph/경주4.jpg"
					style="width: 100%; height: 550px;"></a>
			</div>

			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
				onclick="plusSlides(1)">&#10095;</a>

			<div>
				<h3 style="font-size: 18px; color: #232122; float: left;">THE
					NALLAE</h3>
				<p
					style="font-size: 15px; color: #8C8C8C; float: left; margin-top: -10px;">떠날래
					에디터가 추천하는 여행지. 인스타 감성 충만한 곳!  여자 친구의 인생 사진을 찍고 싶다면 지금 이 장소 어떠신가요?</p>
			</div>
		</div>
	</div>
	<div class="body2" style="margin-top: 140px; padding-left: 130px;">
		<div>
			<div style="font-size: 30px; color: #232122;">
				<p>여행자들이 선호 하는 국내 여행지</p>
			</div>
			<div>
				<a href="<c:url value='/placelist'/>"
					style="float: right; padding-right: 130px; margin-top: -40px; font-size: 20px; text-decoration: none; color: #8C8C8C;">more</a>
			</div>
		</div>
        <c:forEach var="pDTO" items="${phDTO}" varStatus="status" begin="0" end="3">
        <div style="float: left;">
                <div class="place">
                <a href="<c:url value='/placeview?p_num=${pDTO.p_num}'/>" style="text-decoration: none;">
                <img src="${pageContext.request.contextPath}/resources/company/${pDTO.p_photo}" style="width: 330px; height: 300px;">
                    <h3>${pDTO.p_area}</h3>
                  <p>${pDTO.p_name}asdasd</p>
                  </a>
                  </div>
            </div>
		</c:forEach>            

        </div>
	
	<br><br>
        <br><br><br><br>
	
	<!-- css 작업 추가 -->
	<!-- 선 -->
	<!-- 호텔 사진들 -->
	<div style="margin-left: 10px; margin-top: 300px;"></div>
	<div class="hr-sect clearfix">이런 곳은 어때요?</div>
	
    <div class="body2" style="margin-top: 100px; padding-left: 130px;">
        <div>
            <div style="font-size: 30px; color: #232122;">
                <p>현재 인기 급상승~! 멋진 호텔을 만나보세요.</p>
            </div>
            <div>
                <a href="<c:url value='/hotellist'/>"
                    style="float: right; padding-right: 130px; margin-top: -40px; font-size: 20px; text-decoration: none; color: #8C8C8C;">more</a>
            </div>
        </div>
        <c:forEach var="hDTO" items="${hDTO}" varStatus="status" begin="0" end="3">
        <div style="float: left;">
                <div class="place">
                <a href="<c:url value='/hotelview?h_num=${hDTO.h_num}'/>" style="text-decoration: none;">
                <img src="${pageContext.request.contextPath}/resources/company/${hDTO.h_photo}" style="width: 330px; height: 300px;">
                    <h3>${hDTO.h_area}</h3>
                  <p>${hDTO.h_name}</p>
                  </a>
                  </div>
            </div>
		</c:forEach>            

        </div>


        <br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>
       
       
        <h2></h2>
    <!-- css 작업 추가 -->
	<!-- 선 -->
	<!-- 식당 구역 -->
	 <div style="margin-left: 140px;">
        <h2></h2>
    </div>
	<div class="hr-sect clearfix">이런 곳은 어때요?</div>
    
    <div class="body2" style="margin-top: 140px; padding-left: 130px;">
        <div>
            <div style="font-size: 30px; color: #232122;">
                <p>전국의 맛집은 다 모였다</p>
            </div>
            <div>
                <a href="<c:url value='/foodlist'/>"
                    style="float: right; padding-right: 130px; margin-top: -40px; font-size: 20px; text-decoration: none; color: #8C8C8C;">more</a>
            </div>
        </div>
		<c:forEach var="fDTO" items="${fDTO}" varStatus="status" begin="0" end="3">
         <div style="float: left;">
            <div>
               <div class="place">
               <a href="<c:url value='/foodview?f_num=${fDTO.f_num}'/>" style="text-decoration: none;">
                  <img src="${pageContext.request.contextPath}/resources/profile/img_5terre.jpg" style="width: 400px; height: 370px;">
                  <h3>${fDTO.f_area}</h3>
                  <p>${fDTO.f_name}</p>
                  </a>
               </div>
            </div>
         </div>
         </c:forEach>
        </div>

	<br><br><br><br><br><br><br><br><br>
        <br>

	<!-- ABOUT -->
	<div class="body3 clearfix">
		<div style="width: 45%;"><br>
			<p style="color: #8C8C8C; font-size: 15px;">About us</p>
			<p style="font-size: 25px; color: #232122; float: left; margin-top: -0.5%;">
				새로운 여행의 시작<br> 떠날래를 함께 알아볼까요?
			</p>
			<p style="color: #8C8C8C; font-size: 12px; margin-top: 15%;">
				떠날레는 바쁜 현대인들에게 보다 손쉽고 편한 여행을 선사하고자 만들었습니다.<br> 여행자와 여행지를 연결한다는
				것은 비단 장소와 사람의 연결을 의미하는 것 만은 아닙니다.
			</p>
			<button class="btn">
				<strong> 자세히 </strong>
			</button>
		</div>
		<div
			style="float: right; width: 60%; margin-top: -262px; padding-right: 170px; padding-left: 80px;">
			<p style="font-size: 25px; color: #232122; float: left; margin-top: 13px;">
				코로나로 지친<br> 자영 업자들에게 새로운 희망
			</p>
			<p	style="color: #8C8C8C; font-size: 12px; float: left; margin-top: 18px;">발생되는
				수익금의 일부를 코로나로 고통받는 의료인, 자영업자들에게 기부하여 서로의 부담을 줄여 주는 떠날래 입니다. 여행이란 새로운
				연결을 통해 모두 에게 새로운 희망이 될 겁니다.</p>
		</div>
	</div>

	<!-- 맨 아래 footer -->
<footer id="footer">
<div class="footer_top">
	<div class="inr03">
		<ul data-footer="menu"><br>
			<li><a href="info_02.html">개인정보처리방침</a></li>
			<li><a href="info_01.html">이용약관</a></li>
			<li><a href="info_03.html">이메일무단수집거부</a></li>
			<li><a href="<c:url value='/comjoin'/>">업체등록</a></li>
		</ul>
		<address>
				<span>THE NALLEA</span> <span><em>주소</em>ICIA</span>
		</address>
	</div>
</div>
<div class="footer_bottom">
	<div class="inr03">
		<p>Copyright © THE NALLEA. All right reserved.</p>
	</div>
</div>
</footer>

</body>

<script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }

        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }

        slides[slideIndex - 1].style.display = "block";
    }
    
  
</script>

  
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

		<button onclick="location.href='mypage?m_id=${loginId}'">내 정보</button>
	<c:if test="${sessionScope.loginId eq 'admin'}">
		<button onclick="location.href='manager'">관리자</button>
	</c:if>
	<button onclick="comlogin()">업체 로그인</button>
	<button onclick="location.href='goemail'">이메일</button>
	<button onclick="location.href='calendar'">스케줄(달력)</button>
	<button onclick="location.href='goAir'">항공권</button>
	<button onclick="location.href='goMap'">지도api</button>
	<button onclick="areasearch()">여행지 검색</button>
	<button onclick="location.href='tests'">test</button>

	<h2>여행지 둘러보기</h2>
	<table border=1>
		<tr>
			<th>지역</th>
			<th>장소</th>
			<th>사진</th>
			<th>설명</th>
		</tr>
		<c:forEach var="pDTO" items="${pDTO}" varStatus="status" begin="0" end="3">
			<tr>
				<td>${pDTO.p_name}</td>
				<td>${pDTO.p_a_name}</td>
				<td><img src="${pageContext.request.contextPath}/resources/profile/${pDTO.p_photo}" width="200" height="200"></td>
				<td>${pDTO.p_contents}</td>
				
			</tr>
		</c:forEach>
	</table>

	
	<h2>식당 둘러보기</h2>
	<table border=1>
		<tr>
			<th>가게 이름</th>
			<th>설명</th>
			<th>지역</th>
			<th>주소</th>
			<th>사진</th>
		</tr>
		<c:forEach var="fDTO" items="${fDTO}" varStatus="status" begin="0" end="3">
			<tr>
				<td>${fDTO.f_name}</td>
				<td><a href="foodview?h_num=${fDTO.f_num}">${fDTO.f_contents}</a></td>
				<td>${fDTO.f_area}</td>
				<td>${fDTO.f_address}</td>
				<td><img src="${pageContext.request.contextPath}/resources/profile/${fDTO.f_photo}" width="200" height="200"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>

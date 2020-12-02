<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	 function goLink(){
		if(airList.a_title=="아시아나항공"){
			window.location.href="https://www.flyasiana.com/C/KR/KO/index";
		} else if (airList.a_title=="에어부산"){
			window.location.href="https://www.airbusan.com/web/individual/booking/flightsAvail";
		} else if (airList.a_title=="에어서울"){
			window.location.href="https://flyairseoul.com/I/ko/viewBooking.do";
		} else if (airList.a_title=="이스타항공"){
			window.location.href="";
		} else if (airList.a_title=="플라이강원"){
			window.location.href="https://www.flygangwon.com/ko/booking/viewAvailCondition.do";
		} else if (airList.a_title=="하이에어"){
			window.location.href="https://www.hi-airlines.com/v/booking/avail/search";
		} else if (airList.a_title=="제주항공"){
			window.location.href="https://www.jejuair.net/jejuair/kr/main.do";
		} else if (airList.a_title=="진에어"){
			window.location.href="https://www.jinair.com/booking/index?&ctrCd=KOR&snsLang=ko_KR&cid=BC_affiliate_AirMoney_PC_null_20200801";
		} else if (airList.a_title=="대한항공"){
			window.location.href="https://www.koreanair.com/korea/ko/booking/booking-gate.html";
		} else if (airList.a_title=="티웨이항공"){
			window.location.href="https://www.twayair.com/app/booking/searchItinerary";
		} else {
			
		}
		
	} 
</script>
</head>
<body>
	
	
	<div id="webkit-xml-viewer-source-xml">
	
	<table>
		<tr>
			<td>항공사</td>
			<td>출발공항</td>
			<td>출발시각</td>
			<td>도착공항</td>
			<td>도착시각</td>
			<td>항공기</td>
			<td>일반석</td>
			<td>비즈니스석</td>
			<td>예매</td>
		</tr>
		<c:forEach var="airList" items="${airList}">
		<tr>
			<td>${airList.a_title}</td>
			<td>${airList.a_startplace}</td>
			<td>${airList.a_startdate}</td>
			<td>${airList.a_endplace}</td>
			<td>${airList.a_enddate}</td>
			<td>${airList.a_name}</td>
			<td>${airList.a_eprice}</td>		
			<td>${airList.a_bprice}</td>
			<td><button onclick="goLink()">예매사이트 바로가기</button></td>
		</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>
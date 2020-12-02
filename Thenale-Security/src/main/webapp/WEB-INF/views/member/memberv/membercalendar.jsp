<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html; charset=utf-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<html>
<head>
<link href="${path}/css/room.css?ver=21" rel="stylesheet"> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<style>
.ui-datepicker{ font-size: 15px; width: 250px; background:white; }
.ui-widget-header{background:salmon}
.ui-datepicker-title{color:white}
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }


.roombox {
	position: absolute;
	margin-left: 10;
	margin-top: 10%;
	display: inline-block;
	width: 15%;
	height: 51%;
	background: #2c4162;
	color: white;
	border: 1px solid;
	z-index: 100;
	text-align: center;
	border-radius: 10px;
	box-shadow: 1px 1px 5px grey;
}

.roombox input {
	width: 90%;
	height: 30;
	border-radius: 5px;
	text-align: center;
}

.room_select {
	color: black;
	margin-left: 5%;
	background: white;
	width: 90%;
	height: 30;
	border-radius: 5px;
	text-align: center;
	border: 1px solid white;
	cursor: pointer;
	padding-top: 3px;
}

.room_dropbox {
	display: none;
	margin-top: 1px;
}

.room_dropbox div {
	color: black;
	margin-left: 5%;
	position: absolute;
	cursor: pointer;
	text-align: center;
	background: white;
	width: 90%;
	height: 30;
	border: 1px solid white;
}

.room_dropbox div:hover {
	background: #C6C6C6;
}
#room1{
	background:salmon;
}
.room2 {
	margin-top: 30;
}

.room3 {
	margin-top: 60;
}

.person_select {
	color: black;
	margin-left: 5%;
	background: white;
	width: 90%;
	height: 30;
	border-radius: 5px;
	text-align: center;
	border: 1px solid white;
	cursor: pointer;
	padding-top: 3px;
}

.person_dropbox {
	display: none;
	margin-top: 1px;
}

.person_dropbox div {
	color: black;
	margin-left: 5%;
	position: absolute;
	cursor: pointer;
	text-align: center;
	background: white;
	width: 90%;
	height: 30;
	border: 1px solid white;
}

.person_dropbox div:hover {
	background: #A2A2A2;
}

.person2 {
	margin-top: 30;
}

.person3 {
	margin-top: 60;
}

.person4 {
	margin-top: 90;
}

.toggle_person {
	display: none;
}

.blur_box_left {
	width: 200px;
	height: 40%;
	background: rgba(255, 255, 255, .4);
	position: absolute;
}

.blur_box_right {
	margin-left: 600;
	width: 200px;
	height: 40%;
	background: rgba(255, 255, 255, .4);
	position: absolute;
}

.slidebox {
	margin-top: 10%;
	margin-left: 22%;
	overflow: hidden;
	display: inline-block;
	width: 800px;
	height: 40%;
	border: 1px solid #2c4162;
	overflow: hidden;
	background: whitesmoke;
}

.slide_btn {
	position: absolute;
	z-index: 10;
	margin-top: 10%;
	margin-left: 23%;
	width: 800px;
	height: 40%;
}

.slide_btn button {
	margin-top: 20%;
	background: unset;
	color: white;
	background: black;
	font-size: 20;
	border: none;
	opacity: 0.8;
	padding-top: 5px;
}

.slide_left {
	margin-left: 13%;
}

.slide_right {
	margin-left: 63%;
}

.slidebox img {
	display: inline-block;
	width: 400;
	height: 100%;
}

.imgbox {
	width: 9999px;
}

.slider {
	margin-top: 10;
	width: 830;
	margin-left: 22%;
	height: 10%;
	overflow: hidden;
}

.slider_imgbox {
	width: 9999px;
}

.slider img {
	cursor: pointer;
	margin-right: 1;
	width: 80;
	height: 90%;
	margin-top: 2;
}

.active_img {
	border: 2px solid salmon;
}

.btn_box {
	position: absolute;
	margin-top: 7.5%;
	margin-left: 22%;
	width: 50%;
}

.btn_box button {
	padding: 13px;
	box-shadow: none;
	border: 1px solid black;
	border-bottom: none;
	border-radius: 0;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	background: #2c4162;
}

.room_submit {
	width: 80%;
	margin-top: -7.5%;
}

.room_submit:hover {
	background: #F54F29;
	color: white;
	border: 1px solid #F54F29;
	transition: 0.3s;
}

.modal {
	text-align: center;
	width: 100%;
	position: absolute;
	display: none;
	height: 100%;
	background: rgba(0, 0, 0, .9);
	z-index: 1000;
}

.carcurlator {
	width: 30vw;
	height: 40vh;
	margin-top: 10%;
	background: white;
	margin-left: 35%;
	box-shadow: 1px 1px 5px grey;
	border-radius: 10px;
}

.carcurlator button {
	margin-top: 10%;
}

.carcurlator h1 {
	margin-bottom: 30;
}

.checkout_room {
	margin-left: 22%;
}

.remaining_div {
	margin-top: 7.5%;
	width: 18%;
	height: 80%;
	position: absolute;
	box-shadow: 1px 1px 5px grey;
	text-align: center;
	margin-left: 45%;
	background: white;
	z-index: 100;
	display: none;
}

.remaining_div h3 {
	position: absolute;
	margin-left: 90%;
	margin-top: 0%;
	cursor: pointer;
	font-size: 1em;
}

.remaining_table {
	margin-top: 9%;
	color: currentColor;
	text-align: center;
	font-size: .8vw;
	border-top: 1px solid dodgerblue;
	border-collapse: collapse;
	width: 100%;
	font-family: NanumSquareRound;
	font-weight: 700;
}

.remaining_table th {
	border-bottom: 1px solid dodgerblue;
	border-collapse: collapse;
}

.remaining_table td {
	border-bottom: 1px solid dodgerblue;
	border-collapse: collapse;
}

.carcurlator h1 {
	font-size: 1.5vw;
}

.carcurlator p {
	font-size: .8vw;
}

@media ( max-width : 1280px ) {
	body {
		overflow-x: hidden;
	}
	.btn_box {
		margin-top: 6.2%;
		margin-left: 1%;
	}
	.slidebox {
		margin-top: 10.8%;
		margin-left: 1%;
		height: 50%;
	}
	.blur_box_left {
		height: 50%;
	}
	.blur_box_right {
		height: 50%;
	}
	.slider {
		margin-left: 1%;
	}
	.roombox {
		height: 65%;
	}
	.checkout_room {
		margin-left: 1%;
	}

	.slide_btn {
		margin-left: 0%;
		width: 800px;
	}
	.slide_left {
		margin-left: 6%;
		margin-top: 24%;
	}
	.slide_right {
		margin-top:-5%;
		margin-left: 80%;
	}
	.remaining_div {
		height: 95%;
		margin-top: 5.5%;
	}
	.roombox {
		height: 82%;
	}
}

@media ( max-width :450px) {
	.btn_box {
		width:80%;
		margin-top: 21.5%;
	}
	.btn_box button {
		font-size: 13px;
		padding: 9px;
	}
	.slidebox {
		margin-top: 30%;
		width: 400;
		height: 25%;
	}
	.imgbox img {
		width: 200;
	}
	.slide_btn {
		margin-top: 48%;
		width: 100%;
		height: 10%;
	}
	.slide_btn button {
		font-size: 15px;
		margin-top: 0;
	}
	.slide_right {
		margin-left: 71%;
	}
	.blur_box_left {
		height: 25%;
		width: 100px;
	}
	.blur_box_right {
		margin-left: 300;
		width: 100;
		height: 25%;
	}
	.slider {
		width: 400;
		height: 7%;
	}
	.slider img {
		width: 38px;
		height: 40px;
	}
	.roombox {
		height: 60%;
		width: 80%;
		display: block;
		margin-top: 35%;
		margin-left: 10%;
	}
	.roombox h1 {
		font-size: 1em;
	}
	.roombox p {
		font-size: 0.8em;
	}
	.roombox input {
		height: 24px;
	}
	.room_select {
		height: 24px;
	}
	.room_select {
		height: 24px;
		font-size: 13;
	}
	.room_dropbox div {
		height: 24px;
		font-size: 13;
	}
	.room2 {
		margin-top: 24;
	}
	.room3 {
		margin-top: 48;
	}
	.person_select {
		height: 24px;
		font-size: 13;
	}
	.person_dropbox div {
		height: 24px;
		font-size: 13;
	}
	.person2 {
		margin-top: 24;
	}
	.person3 {
		margin-top: 48;
	}
	.person4 {
		margin-top: 72;
	}
	.ui-datepicker {
		font-size: 15px;
		width: 200;
	}
	.carcur_btn {
		font-size: 10;
		margin-left: 45%;
		margin-top: 80%;
		display: block;
	}
	.carcurlator {
		display: block;
		margin-left: 15%;
		margin-top: 47%;
		width: 70%;
	}
	.carcurlator h1 {
		font-size: 2em;
	}
	.carcurlator p {
		font-size: 0.7em;
	}
	.remaining_div {
		margin-left: 46%;
		width: 50%;
		margin-top: 18%;
		height: 85%;
		z-index:101;
	}
	.remaining_table {
		margin-top: 13%;
		font-size: 11px;
	}
	.remaining_btn {
		font-size: 12px;
	}
	.nav-body {
		width: 110%;
		height: 110%;
	}

}



</style>
<script>
var room;
$(document).ready(function(){
	var cur_room="room1";
	var margin=0;
	var sw=true;
	var listcnt=0;
	var curimgnum=0;
	var slidesw=true;
	var pay;
	
	// 머무르는 기간 함수
	function staydate(){
		var checkin_month=$('#s_startdate').val().substring(5,7);
		var checkin_day=$('#s_startdate').val().substring(8,10);
		var checkout_month=$('#s_enddate').val().substring(5,7);
		var checkout_day=$('#s_enddate').val().substring(8,10);
		var imsi=Number(checkout_day); //형변환 임시변수
		var leftmargin=0; //슬라이드 마진 변수
		
		
		if(checkin_month!=checkout_month){
			if(checkin_month=='01'||checkin_month=='03'){
				return 31-checkin_day+imsi;
			}else if(checkin_month=='02'){
				if($('#s_startdate').val().substring(0,4)%400==0){
			
					return 29-checkin_day+imsi;
					
				}else{
			
					return 28-checkin_day+imsi;
				}
			}else{
				
				return 30-checkin_day+imsi;
			}
		}else{
			return checkout_day-checkin_day;
		}
		
		
	}
	$('.remaining_div h3').click(function(){
		$('.remaining_div').fadeOut();
	})
	6
		//데이트피커
	        $.datepicker.regional['ko'] = {
			 changeMonth: false, 
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	  dateFormat: "yy-mm-dd",
	    	  minDate:1,
              maxDate:31,
          };
	 $.datepicker.setDefaults($.datepicker.regional['ko']);
	var currentDate = new Date();
	currentDate.setDate(currentDate.getDate()+1);
    $('#s_startdate').datepicker();
    $("#s_enddate").datepicker( "option", "minDate", 31 );
    $('#s_startdate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#s_enddate").datepicker( "option", "minDate", selectedDate );
    });
	$( "#s_startdate" ).datepicker( "setDate", currentDate);
    $('#s_enddate').datepicker();
    $('#s_enddate').datepicker("option", "minDate", $("#s_startdate").val());
    $('#s_enddate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#s_startdate").datepicker( "option", "maxDate", selectedDate );
    });
	$( "#s_enddate" ).datepicker( "setDate", 2);
	

	//기본 룸 세팅
	roomselect("room1");
	//룸 선택 버튼 클릭 함수
		$('.btn_box button').click(function(){
			$('.btn_box button').css({'background':'#2c4162'});
			$(this).css({'background':'salmon'});
			margin=0;
			$('.imgbox').stop().animate({'margin-left':margin+'%'},500);
			cur_room=$(this).prop('id');
			curimgnum=0;
			roomselect(cur_room);
			$('.remaining_div').fadeOut('slow');
			
		})
	function calendar(){
		calform.submit();
	}
});

/* $(".calbtn").click(function(){
	var s_startdate = $("#s_startdate").val();
	var s_enddate = $("#s_enddate").val();
	$.ajax({
		type : "post",
		url : "membersche",
		data : {
			"s_startdate" : s_startdate,
			"s_enddate" : s_enddate},
		dataType : "json",
		success : function(result){
			console.log("성공");
		}error : function(result){
			console.log("다시 시도해주세요");
			return false;
		}
	})
}) */


function calplace(){
	location.href="allplace";
}

</script>
<style>
.test{
	float:right;
}
</style>
</head>
<body>
<div class="roombox">
<form action="membersche" name="calform" method="post">
  <p>체크인 </p><input type="text" name="s_startdate" id="s_startdate" readonly="readonly">
  <p>체크아웃 </p><input type="text" name="s_enddate" id="s_enddate" readonly="readonly">
  <input type="hidden" name="m_id" value="${sessionScope.loginId}">
  <br><br>
  <button onclick="calendar()" class="calbtn" class="room_submit"> 확인 </button>
</form>

</div>
gg:${sche}
<c:if test="${sche != null}">
<div class="test">
		<form action="allplace" method="post">
	<c:forEach begin="1" end="${sche.s_count}" step="1" varStatus="status">
	     <p>day ${status.index}</p>
	     <button type="submit">장소추가</button>
	</c:forEach>
	     <input type="hidden" name="s_c_day1" value="${sche.s_c_day1}">
	     <input type="hidden" name="s_c_day2" value="${sche.s_c_day2}">
	     <input type="hidden" name="s_c_day3" value="${sche.s_c_day3}">
	     <input type="hidden" name="s_c_day4" value="${sche.s_c_day4}">
	     <input type="hidden" name="s_c_day5" value="${sche.s_c_day5}">
	     <input type="hidden" name="s_c_x" value="${sche.s_c_x}">
	     <input type="hidden" name="s_c_y" value="${sche.s_c_y}">
	     <input type="hidden" name="s_num" value="${sche.s_num}">
	     <input type="hidden" name="s_c_num" value="${sche.s_c_num}">
	     <input type="hidden" name="s_count" value="${sche.s_count}">
		</form>
</div>
</c:if>



</body>
</html>
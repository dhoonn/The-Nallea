<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
$(document).ready(function(){
	
	// 리뷰작성
	$("#Btn").click(function(){
		
		//폼데이터 선언
		var formData =  new FormData();
		
		var inputFile = $("input[name='frfile']");
		
		var files = inputFile[0].files;
		
		for(var i = 0; i < files.length; i++){
			
			formData.append("frfile",files[i]);
		}
		
		// 작성자 선언
		var f_r_m_id = $("#f_r_m_id").val();
		
		// 작성할 제목
		var f_r_title = $("#f_r_title").val();
		
		// 작성할 내용
		var f_r_contents = $("#f_r_contents").val();
		
		// 작성 번호
		var f_num = "${fDTO.f_num}";
		
		
		formData.append("f_r_m_id", $("#f_r_m_id").val());
		formData.append("f_r_title", $("#f_r_title").val());
		formData.append("f_r_contents", $("#f_r_contents").val());
		formData.append("f_num", ${fDTO.f_num});
		
		$.ajax({
			type : "POST",
			url : "freview/freviewwrite",
			data : formData,
			dataType : "json",
			processData: false,
			contentType: false,
			success : function(result){
				console.log("리뷰성공");
				console.log(result);
				
				var output = "<table border='1'>";
				output += "<tr><th>작성자</th>";
				output += "<th>제목</th>";
				output += "<th>내용</th>";
				output += "<th>사진</th></tr>";
				for(var i in result){
					output += "<tr>";
					output += "<td>"+result[i].f_r_m_id+"</td>";
					output += "<td>"+result[i].f_r_title+"</td>";
					output += "<td>"+result[i].f_r_contents+"</td>";
					output += "<td>"+result[i].frfile+"</td>";
					output += "</tr>";
				}
				output +="</table>";
				$("#fReviewArea").html(output);
				$("#f_r_m_id").val("");
				$("#f_r_contents").val("");
				
			},
			error : function(){
				console.log("리뷰실패");
			}
		});
	});
	
});
</script>
<body>

	<h2>foodview입니다.</h2>
	<table>
		<tr>
			<th>이름</th>
			<th>설명</th>
			<th>주소</th>
			<th>식당 번호</th>
			<th>식당 메인 사진</th>
			
		</tr>
		<tr>
			<td>${fDTO.f_name}</td>
			<td>${fDTO.f_contents}</td>
			<td>${fDTO.f_address}</td>
			<td>${fDTO.f_num}</td>
			<td>${fDTO.f_photo}</td>

		</tr>
	</table>


	
	<form enctype="multipart/form-data" method="post">
		
			<input type="hidden" id="f_r_m_id" value="${sessionScope.loginId}"
				readonly><br> <input type="hidden" name="f_num"
				id="f_num" value="${fDTO.f_num}" readonly> 제목 : <input
				type="text" id="f_r_title" name="f_r_title"><br> 내용 : <input
				type="text" id="f_r_contents" name="f_r_contents"><br>
			사진 : <input type="file" name="frfile" id="frfile"><br>
			<input type="button" id="Btn" value="리뷰 입력">
			
		</form>
			
		

	<div id="fReviewArea">
		<table border='1'>
			<tr>
				<th>작성자</th>
				<th>제목</th>
				<th>내용</th>
				<th>사진</th>
				<c:forEach var="freview" items="${fReviewview}">
					<tr>
						<td>${freview.f_r_m_id}</td>
						<td>${freview.f_r_title}</td>
						<td>${freview.f_r_contents}</td>
						<td><img src="${pageContext.request.contextPath}/resources/profile/${freview.f_r_photo}"
						width="200" height="200"></td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</div>


</body>
</html>
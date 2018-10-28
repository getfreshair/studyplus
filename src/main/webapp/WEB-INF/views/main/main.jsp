<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Study Plus</title>
</head>
<body>
	<div>
		<div class="topArea">
			<jsp:include page="./area/mainTop.jsp"/>
		</div>
		<div class="bodyArea">
			<button onclick="location.href='insertMemberPage.me'">회원가입 페이지 이동</button>
		</div>
		<div class="bottomArea">
			<button onclick="location.href='studyGroupMainPage.sg'">스터디 그룹 메인으로 이동</button>
		</div>
	</div>
	
</body>
</html>
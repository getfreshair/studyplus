<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study Group Page</title>
<style>
	html, body {
		width:100%;
		height:100%;
	}
	.studyGroup {
		width:1200px;
		margin:0 auto;
		background:#F8F8F8;
	}
	.SGArea {
		width:100%;
		margin:0 auto;
	}
	.SGHeaderArea {
		width:100%;
	}
	.SGContentArea {
		width:100%;
	}
</style>
</head>
<body>
	<div class="studyGroup">
		<div class="SGArea">
			<div class="SGHeaderArea">
				<jsp:include page="./groupHeaderPart/groupHeader/SGHeader.jsp"/>
			</div>
			<div class="SGContentArea">
				<jsp:include page="./groupMainPart/studyGroupMainBody.jsp"/>
			</div>
		</div>
	</div>
</body>
</html>
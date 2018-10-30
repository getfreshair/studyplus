<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study Group Page</title>
<!-- #### CSS FILES ### -->
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<!-- #### JAVASCRIPT FILES ### -->
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<style>
	html, body{
		width:100%;
		height:100%;
		background:#F8F8F8;
	}
	.studyGroup {
		width:1200px;
		margin:0 auto;
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
	.SGInsertArea {
		width:100%;
		display:none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="studyGroup">
		<div class="SGArea">
			<div class="SGHeaderArea">
				<jsp:include page="./groupHeaderPart/groupHeader/SGHeader.jsp"/>
			</div>
			<div class="SGContentArea">
				<jsp:include page="./groupMainPart/studyGroupMainBody.jsp"/>
			</div>
			<div class="SGInsertArea"></div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.SGMainLeftArea {
		display:inline-block;
		margin-top:5px;
	}
	.SGMainRightArea {
		position: absolute;
		display:inline-block;
		margin-top:5px;
	}
</style>
</head>
<body>
	<div class="SGMainArea">
		<div class="SGMainLeftArea">
			<jsp:include page="./groupMainBody/SGMainBodyLeft.jsp"/>
		</div>
		<div class="SGMainRightArea">
			<jsp:include page="./groupMainBody/SGMainBodyRight.jsp"/>
		</div>
	</div>
</body>
</html>
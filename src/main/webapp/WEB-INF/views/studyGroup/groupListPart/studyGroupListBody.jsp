<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.studyGroupRealTimeRankArea {
		margin-bottom:5px;
	}
</style>
</head>
<body>
	<div>
		<div class="studyGroupRealTimeRankArea">
			<jsp:include page="./groupList/studyGroupRealTimeRank.jsp"/>
		</div>
		<div class="studyGroupListArea">
			<jsp:include page="./groupList/studyGroupList.jsp"/>
		</div>
	</div>
</body>
</html>
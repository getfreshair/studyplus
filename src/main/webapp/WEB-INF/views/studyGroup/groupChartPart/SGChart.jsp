<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- #### CSS FILES ### -->
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<!-- #### JAVASCRIPT FILES ### -->
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<style>
	html, body {
		height:100%;
	}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<div class="chartForm">
		<div>
			<jsp:include page="./SGCategoryChart/SGCategoryChart.jsp"/>
		</div>
		<div>
			<jsp:include page="./SGLocationChart/SGLocationChart.jsp"/>
		</div>
		<div>
			<jsp:include page="./SGTImeZoneChart/SGTImeZoneChart.jsp"/>
		</div>
		<div>
			<jsp:include page="./SGTimeAmountChart/SGTimeAmountChart.jsp"/>
		</div>
	</div>
</body>
</html>
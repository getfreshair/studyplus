<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.adminContentArea {
		width:1584px;
		float:left;
	}
	.leftSideArea {
		width:250px;
		z-index:10 !important;
	}
	.adminBody {
		width:1334px;
		float:left;
		background:blue;
	}
</style>
</head>
<body>
	<div class="adminArea">
		<div class="headerArea">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div class="adminContentArea">
			<div class="leftSideArea">
				
				<jsp:include page="sidemenu.jsp"></jsp:include>
			</div>
			<div class="adminBody">
				<jsp:include page="content.jsp"></jsp:include>
			</div>
		</div>
	</div>

</body>
</html>
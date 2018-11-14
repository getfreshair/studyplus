<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
		height:100%;
		z-index:10 !important;
	}
	.adminBody {
		width:1334px;
		float:left;
		background:#F0F0F0;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
			<div class="adminBody" id="body">
				<script>
				$(function() {
					$.ajax({
						url:"mainStatic.do",
						type:"get",
						success:function(data){
							$("#body").append(data);
						},
						error:function(){
							console.log("에러 발생!");
						}
					})
				});
				</script>
			<%-- 	<jsp:include page="content.jsp"></jsp:include> --%>
			</div>
		</div>
	</div>

</body>
</html>
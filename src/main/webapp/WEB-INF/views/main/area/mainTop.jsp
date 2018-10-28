<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:choose>
		<c:when test="${ empty sessionScope.loginUser }">
			<form action="login.me" method="POST">
				<input type="text" name="member_Id">아이디
				<input type="text" name="member_Pwd">비밀번호
				<button type="submit">로그인</button>
			</form>
		</c:when>
		<c:when test="${ !empty sessionScope.loginUser }">
			<c:out value="${ sessionScope.loginUser.member_Nickname }"/>
			<img src="${ contextPath }/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}"/>
			
			<c:forEach var="list" items="${sessionScope.loginUser.category_Name}" end="${fn:length(sessionScope.loginUser.category_Name)}" begin="0">
				${list.category_Name}
			</c:forEach>
			<button onclick="location.href='logout.me'">로그아웃</button>
		</c:when>
	</c:choose>
</body>
</html>
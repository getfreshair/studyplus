<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<style>
.notice{
	position:relative;
	width:1200px;
	margin:0 auto;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="notice">
		<h2>공지사항</h2>
		<hr>
		<table class="tbl-type02">
			<thead>
				<tr class="head">
					<th width="8%">게시물번호</th>
					<th width="15%">제목</th>
					<th width="10%">작성자</th>
					<th width="15%">작성일</th>
					<th width="5%">조회수</th>
					<th width="25%">내용</th>
			    </tr>
		    </thead>
		    <tbody>
			<c:forEach items="${data.list}"  var="noticeList" >
				<c:if test="${noticeList.NOTICE_STATUS eq 0}">
				<tr>
					<td>${noticeList.NOTICE_CODE}</td>
					<td>${noticeList.NOTICE_TITLE}</td>
					<td>관리자</td>
					<td>${noticeList.NOTICE_ENROLLDATE}</td>
					<td>${noticeList.NOTICE_COUNT}</td>
					<td>${noticeList.NOTICE_CONTENT}</td>
				</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
			<div id="pagingArea" align="center">
			<c:if test="${data.pi.currentPage <= 1}">
				[이전] &nbsp;
			</c:if>
			<c:if test="${data.pi.currentPage > 1}">
				<c:url var="blistBack" value="/getNoticeList.do">
					<c:param name="currentPage" value="${data.pi.currentPage - 1}"/>
					<c:param name="option" value="${data.option }"/>
					<c:param name="keyword" value="${data.keyword }"/>
				</c:url>
				<a href="${ blistBack }">[이전]</a>
				
			</c:if>
			
			<c:forEach var="p" begin="${data.pi.startPage}" end="${data.pi.endPage}">
				<c:if test="${p eq data.pi.currentPage }">
					<font color ="red" size="4"><b>[${p}]</b></font>
				</c:if>
				<c:if test="${p ne data.pi.currentPage }">
					<c:url var="blistCheck" value="getNoticeList.do">
						<c:param name="currentPage" value="${p}"/>
						<c:param name="option" value="${data.option }"/>
						<c:param name="keyword" value="${data.keyword }"/>
					</c:url>
					<a href="${blistCheck}">${p}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${data.pi.currentPage >= data.pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${data.pi.currentPage < data.pi.maxPage}">
				<c:url var="blistEnd" value="getNoticeList.do">
					<c:param name="currentPage" value="${data.pi.currentPage + 1}"/>
					<c:param name="option" value="${data.option }"/>
					<c:param name="keyword" value="${data.keyword }"/>
				</c:url>
				&nbsp;
				<a href="${blistEnd}">[다음]</a>
			</c:if>
		</div>
	</div>
</body>
</html>
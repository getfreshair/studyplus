<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/*	그룹원 리스트 - 회원 표시 영역 -> 메인에 작성 */
  .memberOneWrapArea { width:263px; }
	.memberInfo3 { margin:10px 0px; width:100%; }
	  .memberInfo3 td { padding-left:7px; text-align:left; }
	   .emptyZone { width:50px; }
	   .emptyZone div { width:100%; }
	   .dayMenu	{ width:30px; font-size:9px; line-height:1.2; word-break:break-all; padding-left:2px !important; text-align:center !important; cursor:default; }
	    .timeStickTbl td { padding-left:3px; }
	    .timeStickTbl table { width:100%; }
		    .memberTimeAera { width:100%; padding:1.5px 0px; text-align:center; background:lawngreen; border-radius:3px; }
			.memberTimeTotal{ /* z-index:999; width:100%; height:100%; */ letter-spacing:-0.4px; font-size:7px; font-weight:bold; }	
</style>

</head>
<body>
	<div class="timeTotalPageWrap">
		<div>
		</div>
		<div class="memberListArea">
			<div class="memberOneWrapArea">
				<table class="memberInfo3">
					<tr>
						<td><div class="emptyZone"><div></div></div></td>					
						<td class="dayMenu"><strong>SUN</strong></td>
						<td class="dayMenu" style="letter-spacing:-1px;"><strong>MON</strong></td>
						<td class="dayMenu"><strong>TUE</strong></td>
						<td class="dayMenu"><strong>WED</strong></td>
						<td class="dayMenu"><strong>THU</strong></td>
						<td class="dayMenu"><strong>FRI</strong></td>
						<td class="dayMenu"><strong>SAT</strong></td>
					</tr>
				</table>
<!-- 	반복영역 -->
	  		  <c:forEach var="i" items="${list}">	
				<table class="memberInfo3">
					<tr>							
						<td rowspan="2">
							<div class="profImg">
							<img src="${ contextPath }/resources/upload/member/thumbnail/${i.FILES_NAME}" />
							</div>
						</td>
						<td class="nickName"><strong>${i.MEMBER_NICKNAME}</strong></td>
					</tr>
					<tr class="timeStickTbl"><td style="width:100%; padding-left:0px;">
						<table>
							<tr>	
								<td><div class="memberTimeAera">
									<div class="memberTimeTotal">00:00</div>
								</div></td>						
								<td><div class="memberTimeAera">
									<div class="memberTimeTotal">00:00</div>
								</div></td>						
								<td><div class="memberTimeAera">
									<div class="memberTimeTotal">00:00</div>
								</div></td>						
								<td><div class="memberTimeAera">
									<div class="memberTimeTotal">00:00</div>
								</div></td>						
								<td><div class="memberTimeAera">
									<div class="memberTimeTotal">00:00</div>
								</div></td>						
								<td><div class="memberTimeAera">
									<div class="memberTimeTotal">00:00</div>
								</div></td>						
								<td><div class="memberTimeAera">
									<div class="memberTimeTotal">00:00</div>
								</div></td>						
							</tr>
						</table>
					</td></tr>
				</table>
		  	  </c:forEach>
			</div>				
		</div>

	</div>
</body>

</html>
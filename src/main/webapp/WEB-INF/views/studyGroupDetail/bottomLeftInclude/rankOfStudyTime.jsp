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
    
	.timeStickAera { width:100%; position:relative; }
	   .timeStickWrap { width:100%; height:20px; background:lightgray; border-radius:15px; border:2px solid; } 
	   .timeStickBack { width:100%; height:100%; position:relative; }
		.timeStick{ /* width:50%;  */height:100%; background:lawngreen; border-radius:15px; border:2px outset; }
		.memberTime{ z-index:999; width:100%; position:absolute; text-align:center; font-size:10px; font-weight:bold; }	
</style>

</head>
<body>
	<div class="rankPageWrap">
		
		<div class="memberListArea">
			<div class="memberOneWrapArea">
<!-- 	반복영역 -->
	  		  <c:set var="num" value="1"/>
	  		  
	  		  <c:forEach var="i" items="${list}">
<%-- 	  	  <c:forEach var="i" begin="0" end="${fn:length(list) - 1}" step="1" > --%>
				<table class="memberInfo">
					<tr>							
						<td rowspan="2">
						  <c:if test="${num <= 3}">
							<div class="rankImg">
								<img width="100%" src="${ contextPath }/resources/images/studyGroupDetail/rank${num}.png" />
							</div>
						  </c:if>	
							<div class="profImg">
								<img src="${ contextPath }/resources/upload/member/thumbnail/${i.FILES_NAME}" />
<%-- 								<img src="${ contextPath }/resources/upload/member/thumbnail/${list[i].FILES_NAME}" /> --%>
							</div>
						</td>
						<td class="nickName"><strong>${i.MEMBER_NICKNAME}</strong></td>
					</tr>
					<tr><td class="timeStickAera">
						<div class="timeStickWrap">
							<div class="timeStickBack">
								<div class="memberTime">
									<c:set var="mem_Time_Hour" value="${(i.MEM_PERIOD_TOTAL / 3600)}"/>
									<c:set var="mem_Time_Min" value="${(i.MEM_PERIOD_TOTAL % 3600) / 60}"/>
									<fmt:formatNumber var="mem_Time_H" value="${mem_Time_Hour - (mem_Time_Hour % 1)}" pattern="#00"/>
									<fmt:formatNumber var="mem_Time_M" value="${mem_Time_Min - (mem_Time_Min % 1)}" pattern="00"/>
									<fmt:formatNumber var="mem_Time_Sec" value="${(i.MEM_PERIOD_TOTAL % 3600) % 60}" pattern="00"/>
									${mem_Time_H}:${mem_Time_M}:${mem_Time_Sec}
								</div>
								<div class="timeStick" style="width:${i.MEM_TOTAL_RATIO}%; <c:if test="${i.MEM_TOTAL_RATIO <= 2}">display:none;</c:if>"></div>
							</div>
						</div>
					</td></tr>
				</table>
				<c:set var="num" value="${num + 1}"/>
	  		  </c:forEach>
			</div>				
		</div>

	</div>
</body>

</html>
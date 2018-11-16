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
 	  .memberOneWrapArea { width:263px; /* border:1px dashed red; display:inline-block; */ }
		.memberInfo { margin:10px 0px; }
		  .memberInfo td { position:relative; padding-left:12px; text-align:left; display:table-cell; vertical-align:middle; }
		   .rankImg { position:absolute; width:15px; margin-top:-8px; }
		    .rankImg img{ margin-left:37px; }
		   .profImg { width:50px; height:50px; overflow-y:hidden; border-radius:20%; }
		  	.profImg img { width:100%; }
		  .nickName	{ width:105px; height:50%; font-size:12.5px; line-height:1.2; word-break:break-all; }
/* 		    .nickName strong { vertical-align:super; } */
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
	  		  <c:forEach var="i" begin="0" end="${fn:length(list) - 1}" step="1" >	
				<table class="memberInfo">
					<tr>							
						<td rowspan="2">
							<div class="rankImg">
								<img width="100%" src="${ contextPath }/resources/upload/studygroup/thumbnail/medal.png" />
							</div>
							<div class="profImg">
								<img src="${ contextPath }/resources/upload/member/thumbnail/${list[i].FILES_NAME}" />
							</div>
						</td>
						<td class="nickName"><strong>${list[i].MEMBER_NICKNAME}</strong></td>
					</tr>
					<tr><td class="timeStickAera">
						<div class="timeStickWrap">
							<div class="timeStickBack">
								<div class="memberTime">
									<c:set var="mem_Time_Hour" value="${(list[i].MEM_PERIOD_TOTAL / 3600)}"/>
									<c:set var="mem_Time_Min" value="${(list[i].MEM_PERIOD_TOTAL % 3600) / 60}"/>
									<fmt:formatNumber var="mem_Time_H" value="${mem_Time_Hour - (mem_Time_Hour % 1)}" pattern="#00"/>
									<fmt:formatNumber var="mem_Time_M" value="${mem_Time_Min - (mem_Time_Min % 1)}" pattern="00"/>
									<fmt:formatNumber var="mem_Time_Sec" value="${(list[i].MEM_PERIOD_TOTAL % 3600) % 60}" pattern="00"/>
									${mem_Time_H}:${mem_Time_M}:${mem_Time_Sec}
								</div>
								<div class="timeStick" style="width:${list[i].MEM_TOTAL_RATIO}%; <c:if test="${list[i].MEM_TOTAL_RATIO <= 2}">display:none;</c:if>"></div>
							</div>
						</div>
					</td></tr>
				</table>
	  		  </c:forEach>
			</div>				
		</div>

	</div>
</body>

</html>
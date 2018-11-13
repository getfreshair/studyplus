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

<!-- <style>
 	.priodTabMenuArea {/*  width:100%; */ margin-right:15px; padding:0px 10px 10px 10px; /* border-bottom:1px solid gray; */ text-align:right; }
	  .priodTabMenuArea span { cursor:pointer; font-size:14px; /* font-weight:bold; */ }
	  	.prevBtn:hover, .nextBtn:hover { color:#ed876a; font-weight:bold; } -->
<style>
	  
 	  .memberOneWrapArea { width:263px; /* border:1px dashed red; display:inline-block; */ }
		.memberInfo { margin:10px 0px; }
		  .memberInfo td { position:relative; padding-left:12px; text-align:left; display:table-cell; vertical-align:middle; }
		   .rankImg { position:absolute; width:15px; margin-top:-8px; }
		    .rankImg img{ margin-left:37px; }
		   .profImg { width:50px; height:50px; overflow-y:hidden; border-radius:20%; }
		  	.profImg img { width:100%; }
		  .nickName	{ width:105px; height:50%; font-size:12.5px; font-weight:bold; line-height:1.2; word-break:break-all; }
		    .nickName strong { vertical-align:super; }
		  .timeStickAera { width:100%; position:relative; }
 		    .timeStickWrap { width:100%; height:20px; background:lightgray; border-radius:15px; border:2px solid; } 
 		    .timeStickBack { width:100%; height:100%; position:relative; }
 			.timeStick{ width:50%; height:100%; background:lawngreen; border-radius:15px; border:2px outset; }
			.memberTime{ z-index:999; width:100%; position:absolute; text-align:center; font-size:10px; font-weight:bold; }	
</style>

</head>
<body>
	<div class="rankPageWrap">
		
<!-- 	반복영역 -->
		<div class="memberListArea">
			<div class="memberOneWrapArea">
				<table class="memberInfo" border="1">
					<tr>							
						<td rowspan="2">
							<div class="rankImg">
								<img width="100%" src="${ contextPath }/resources/upload/studygroup/thumbnail/medal.png" />
							</div>
							<div class="profImg">
								<input type="hidden" id="memCode" value=""/>
								<img src="${ contextPath }/resources/upload/member/thumbnail/163428ba12e94f148ba8cc438e88d3a1" />
							</div>
						</td>
						<td class="nickName"><strong>닉네임자리</strong></td>
					</tr>
					<tr><td class="timeStickAera">
						<div class="timeStickWrap">
							<div class="timeStickBack">
								<div class="memberTime">00:00:00</div>
								<div class="timeStick"></div>
							</div>
						</div>
					</td></tr>
				</table>
			</div>				
		</div>
		

	</div>
</body>

</html>
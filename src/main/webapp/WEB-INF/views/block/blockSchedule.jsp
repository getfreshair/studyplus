<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <meta name="description" content="A schedule management with jQuery.">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule.css">
  <!--   <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule-demo.css"> -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="/studyplus/resources/dist/jquery.schedule.js"></script>
<style>
	.scheduleMenu {
		background: red !important;
	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-xs-12 col-md-3" style="float:left">
		<jsp:include page="blockSideMenu.jsp"/>
		<div align="center" style="margin-right:10px">
			<button type="button" onclick="saveScheduleData()" class="btn btn-success">시간표 저장 하기</button>
		</div>
	</div>
	<div class="col-xs-12 col-md-8" style="float:left">
         <div id="schedule4" class="jqs-demo mb-3"></div>
            <script>
            $(function(){
            	var data = "";
            	if('${scheduleData}' == 'emptyData'){
            		data = [];
            	} else {
            		data = ${scheduleData} ;
            	}
	            $('#schedule4').jqs({
	            	  periodColors: [
	            	    ['rgba(0, 0, 0, 0.5)', '#000', '#fff'],
	            	    ['rgba(200, 0, 0, 0.5)', '#f00', '#000'],
	            	    ['rgba(0, 200, 0, 0.5)', '#0f0', '#000'],
	            	    ['rgba(0, 0, 200, 0.5)', '#00f', '#000']
	            	  ],
	            	  data: data,
	            	  periodTitle: 'No title',
	            	  periodBackgroundColor: 'rgba(0, 0, 0, 0.5)',
	            	  periodBorderColor: '#000',
	            	  periodTextColor: '#fff',
	            	  periodRemoveButton: '제거하기',
	            	  periodTitlePlaceholder: '제목을 입력해주세요.'
	            	  
	            	});
            });
             
            </script>
            
            <script>
            	function saveScheduleData() {
            		var scheduleData = $("#schedule4").jqs('export');
            		$.ajax({
		                  url:"blockScheduleSave.bl",
		                  type:"post",
		                  data:{scheduleData:scheduleData},
		                  success:function(data){
		                	  alert("시간표 Data 저장 성공..");
		                  },
		                  error:function(){
		                     console.log("에러 발생!");
		                  }
		               })
		               return false; 
            	}
            </script>
</div>
</body>
</html>
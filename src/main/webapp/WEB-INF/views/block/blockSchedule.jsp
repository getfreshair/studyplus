<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

   <!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule-demo.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="/studyplus/resources/dist/jquery.schedule.js"></script>
 -->

<head>
<style>
.jqs-grid-line:before {
	left: 0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-xs-12 col-md-12" align="left">
		<div class="panel panel-default col-xs-11 col-md-11 "
			style="margin-left: 50px; margin-right: 50px">
			<div class="panel-body" align="left" style="font-weight: bold">
				시간표 차단을 설정합니다. 일부 설정은 프로그램을 재시작해야 정상 적용됩니다.</div>
		</div>

		<h4 align="left" style="display: inline-block; left: 0">
			<span style="color: red; margin-top: 20px; margin-left: 50px">*</span>
			시간표 차단 설정
		</h4>

		<button type="button"
			style="display: inline-block; margin-left: 30px; margin-bottom: 20px"
			id="scheduleSaveBtn" class="btn btn-danger" onclick="saveScheduleData();">저장 하기</button>
		<div class="col-xs-12 col-md-12" style="float: left">
			<div id="schedule4" class="jqs-demo mb-3"
				style="height: 400px; border: none"></div>
			<script>
				 $(function() {
					var scheduleChartData =[];
					 $.ajax({
							url : "selectScheduleData.bl",
							type : "get",
							success : function(data) {
								scheduleChartData = data;
							},
							error : function() {
								console.log("에러 발생!");
							}
						})
					setTimeout(function() { 
						var jsonData = JSON.parse(scheduleChartData);
						console.log(jsonData);
						$('#schedule4').jqs(
								{
									periodColors : [
											[ 'rgba(0, 0, 0, 0.5)', '#000',
													'#fff' ],
											[ 'rgba(200, 0, 0, 0.5)',
													'#f00', '#000' ],
											[ 'rgba(0, 200, 0, 0.5)',
													'#0f0', '#000' ],
											[ 'rgba(0, 0, 200, 0.5)',
													'#00f', '#000' ] ],
									data : jsonData,
									periodTitle : 'No title',
									periodBackgroundColor : 'rgba(0, 0, 0, 0.5)',
									periodBorderColor : '#000',
									periodTextColor : '#fff',
									periodRemoveButton : '제거하기',
									periodTitlePlaceholder : '제목을 입력해주세요.'

								});
						
					}, 1000)
					
				}); 
			</script>

			<script>
				function saveScheduleData() {
					
					
					var scheduleData = $("#schedule4").jqs("export");
					$.ajax({
						url : "blockScheduleSave.bl",
						type : "post",
						data : {
							scheduleData : scheduleData
						},
						success : function(data) {
							alert("시간표 Data 저장 성공..");
						},
						error : function() {
							console.log("에러 발생!");
						}
					})
					return false;
				}
			</script>
		</div>
	</div>
</body>
</html>
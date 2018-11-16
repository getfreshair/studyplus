<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.adminContentArea {
	width: 1584px;
	float: left;
}

.leftSideArea {
	width: 250px;
}
.adminBody {
	width: 1334px;
	float: left;
	background: #F0F0F0;
}
.content{
		float:left;
		width:1330px;
		height:1000px;
		padding-left:20px;
		padding-top:20px;
}
hr{
	border-top: 1px solid gray !important;
}
</style>
</head>
<body>
	<div class="adminArea">
		<div class="headerArea">
			<jsp:include page="../header.jsp"></jsp:include>
		</div>
		<div class="adminContentArea">
			<div class="leftSideArea">
				<jsp:include page="../sidemenu.jsp"></jsp:include>
			</div>
			<div class="adminBody">
				<div class="content">
					<h2>SMS발송</h2>
					<hr>
					<br>
					<br>
					<hr>
					<form action="smssend.do" method="get">
					<div class="first-div" style="display:inline-block">
						<p class="receiveNum" style="margin-top:5px; margin-left:350px;display:inline-block;">수신 번호</p>
						<input class="form-control" type="text" name="rphone" value="011-111-1111" id="receiveNum"
										style="width:300px; height:50px; font-size:20px;margin-left:50px;display:inline-block;">
					</div>
					<hr style="width:600px; align:left">
					<div class="second-div" style="display:inline-block">
						<label class="message" style=" margin-left:354px; margin-top:80px;float:left">메세지</label>
						
						
						<textarea name="msg" class="form-control" rows="8" style="width:300px; margin-left:71px; display:inline-block;" id="comment"></textarea>
					</div>
					<hr style="width:600px;align:left">
						<input type="hidden" name="sphone1" id="phone1" value="010">
     				    <input type="hidden" name="sphone2" id="phone2"value="6551">
        			   <input type="hidden" name="sphone3" id="phone3"value="5979">
					<button type="submit" class="btn btn-primary" id="searchBtn"
								 style="font-size:14px; padding-down:30px; margin-left:550px;margin-bottom:8px; display:inline-block;height:35px;">보내기</button>
					<button class="btn btn-primary" id="cancel"
								name="cancel1" style="font-size:14px; padding-down:30px; margin-left:20px; margin-bottom:8px; display:inline-block;height:35px;">취소</button>
					</form>
				<!-- 	<script>
					function send(){
						var rphone = $("#receiveNum").val();
						var msg = $("#comment").val();
						var sphone1 = $("#phone1").val();
						var sphone2 = $("#phone2").val();
						var sphone3 = $("#phone3").val();
						
						location.href = "smssend.do?rphone="+rphone + "msg=" +msg +"sphone1="+sphone1+"sphone2="+sphone2+"sphone3="+sphone3; 
					}
					</script> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>
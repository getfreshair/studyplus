<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     
<%
	String activeCheck = request.getRequestURL().toString();
	System.out.println(activeCheck);
	activeCheck = activeCheck.substring(46,activeCheck.lastIndexOf("/"));
	System.out.println(activeCheck);
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.1/css/all.css' integrity='sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz' crossorigin='anonymous'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	#accordian {
	float:left;
	background: #333333;
	width: 250px;
	margin: auto auto 0 auto;
	color: white;
	height:1000px;
	box-shadow: 
		0 0px 0px 1px rgba(0, 0, 0, 0.6), 
		0 0 200px 1px rgba(255, 255, 255, 0.5);
}

/* 메뉴 스타일 */
#accordian h3 {
	font-size: 20px;
	letter-spacing:5px;
	text-align:center;
	line-height: 45px;
	padding: 0px 5px;
	cursor: pointer;
	background: #727272;
	background: linear-gradient(#727272, #002535);
	
	z-index:50 !important;
}
#accordian h3:hover {
	text-shadow: 0 0 1px rgba(255, 255, 255, 0.7);
}

/* 아이콘폰트 스타일 */
#accordian h3 span {
	font-size: 25px;
	margin-right: 10px;
}
#accordian li {
	list-style-type: none;
}

#accordian ul:first-child {
	padding:0px;
}

/* 서브메뉴 스타일 */
#accordian ul ul li a {
	color: white;
	text-decoration: none;
	font-size: 17px;
	line-height: 27px;
	display: block;
	padding: 0 15px;
	-webkit-transition: all 0.15s;
	-moz-transition: all 0.15s;
	-o-transition: all 0.15s;
	-ms-transition: all 0.15s;
	transition: all 0.15s;
}
#accordian ul ul li a:hover {
	background: #003545;
	border-left: 5px solid #09c;
}

/* active 클래스 외에 것은 보이지 않게 하기 */
#accordian ul ul {
	display: none;
}
#accordian li.active ul {
	display: block;
}
h3:hover i{
	color:gray;
}
#ad{
display:none;
	opacity:0 !important;
	
}

</style>
<script>
	$(function() {
		$("#accordian h3").click(function() {
			$("#accordian ul ul").slideUp();
			if (!$(this).next().is(":visible")) {
				$(this).next().slideDown();
			}
		})
	})

	function goPage(page) {
		location.href = "movePage.me?page=" + page;
	}
</script>
</head>
<body>
	<nav>
	
	<div id="accordian">
	<div id="inform" style="height:170px; width:250px; background:white url('resources/images/admin/sideCalcul.png') 100% bottom no-repeat; float:left; display:inline-block">
		<img src = "resources/images/admin/heart.png" style = "margin-left:10px ; margin-top:40px;display:inline-block;">
		<p style="color:black; display:inline-block; font-size:20px">안녕하세요!</p>
		<br>
	</div>
	<iframe scrolling="no" frameborder="no" clocktype="html5" style=" z-index:999; overflow:hidden;border:0;margin:0;padding:0;width:250px;height:100px;"src="https://www.clocklink.com/html5embed.php?clock=044&timezone=JST&color=white&Title=&Message=&Target=&From=2018,1,1,0,0,0&Color=white"></iframe>
	<ul style="padding-left:0">
		
		<li>
			<i class='fas fa-home' style='font-size:24px; float:left; margin-left:5px ;margin-top:10px;'></i>
			<h3 onclick="goPage('admin/home')">홈</h3>
		</li>
		
		<li <%-- <% if ( activeCheck.equals("memberManage")){ %>
		class="active"
		<%} %> --%>
		>
			<i class='fas fa-male' style='font-size:24px; float:left; margin-left:12px ;margin-top:10px;'></i>
			<h3>회원관리<i class='fas fa-angle-down' style='font-size:24px ; margin-left:50px;'></i></h3>
			<ul>
				<li><a onclick="goPage('admin/memberManage/memberList')">회원관리</a></li>
				<li><a onclick="goPage('admin/memberManage/memberPenalty')">제재회원관리</a></li>
				<li><a onclick="goPage('admin/memberManage/memberDispause')">휴면회원관리</a></li>
			</ul>
		</li>
		<li <%-- <% if ( activeCheck.equals("boardManage")){ %>
		class="active"
		<%} %> --%>
		>
			<i class='fas fa-clipboard' style='font-size:24px; float:left; margin-left:5px ;margin-top:10px;'></i>
			<h3>게시판관리<i class='fas fa-angle-down' style='font-size:24px; margin-left:22px;'></i></h3>
			<ul>
				<li><a href ='getNoticeList.do'>공지사항</a></li>
				<li><a href ='getGroupBoardList.do'>게시판관리</a></li>
			</ul>
		</li>
		<li <%-- <% if ( activeCheck.equals("groupManage")){ %>
		class="active"
		<%} %> --%>
		>
			<i class='fa fa-group' style='font-size:24px; float:left; margin-left:5px ;margin-top:10px;'></i>
			<h3>스터디그룹<i class='fas fa-angle-down' style='font-size:24px; margin-left:19px;'></i></h3>
			<ul>
				<li><a onclick="goPage('admin/groupManage/groupList')">그룹 관리</a></li>
			</ul>
		</li>
		<li <%-- <% if ( activeCheck.equals("bannerManage")){ %>
		class="active"
		<%} %> --%>
		>
			<i class='fas fa-ad' style='font-size:24px; float:left; margin-left:5px ;margin-top:10px;'></i>
			<h3>광고관리<i class='fas fa-angle-down' style='font-size:24px; margin-left:45px;'></i></h3>
			<ul>
				<li><a href='getPRList.do'>광고등록</a></li>
				<li><a onclick="goPage('admin/bannerManage/selectBanner')">광고내역보기</a></li>
			<!-- 	<li><a onclick="goPage('admin/groupManage/groupList')">입금계좌관리</a></li> -->
			</ul>
		</li>
		<li <%-- <% if ( activeCheck.equals("rewardManage")){ %>
		class="active"
		<%} %> --%>
		>
			<i class='fas fa-gift' style='font-size:24px; float:left; margin-left:5px ;margin-top:10px;'></i>
			<h3>지급관리<i class='fas fa-angle-down' style='font-size:24px; margin-left:45px;'></i></h3>
			<ul>
				<li><a href='getSingleRewardList.do'>개인지급관리</a></li>
				<li><a href='getGroupRewardList.do'>그룹지급관리</a></li>
			</ul>
		</li>
		<li <%-- <% if ( activeCheck.equals("smsManage")){ %>
		class="active"
		<%} %> --%>
		>
			<i class='far fa-comment' style='font-size:24px; float:left; margin-left:5px ;margin-top:10px;'></i>
			<h3>SMS관리<i class='fas fa-angle-down' style='font-size:24px; margin-left:38px;'></i></h3>
			<ul>
				<li><a onclick="goPage('admin/smsManage/smsSend')">SMS발송</a></li>
				<li><a onclick="goPage('admin/smsManage/smsHistory')">SMS발송내역</a></li>
				<!-- <li><a onclick="goPage('admin/smsManage/smsSetting')">SMS환경설정</a></li> -->
			</ul>
		</li>
		<li<%--  <% if ( activeCheck.equals("statisticsManage")){ %>
		class="active"
		<%} %> --%>
		>
			<i class='far fa-chart-bar' style='font-size:24px; float:left; margin-left:5px ;margin-top:10px;'></i>
			<h3> 통계<i class='fas fa-angle-down' style='font-size:24px; margin-left:96px;'></i></h3>
			<ul>
				<li><a href="getMemberStatic.do">회원통계</a></li>
				<li><a href="getContactStatic.do">접속자통계</a></li>
				<li><a href="getStudygroupStatic.do">스터디그룹통계</a></li>
				<li><a href="getBannerStatic.do">광고매출통계</a></li>
			</ul>
		</li>
	</ul>
</div>
</nav>
</body>
</html>
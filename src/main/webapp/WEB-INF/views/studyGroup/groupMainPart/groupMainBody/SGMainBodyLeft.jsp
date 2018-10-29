<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.SGMainBodyLeftArea {
		width:857px;
	}
	.adArea img {
		width:860px;
		height:150px;
	}
	.inSGArea {
		box-shadow: 0px 5px 5px 0px #D8D8D8;
		margin-bottom:7px;
		background:white;
	}
	.inSGArea:first-child {
		border-top-right-radius:0px;
		border-top-left-radius:0px;
	}
	.inSGImgArea {
		display:inline-block;
	}
	.inSGArea:first-child .inSGImgArea img:first-child {
		border-top-left-radius:0px;
	}
	.inSGImgArea img {
		width:300px;
		height:217px;
	}
	.inSGInfoArea {
		margin-left:10px;
		margin-right:10px;
		position: absolute;
		display:inline-block;
	    width:538px;
	    text-align:center;
	}
	.inSGTitle {
		display:inline-block;
		width:100%;
		padding-top:10px;
	}
	.inSGTitle h4 {
		display:inline-block;
		background:#FCCE00;
		border-radius:8px;
		padding-left:20px;
		padding-right:20px;
		margin-top:5px;
		margin-bottom:5px;
		font-size:15px;
		font-weight:bold;
		padding-top:3px;
    	padding-bottom:3px;
	}
	.inSGTitle img {
		width:25px;
		height:25px;
		margin-bottom:4px;
	}
	.inSGIntro {
		font-size: 12px;
	    width: 100%;
	    color: #3D3D3D;
	    text-align: center;
	}
	.inSGEnrolldate, .inSGDate {
		display: inline-block;
    	margin-top: 5px;
    	width: 266px;
    	font-size: 12px;
    	font-weight: bold;
	}
	.inSGJoinTime {
		display:inline-block;
		background:white;
		margin-top:5px;
		width:145px;
		padding:3px;
		border-radius:7px;
		font-weight:bold;
		font-size:12px;
		margin-right:3px;
		overflow:hidden;
	}
	.inSGAim {
		position:relative;
		display:inline-block;
		background:lightgray;
		margin-top:5px;
		width:374px;
		border-radius:7px;
		font-size:12px;
		margin-right:4px;
		text-align: left;
		overflow:hidden;
		height:22px;
	}
	.inSGAimProgress {
		position:absolute;
		display:inline-block;
		background:#FCCE00;
		border-radius:7px;
		padding:3px;
		width:86%;
		font-size:12px;
		margin-right:4px;
		height:22px;
	}
	.inSGAimPercent {
		position:absolute;
		width:374px;
		text-align:center;
		margin-top:3px;
	}
	.inSGUserImage {
		display:inline-block;
	}
	.inSGUserImage img {
		width:28px;
		height:28px;
		border-radius:50%;
	}
	.inSGUserImage img:hover {
		cursor:pointer;
	}
	.inSGUserImageArea {
		width: 543px;
    	display: inline-block;
    	font-size: 12px;
	}
	.inSGuserInfo {
		font-weight:bold;
		padding-bottom: 5px;
	}
	.SGListChangeUl {
		width:860px;
		list-style:none;
		display:inline-block;
		margin:0px;
		padding:0px;
		font-size:12px;
		padding-top:7px;
		padding-bottom:7px;
	}
	.SGListChangeUl li {
		float:left;
		width:286px;
		text-align:center;
		cursor:pointer;
	}
	.SGListChangeUl li:first-child {
		border-right:1px solid gray;
		font-weight:bold;
	}
	.SGListChangeUl li:last-child {
		border-left:1px solid gray;
	}
	.inMySGListArea, .recommendationSGListArea {
		display:none;
	}
</style>
<script>
	function changeGroupList(page){
		if(page == 'inSGListArea') {
			$('.SGListChangeUl li').css('font-weight', 'unset');
			$('.SGListChangeUl li:first-child').css('font-weight', 'bold');
			$('.inSGListArea').css('display', 'block');
			$('.inMySGListArea').css('display', 'none');
			$('.recommendationSGListArea').css('display', 'none');
		}else if(page == "inMySGListArea") {
			$('.SGListChangeUl li').css('font-weight', 'unset');
			$('.SGListChangeUl li:nth-of-type(2)').css('font-weight', 'bold');
			$('.inSGListArea').css('display', 'none');
			$('.inMySGListArea').css('display', 'block');
			$('.recommendationSGListArea').css('display', 'none');
		}else {
			$('.SGListChangeUl li').css('font-weight', 'unset');
			$('.SGListChangeUl li:last-child').css('font-weight', 'bold');
			$('.inSGListArea').css('display', 'none');
			$('.inMySGListArea').css('display', 'none');
			$('.recommendationSGListArea').css('display', 'block');
		}
	}
	
	function SGdetailPage(){
		location.href='studyGroupDetailPage.sg';
	}
</script>
</head>
<body>
	<div class="SGMainBodyLeftArea">
		<div class="adArea">
			<img src="${contextPath}/resources/images/ad/ad.png">
		</div>
		<div class="SGListChangeBtnArea">
			<ul class="SGListChangeUl">
				<li onclick="changeGroupList('inSGListArea')">가입 그룹</li>
				<li onclick="changeGroupList('inMySGListArea')">개설 그룹</li>
				<li onclick="changeGroupList('recommendationSGListArea')">추천 그룹</li>
			</ul>
		</div>
		<div class="inSGListArea">
			<!-- 그룹 하나 -->
			<div class="inSGArea">
				<div class="inSGImgArea" onclick="SGdetailPage()">
					<img src="${contextPath}/resources/images/studyGroup/study.jpg">
				</div>
				<div class="inSGInfoArea">
					<div class="inSGTitle">
						<img src="${contextPath}/resources/images/studyGroup/trophy.png">
						<h4>2018년 KH정보교육원 학생들의 모임</h4>
					</div>
					<div class="inSGIntro">분산시키거나 분리시키는 것. 특히 제한된 지역에 집중되어 있는 부대가 적의 공격으로부터 받는 취약성을 감소시키기 위해 분산 또는 분리시키는 것.</div>
					<div class="inSGEnrolldate">그룹 개설일 : 2018년 10월 1일 15시 21분 </div>
					<div class="inSGDate">그룹 가입일 : 2018년 10월 12일 19시 35분</div>
					<div class="inSGJoinTime">총 활동 시간 : 392시간 </div>
					<div class="inSGAim">
						<div class="inSGAimProgress"></div>
						<div class="inSGAimPercent">그룹 목표 86%</div>
					</div>
					<div class="inSGUserImageArea">
						<div class="inSGuserInfo">참여 인원</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
					</div>
				</div>
			</div>
			<!-- 여기까지 그룹 하나 -->
		</div>
		<div class="inMySGListArea">
			<!-- 그룹 하나 -->
			<div class="inSGArea">
				<div class="inSGImgArea">
					<img src="${contextPath}/resources/images/studyGroup/study.jpg">
				</div>
				<div class="inSGInfoArea">
					<div class="inSGTitle">2018년 KH정보교육원 학생들의 모임</div>
					<div class="inSGIntro">분산시키거나 분리시키는 것. 특히 제한된 지역에 집중되어 있는 부대가 적의 공격으로부터 받는 취약성을 감소시키기 위해 분산 또는 분리시키는 것.</div>
					<div class="inSGEnrolldate">그룹 개설일 : 2018년 10월 1일 15시 21분 </div>
					<div class="inSGDate">그룹 가입일 : 2018년 10월 12일 19시 35분</div>
					<div class="inSGJoinTime">총 활동 시간 : 392시간 </div>
					<div class="inSGAim">
						<div class="inSGAimProgress"></div>
						<div class="inSGAimPercent">그룹 목표 86%</div>
					</div>
					<div class="inSGUserImageArea">
						<div class="inSGuserInfo">참여 인원</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
					</div>
				</div>
			</div>
			<!-- 여기까지 그룹 하나 -->
		</div>
		<div class="recommendationSGListArea">
			<!-- 그룹 하나 -->
			<div class="inSGArea">
				<div class="inSGImgArea">
					<img src="${contextPath}/resources/images/studyGroup/study.jpg">
				</div>
				<div class="inSGInfoArea">
					<div class="inSGTitle">2018년 KH정보교육원 학생들의 모임</div>
					<div class="inSGIntro">분산시키거나 분리시키는 것. 특히 제한된 지역에 집중되어 있는 부대가 적의 공격으로부터 받는 취약성을 감소시키기 위해 분산 또는 분리시키는 것.</div>
					<div class="inSGEnrolldate">그룹 개설일 : 2018년 10월 1일 15시 21분 </div>
					<div class="inSGDate">그룹 가입일 : 2018년 10월 12일 19시 35분</div>
					<div class="inSGJoinTime">총 활동 시간 : 392시간 </div>
					<div class="inSGAim">
						<div class="inSGAimProgress"></div>
						<div class="inSGAimPercent">그룹 목표 86%</div>
					</div>
					<div class="inSGUserImageArea">
						<div class="inSGuserInfo">참여 인원</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
						<div class="inSGUserImage">
							<img src="${contextPath}/resources/images/studyGroup/userImg.png">
						</div>
					</div>
				</div>
			</div>
			<!-- 여기까지 그룹 하나 -->
		</div>
	</div>
	<br>
</body>
</html>
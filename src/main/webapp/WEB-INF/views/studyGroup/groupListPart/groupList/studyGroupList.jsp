<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.SGListAdArea img {
		width:100%;
		height:170px;
		margin-bottom:5px;
	}
	.SGInfoArea {
		background:white;
		display:inline-block;
		width:385px;
		text-align:left;
		margin-bottom:20px;
	}
	.SGInfoThumbnailImgArea {
		display:inline-block;
	}
	.SGListInfoArea {
		text-align:justify;
		margin-bottom:30px;
	}
	.SGInfoRightArea {
		width:245px;
		position:absolute;
		display:inline-block;
	}
	.SGInfoThumbnailImg {
		width: 140px;
    	height: 180px;
	}
	.SGInfoCategoryArea, .SGInfoLocationArea {
		display:inline-block;
		margin:12px;
		margin-bottom: 0px;
		font-size:12px;
	}
	.SGInfoBossImg {
		width:40px;
		height:40px;
		border-radius: 37%;
    	margin: 5px;
	}
	.SGInfoTitleArea {
		display:inline-block;
		width:245px;
		font-size: 14px;
		padding-right: 5px;
    	font-weight: 450;
    	white-space: nowrap;
    	overflow: hidden;
    	text-overflow: ellipsis;
	}
	.SGInfoCommentArea {
		width: 245px;
	    height: 33px;
	    font-size: 12px;
	    padding: 10px;
	    padding-top: 4px;
		overflow: hidden;
		white-space: normal;
		line-height: 1.2;
		text-align: left;
		word-wrap: break-word;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}
	.SGInfoDGArea {
		text-align:justify;
	}
	.SGDateArea, .SGGoalArea {
		display: table-cell;
	    width: 123px;
	    font-size: 12px;
	    font-weight:bold;
	    padding: 11px;
	    padding-top:7px;
	    padding-bottom:7px;
	}
	.SGInfoMaxCrewArea {
		width:245px;
		height:32px;
		font-size: 12px;
		font-weight:bold;
		padding-left:10px;
	}
	.SGInfoLockArea {
		display:inline-block;
		float:right;
	}
	.SGInfoLockArea img {
		width: 15px;
    	height: 15px;
    	margin-right:10px;
	}
</style>
</head>
<body>
	<div class="SGListAdArea">
		<img src="${contextPath}/resources/images/ad/ad2.jpg">
	</div>
	<div class="SGListInfoArea">
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster.jpg"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster1.jpg"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster10.jpg"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster2.jpg"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster3.png"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster4.png"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster5.jpg"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster7.jpg"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster8.png"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
		<div class="SGInfoArea">
			<div class="SGInfoThumbnailImgArea">
				<img class="SGInfoThumbnailImg" src="${ contextPath }/resources/images/studyGroup/poster9.jpg"/>
			</div>
			<div class="SGInfoRightArea">
				<div class="SGInfoCLArea">
					<div class="SGInfoCategoryArea">카테고리</div>
					<div class="SGInfoLocationArea">지역</div>
				</div>
				<div class="SGInfoTitleArea">
					<img class="SGInfoBossImg" src="${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.files.files_Name}">
						2018년도 안에 취업 해야지
				</div>
				<div class="SGInfoCommentArea">
					안녕하세요
					hellow fuckasdf안녕하신가 그래 안녕
					와우
					안녕항냐고러어ㅓㅇ러어렁러어ㅜㅝdnfdf920390
				</div>
				<div class="SGInfoDGArea">
					<div class="SGDateArea">2018년 10월 24일</div>
					<div class="SGGoalArea">일간 목표 : 12시간</div>
				</div>
				<div class="SGInfoMaxCrewArea">
					모집 인원 : 15명 / 20명
					<div class="SGInfoLockArea">
						<img src="${ contextPath }/resources/images/studyGroup/key.png"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
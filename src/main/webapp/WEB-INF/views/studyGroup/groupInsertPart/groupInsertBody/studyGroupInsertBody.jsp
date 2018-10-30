<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- #### CSS FILES ### -->
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<!-- #### JAVASCRIPT FILES ### -->
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<style>
	html, body {
		background:#F8F8F8;
	}
	.SGInsertForm {
		margin-bottom:30px;
		background:white;
	}
	.SGInsertArea {
		display:table;
		vertical-align:top;
		width:1200px;
		border-bottom: 1px solid lightgray;
	}
	.SGInsertInfoForm {
		width:1200px;
		margin-top: 50px;
		margin-bottom: 25px;
		padding-bottom: 10px;
		border-bottom: 1px solid lightgray;
		color:#BDBDBD;
	}
	.SGInsertInfoForm img {
		width:20px;
		height:20px;
		margin-bottom: 7px;
	}
	.SGInsertInfoForm h4 {
		color:black;
		display:inline-block;
		font-size: 21px;
	}
	.SGInsertLeftArea, .SGInsertRightArea {
		display:inline-block;
		vertical-align: top;
		height:370px;
		margin-left:20px;
	}
	.SGInsertLeftArea {
		width:600px;
	}
	.SGInsertRightArea {
		width:540px;
	}
	.SGInsertBottomArea {
		width:100%;
		padding-top:20px;
		height:190px;
		border-top:1px solid lightgray;
	}
	.SGInsertArea input[type='text']{
		border-radius:10px;
		border-style:double;
		border-color:white;
		text-align:center;
		width:515px;
		height:22px;
		padding:0px;
		padding-left:10px;
		color:#00A2C9;
	}
	.SGInsertArea input[class='SGPassword']{
		width:300px;
	}
	.SGInsertArea input[type='text']:focus{
		border-color:#126978;
		outline:none;
	}
	.SGInsertThumbnailImgArea {
		border:1px solid lightgray;	
	}
	.inputMemberInfo {
		text-align:left;
		height:300px;
	}
	.inputMemberInfo h4{
		position:absolute;
		display:inline-block;
		margin:0px;
		margin-top:5px;
		margin-left:5px;
		font-size:12px;
		color:#BDBDBD;
	}
	.inputMemberInfo label {
		width:100%;
		height:300px;
		margin-bottom:0px;
	}
	.SGThumbnailImg {
	    width:0;
	    height:0;
	    overflow:hidden;
	}
	.SHInsertImg_plusImg {
		margin-left: 265px;
    	margin-top: 100px;
		width:80px;
		height:80px
	}
	.SGInsertOpenCheckArea {
		height:68px;
		padding-top: 23px;
    	padding-left: 10px;
	}
	.SGInsertOpenCheckArea input {
		display:none;
	}
	.SGInsertOpenCheckArea label {
		font-size: 12px;
    	width: 35px;
    	margin-top:2px;
    	padding-top:2px;
	}
	.SGOpenCheck {
		font-weight:bold;
		color:#FF1560;
	}
	.SGCloseCheck {
		font-weight:unset;
	}
	.SGInsertOpenCheckArea label:hover {
		cursor:pointer;
	}
	.drawThumbnailImg {
		width:100%;
		height:300px;
		display:none;
		
	}
	.SGInsertRightArea div{
		height:74px;
		width:100%;
		display:inline-block;
		border-bottom:1px solid lightgray;
	}
	.SGInsertRightArea div:last-child {
    	border-bottom:0px;
	}
	.SGInsertRightArea label {
		width: 100%;
    	height: 100%;
    	padding-top: 5px;
    	padding-left: 10px;
	}
	.SGInsertRightArea i {
	    font-style: normal;
	    font-size: 12px;
	    font-weight: normal;
	    margin-left:20px;
	}
	.SGInsertRightArea input {
		display:block;
		margin-top: 10px;
	}
	.SGInsertSGIntroArea {
		width:900px;
		height:150px;
		overflow:hidden;
		margin:0 auto;
	}
	.SGInsertSGIntroArea:focus {
		border:5px solid black;
	}
	.SGInsertSGIntroArea textarea{
		padding:10px;
		resize:none;
		width:95%;
		height:150px;
		border:2px solid white;
		border-radius:10px;
	}
	.SGInsertSGIntroArea textarea:focus {
		outline:none;
   		border:2px solid #126978;
	}
	.SGInsertBtnArea {
		text-align:right;
		padding-right: 50px;
	    margin-top: 20px;
	    padding-bottom: 20px;
	}
	.SGInsertSelect {
		margin-top:5px;
		width:515px;
	}
	.SGInsertBtnArea button{
		width: 100px;
	    border: none;
	    background-color: #f8585b;
	    padding: 8px 0;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    margin: 4px;
	    color: white;
	    cursor: pointer;
	    border-radius: 5px;
	}
</style>
<script>
	$(function(){
		$('.SGInsertOpenCheckArea > label').on('click', function(){
			if($(this).attr('class') == 'SGCloseCheck'){
				$('.SGPassword').css('display', 'inline-block');
			}else {
				$('.SGPassword').css('display', 'none');
			}
			
			$(this).siblings().css({
				'color': 'black',
				'font-weight': 'unset'
			});
			$(this).css({
				'color': '#FF1560',
				'font-weight': 'bold'
			});
		})
	});

	function previewFile() {
		var preview = document.getElementById('drawThumbnailImg');
		var file = document.getElementById('SGThumbnailImg').files[0];
		var reader = new FileReader();
		
		reader.addEventListener("load", function() {
			$('.inputMemberInfo h4').remove();
			$('.SHInsertImg_plusImg').remove();
			
			$('.drawThumbnailImg').css('display', 'block');
			preview.src = reader.result;
		}, false);
	
		if(file) {
			reader.readAsDataURL(file);
		}
	}
</script>
</head>
<body>
	<div class="SGInsertForm">
		<div class="SGInsertInfoForm">
			<img src="${ contextPath }/resources/images/studyGroup/point.png">
			<h4>스터디 그룹 생성</h4> | 스터디 그룹을 생성합니다.
		</div>
		<form action="insertStudyGroup.sg" method="post" encType="multipart/form-data">
			<div class="SGInsertArea">
				<div class="SGInsertLeftArea">
					<div class="SGInsertThumbnailImgArea">
						<div class="inputMemberInfo">
							<h4>배너 이미지를 선택해주세요. 최적 해상도는  10 : 4 비율입니다.</h4>
							<label>
								<img class="SHInsertImg_plusImg" id="SHInsertImg_plusImg" src="${contextPath}/resources/images/studyGroup/img_plus.png"/>
								<img class="drawThumbnailImg" id="drawThumbnailImg"/>
								<input type="file" onchange="previewFile()" class="SGThumbnailImg" id="SGThumbnailImg" name="studygroupThumbnailImg"/>
							</label>
						</div>
					</div>
					<div class="SGInsertOpenCheckArea">
						<label class="SGOpenCheck">
							<input type="radio" name=studygroup_Openstatus value="0" checked/>
							공개
						</label>
						<label class="SGCloseCheck">
							<input type="radio" name="studygroup_Openstatus" value="1" onclick=""/>
							비공개
						</label>
						<input type="text" name="studygruop_Pwd" class="SGPassword" placeholder="스터디 그룹 비밀번호"/>
					</div>
				</div>
				<div class="SGInsertRightArea">
					<div>
						<label>
							<i>그룹명</i>
							<input type="text" name="studygroup_Name"/>
						</label>
					</div>
					<div>
						<label>
							<i>카테고리</i>
							<select class="form-control SGInsertSelect" name="category_Code" id="sel1">
						        <option value="1">고입</option>
						        <option value="2">대입</option>
						        <option value="3">고시</option>
						        <option value="4">공시</option>
						        <option value="5">외국어</option>
						        <option value="6">취준</option>
						        <option value="7">자격증</option>
						        <option value="8">기타</option>
						    </select>
						</label>
					</div>
					<div>
						<label>
							<i>지역</i>
							<select class="form-control SGInsertSelect" name="location_Code" id="sel1">
						        <option value="1">전국</option>
						        <option value="2">서울</option>
						        <option value="3">경기</option>
						        <option value="4">충청</option>
						        <option value="5">전라</option>
						        <option value="6">강원</option>
						        <option value="7">경상</option>
						        <option value="8">제주</option>
						        <option value="9">기타</option>
						    </select>
						</label>
					</div>
					<div>
						<label>
							<i>모집인원</i>
							<select class="form-control SGInsertSelect" name="studygroup_Maxnum" id="sel1">
						        <option value="2">2명</option>
						        <option value="3">3명</option>
						        <option value="4">4명</option>
						        <option value="5">5명</option>
						        <option value="6">6명</option>
						        <option value="7">7명</option>
						        <option value="8">8명</option>
						        <option value="9">9명</option>
						        <option value="10">10명</option>
						        <option value="11">11명</option>
						        <option value="12">12명</option>
						        <option value="13">13명</option>
						        <option value="14">14명</option>
						        <option value="15">15명</option>
						        <option value="16">16명</option>
						        <option value="17">17명</option>
						        <option value="18">18명</option>
						        <option value="19">19명</option>
						        <option value="20">20명</option>
						    </select>
						</label>
					</div>
					<div>
						<label>
							<i>일간목표</i>
							<select class="form-control SGInsertSelect" name="studygroup_Goaltime" id="sel1">
						        <option value="2">2시간</option>
						        <option value="3">3시간</option>
						        <option value="3">4시간</option>
						        <option value="4">5시간</option>
						        <option value="5">6시간</option>
						        <option value="6">7시간</option>
						        <option value="7">8시간</option>
						        <option value="8">9시간</option>
						        <option value="10">10시간</option>
						        <option value="11">11시간</option>
						        <option value="12">12시간</option>
						    </select>
						</label>
					</div>
				</div>
				<div class="SGInsertBottomArea">
					<div class="SGInsertSGIntroArea">
						<textarea placeholder="소개 100자 이내" name="studygroup_Intro">소개 합니다~</textarea>
					</div>
				</div>
			</div>
			<div class="SGInsertBtnArea">
				<button type="submit">그룹 생성</button>
				<button type="button">취소</button>
			</div>
		</form>
	</div>
</body>
</html>
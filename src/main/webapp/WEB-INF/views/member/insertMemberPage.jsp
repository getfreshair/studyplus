<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>study plus 회원가입</title>
<style>
	.insertMemberForm {
		width:100%;
	}
	.insertMemberArea {
		width:1200px;
		margin:0 auto;
		background:#F5F6F7;
		box-sizing:border-box;
		padding:30px;
		padding-top:10px;
		text-align:center;
		border:1px solid lightgray;
    	border-radius:10px;
	}
	.insertMemberLeftArea {
		border-right:1px solid lightgray;
		float:left;
		display:inline-block;
		width:400px;
	}
	.insertMemberRightArea {
		display:inline-block;
		width:650px;
	}
	.insertMemberBottomArea {
		width:100%;
		display:inline-block;
	}
	.insertMemberInfoSapn {
		text-align:center;
		color:#FF6C6C;
		font-size:11px;
		font-weight:bold;
		padding-bottom:5px;
		display:inline-block;
	}
	.userThumbnailImg {
	    width:0;
	    height:0;
	    overflow:hidden;
	}
	.drawThumbnailImg {
		width:225px;
		height:225px;
		border-radius:10px;
	}
	.inputMemberInfo label {
		font-size:13px;
		color:#8C8C8C;
		padding-top: 5px;
    	padding-left: 5px;
	}
	.fieldCheckBox label, .localRadio label {
		color:#484848;
		display:inline-block;
		width:45px;
		text-align:center;
		padding-left:5px;
		padding-right:5px;
	}
	.fieldCheckBox label:nth-of-type(1), .localRadio label:nth-of-type(1) {
		color:#08a600;
		font-weight:bold;
	}
	.fieldCheckBox p, .localRadio p{
		color:#484848;
		text-align:center;
		padding-left:0px;
		margin-bottom:10px;
		display:block;
		font-size:15px;
		width:100%;
	}
	.fieldCheckBox input[type='checkbox'], .localRadio input[type='radio'] {
		display:none;
	}
	.selectMemberInfo {
		padding-top:10px;
		padding-bottom:10px;
	}
	.selectMemberInfo div {
		display:inline-block;
	}
	.selectMemberInfo div:nth-of-type(1) {
		margin-right:30px;
	}
	.selectMemberInfo select {
		width: 150px;
		-webkit-appearance:none;
		padding-top:5px;
    	padding-bottom:7px;
		background:url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 100% 50%;
		border:1px solid #999; 
		border-radius:0px;
	}
	.insertMemberArea input[type='text']{
		border-radius:10px;
		border-style:double;
		border-color:white;
		text-align:center;
		width:250px;
		height:22px;
		padding:0px;
		padding-left:10px;
		color:#00A2C9;
	}
	.insertMemberArea input[type='text']:focus{
		border-color:#126978;
		outline:none;
	}
	.insertMemberLeftArea hr:nth-of-type(1),
	.insertMemberLeftArea hr:nth-of-type(2),
	.insertMemberLeftArea hr:nth-of-type(3),
	.insertMemberLeftArea hr:nth-of-type(4),
	.insertMemberLeftArea hr:nth-of-type(5),
	.insertMemberLeftArea hr:nth-of-type(6) {
		width:300px;
	}
	.insertMemberRightArea hr:nth-of-type(1),
	.insertMemberRightArea hr:nth-of-type(2) {
		width:380px;
	}
	.insertMemberRightArea hr:nth-of-type(3) {
		width:510px;
	}
	.insertMemberRightArea hr:nth-of-type(4),
	.insertMemberRightArea hr:nth-of-type(5) {
		width:550px;
	}
	.insertMemberBtnArea {
		display:inline-block;
		width:100%;
		padding-top:50px;
		text-align:center;
		box-sizing:border-box;
	}
	.insertMemberBtnArea > button{
		width:100px;
		border:none;
		background-color:#f8585b;
		padding:8px 0;
		text-align:center;
		text-decoration:none;
		display:inline-block;
		font-size:15px;
		margin:4px;
		color:white;
		cursor:pointer;
		border-radius:5px;
	}
	.commentTextarea {
		width:480px;
		height:80px;
		margin:0 auto;
		border-radius:10px;
		overflow:hidden;
	}
	.commentTextarea:focus {
		border:5px solid black;
	}
	.commentTextarea textarea{
		padding:10px;
		resize:none;
		width:95%;
		height:70%;
		border:2px solid white;
		border-radius:10px;
	}
	.commentTextarea textarea:focus {
		outline:none;
   		border:2px solid #126978;
	}
</style>
<script>
	$(function(){
		$('.localRadio > label, .fieldCheckBox > label').on('click', function(){
			if($(this).find('input').attr('type') == 'checkbox'){
				if($(this).find('input:checkbox').is(':checked')){
					$(this).css('color', '#08a600').css('font-weight', 'bold');
				}else{
					$(this).css('color', '#484848').css('font-weight', 'unset');
				}
			}else{
				$(this).siblings().css({
					'color': 'black',
					'font-weight': 'unset'
				});
				$(this).css({
					'color': '#08a600',
					'font-weight': 'bold'
				});
			}
		})
	});
	
	function previewFile() {
		var preview = document.getElementById('drawThumbnailImg');
		var file = document.getElementById('userThumbnailImg').files[0];
		var reader = new FileReader();

		reader.addEventListener("load", function() {
			preview.src = reader.result;
		}, false);

		if(file) {
			reader.readAsDataURL(file);
		}
	};
</script>
</head>
<body>
	<div class="insertMemberForm">
		<form action="insertMember.me" method="post" encType="multipart/form-data">
			<div class="insertMemberArea">
				<div class="insertMemberLeftArea">
					<span class="insertMemberInfoSapn">* 표시는 필수 입력 항목입니다.</span>
					<hr>
					<div class="inputMemberInfo">
						<input type="text" name="member_Id" placeholder=" * 아이디"/>
					</div>
					<hr>
					<div class="inputMemberInfo">
						<input type="text" name="member_Nickname" placeholder=" * 닉네임"/>
					</div>
					<hr>
					<div class="inputMemberInfo">
						<input type="text" name="member_Pwd" placeholder=" * 비밀번호"/>
					</div>
					<hr>
					<div class="inputMemberInfo">
						<label>
							<img class="drawThumbnailImg" id="drawThumbnailImg" src="${contextPath}/resources/images/member/userImg.png"/>
							<br>프로필 이미지
							<input type="file" onchange="previewFile()" class="userThumbnailImg" id="userThumbnailImg" name="userThumbnailImg"/>
						</label>
					</div>
					<hr>
					<div class="inputMemberInfo">
						<div>
							<input type="text" name="member_Age" placeholder=" * 나이"/>
						</div>
					</div>
					<hr>
				</div>
				<div class="insertMemberRightArea">
					<hr>
					<div class="inputMemberInfo selectMemberInfo">
						<div>
							<select name="member_Gender"> 
								<option> * 성별</option>
								<option value="M" selected>남자</option>
								<option value="F">여자</option>
							</select>
						</div>
						<div>
							<select name="member_Job">
								<option> * 직업</option>
								<option value="01" selected>무직</option>     
								<option value="02">학생</option> 
								<option value="03">언론</option>     
								<option value="04">공무원</option>     
								<option value="05">군인</option>     
								<option value="06">서비스업</option>     
								<option value="07">교육</option>     
								<option value="08">금융/증권/보험업</option>     
								<option value="09">유통업</option>     
								<option value="10">예술</option>     
								<option value="11">의료</option>     
								<option value="12">법률</option>     
								<option value="13">건설업</option>     
								<option value="14">제조업</option>     
								<option value="15">부동산업</option>     
								<option value="16">운송업</option>     
								<option value="17">농/수/임/광산업</option>     
								<option value="18">가사</option>     
								<option value="19">기타</option>     
							</select>
						</div>
					</div>
					<hr>
					<div class="inputMemberInfo fieldCheckBox">
						<p>* 관심 분야</p>
						<label><input type="checkbox" name="category_Code" value="1" checked>고입</label>
						<label><input type="checkbox" name="category_Code" value="2">대입</label>
						<label><input type="checkbox" name="category_Code" value="3">고시</label>
						<label><input type="checkbox" name="category_Code" value="4">공시</label>
						<label><input type="checkbox" name="category_Code" value="5">외국어</label>
						<label><input type="checkbox" name="category_Code" value="6">취준</label>
						<label><input type="checkbox" name="category_Code" value="7">자격증</label>
						<label><input type="checkbox" name="category_Code" value="8">기타</label>
					</div>
					<hr>
					<div class="inputMemberInfo localRadio">
						<p>* 지역</p>
						<label><input type="radio" id="local" name="location_Code" value="1" checked>전국</label>
						<label><input type="radio" id="local" name="location_Code" value="2">서울</label>
						<label><input type="radio" id="local" name="location_Code" value="3">경기</label>
						<label><input type="radio" id="local" name="location_Code" value="4">충청</label>
						<label><input type="radio" id="local" name="location_Code" value="5">전라</label>
						<label><input type="radio" id="local" name="location_Code" value="6">강원</label>
						<label><input type="radio" id="local" name="location_Code" value="7">경상</label>
						<label><input type="radio" id="local" name="location_Code" value="8">제주</label>
						<label><input type="radio" id="local" name="location_Code" value="9">기타</label>
					</div>
					<hr>
					<div class="inputMemberInfo commentTextarea">
						<textarea placeholder="소개 100자 이내" name="member_Introduction">소개 합니다~</textarea>
					</div>
					<hr>
					<div class="inputMemberInfo">
						<input type="text" name="member_Phone" placeholder=" * 휴대폰"/>
					</div>
					<div class="inputMemberInfo">
						<label><input type="checkbox" name="member_SMSConfirmation" value="0">문자 발송 동의</label>
					</div>
					<hr>
				</div>
				<div class="insertMemberBottomArea">
					<div class="insertMemberBtnArea">
						<button type="submit">가입하기</button>
						<button type="reset">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
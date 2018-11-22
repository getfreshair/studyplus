<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- #### CSS FILES ### -->
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<!-- #### JAVASCRIPT FILES ### -->
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<style>
	.findMemberIdArea {
		width:670px;
		margin:0 auto;
		text-align:center; 
	}
	.findMemberLogoImgArea {
		text-align:center;
	}
	.findMemberLogoImg {
		width:150px;
	}
	.findMemberIdAreaTopInfo div{
		border-bottom: 2px solid #e5e5e5;
		height: 24px;
	}
	.findMemberIdAreaTopInfo h2 {
		font-size: 16px;
	    margin: 0px;
	    width: 102px;
	    border-bottom: 2px solid black;
	    font-family: none;
	    font-weight: bold;
	    padding-bottom: 5px;
	}
	.findMemberIdAreaTopInfo p {
		font-size: 13px;
	    text-align: left;
	    margin-top: 10px;
	    margin-bottom: 40px;
	    font-family: fantasy;
	}
	.findMemberIdAreaBodyInfo {
		border:1px solid #e5e5e5;
		padding: 30px;
		text-align:left;
	}
	.findMemberIdAreaBodyInfoArea > label {
		font-family: auto;
	}
	
	.findMemberIdAreaBodyInfoCheckArea {
		display:inline-block;
		text-align:left;
		vertical-align: top;
	}
	.findMemberIdAreaBodyInfoArea p{
		font-size: 12px;
		margin-bottom:30px;
	}
	.findMemberIdAreaBodyInfoArea {
		display:inline-block;
		width: 589px;
	}
	.findMemberIdAreaBodyInfoTable {
		width:500px;
	}
	.findMemberIdAreaBodyInfoTable tr {
		display: block;
		margin-top:6px;
	}
	.tableFirstTd {
		font-size: 13px;
	    width: 90px;
	    font-weight: bold;
	    font-family: fantasy;
	}
	.tableSelectOption {
		height: 24px;
		width:60px;
    	margin-right: 5px;
    	font-size: 12px;
    	font-family: monospace;
	}
	.btn-defaultCss {
		border-radius:0px;
		border:1px solid #A8A8A8;
		height:24px;
		margin-left: 5px;
		font-size: 12px;
    	padding: 3px;
	}
	.MEMBER_ID {
		width:226px;
		font-size:13px;
	}
	.confirmNum {
		font-size:12px;
		padding:3px;
		width: 226px;
    	border-radius:0px;
    	text-align:left;
    	background: #F3F3F3;
    	border:1px solid #A8A8A8;
	}
	.confirmNumInfo {
		display: inline-block;
	    font-size: 12px;
	    font-family: fantasy;
	}
	.confirmNumInfoA {
		width: 13px;
	    font-size: 10px;
	    border: 1px solid lightgray;
	    display: inline-block;
	    text-align: center;
	    margin-left: 5px;
	    font-weight: bold;
	    font-family: monospace;
	    padding-right: 1px;
	}
	.confirmNumInfoTd {
		width: 208px;
	}
	.MEMBER_PHONE {
		width:161px;
		height: 24px;
    	font-size: 13px;
	}
	.outputIdsArea {
		border: 1px solid #e5e5e5;
	    padding: 30px;
	    text-align: left;
	    margin-top:10px;
	}
	.findIdArea {
		display: inline-block;
	    margin-left: 20px;
	    font-family: fantasy;
	    font-weight: bold;
	    font-size: 13px;
	    vertical-align: top;
	}
	.outputIdArea {
		display:inline-block;
		margin-left: 45px;
    	font-size: 12px;
	}
	.outputId {
		border-bottom: 1px solid lightgray;
	}
	.btn-info {
		border-radius:0px;
	}
	.sendNumPhoneArea {
		text-align:center;
		margin-top:25px;
		width:100%;
		height:34px;
	}
	.sendNumPhone {
		display:none;
		height:34px;
	}
	.findIdOutputArea {
		display:none;
	}
	.changePwdArea {
		font-size: 12px;
	    padding: 3px;
	    width: 226px;
	    border-radius: 0px;
	    text-align: left;
	    background: #F3F3F3;
	    border: 1px solid #A8A8A8;
	    display:inline-block;
	    margin-top: 5px;
	}
	.outputIdArea span{
		display:block;
	}
	.changePwdBtn {
		border-radius: 0px;
	    border: 1px solid #A8A8A8;
	    height: 25px;
	    margin-left: 5px;
	    font-size: 12px;
	    padding: 3px;
	    background:white;
	}
	.tableTdIdCheck {
    	font-size: 12px;
    	font-family: fantasy;
    	padding-left: 5px;
    	color: #FF4848;
    	display:none;
	}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<div class="findMemberIdArea">
		<div class="findMemberLogoImgArea">
			<img class="findMemberLogoImg" src="/studyplus/resources/images/member/inesrtMemberLogo.png">
		</div>
		<div class="findMemberIdAreaTopInfo">
			<div>
				<h2>비밀번호 찾기</h2>
			</div>
			<p>등록한 아이디, 휴대전화로 비밀번호를 찾습니다.</p>
		</div>
		<div class="findMemberIdAreaBodyInfo">
			<div class="findMemberIdAreaBodyInfoCheckArea">
				<input type="radio" checked/>
			</div>
			<div class="findMemberIdAreaBodyInfoArea">
				<label>회원정보에 등록한 아이디, 휴대전화로 인증</label>
				<p>회원정보에 등록한 아이디, 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>
				<table class="findMemberIdAreaBodyInfoTable">
					<tr>
						<td class="tableFirstTd">아이디</td>
						<td class="tableIdTd"><input class="MEMBER_ID" type="text"/></td>
						<td><span class="tableTdIdCheck">아이디가 존재하지 않습니다.</span></td>
					</tr>
					<tr>
						<td class="tableFirstTd">휴대전화</td>
						<td>
							<select class="tableSelectOption">
								<option selected>+82</option>
							</select>
						</td>
						<td><input class="MEMBER_PHONE" type="text"/></td>
						<td><button type="button" class="btn-default btn-defaultCss" onclick="sendNum()">인증번호 받기</button></td>
					</tr>
					<tr>
						<td class="tableFirstTd"></td>
						<td colspan="3"><input type="text" class="btn confirmNum" placeholder="인증번호 6자리 숫자 입력" readonly/></td>
					</tr>
					<tr>
						<td class="tableFirstTd"></td>
						<td colspan="3" class="confirmNumInfoTd"><div class="confirmNumInfo">인증번호가 오지 않나요</div><a class="confirmNumInfoA" title="1588 번호가 스팸 문자로 등록되어 있는 것은 아닌지 확인해주세요. 스팸 문자로 등록되어 있지 않다면, 다시 한 번 '인증번호 받기'를 눌러주세요.">?</a></td>
					</tr>
				</table>
			</div>
			<div class="sendNumPhoneArea">
				<button type="button" class="sendNumPhone btn btn-info" onclick="selectIdList()">조회</button>
			</div>
		</div>
		<div class="findIdOutputArea">
			<div class="outputIdsArea">
				<div class="findIdArea">아이디</div>
				<div class="outputIdArea">
					<span></span>
					<input type="text" placeholder="변경할 비밀번호 입력 " class="changePwdArea member_Pwd" name="member_Pwd"/>
					<button type="button" class="changePwdBtn" onclick="changePwd()">비밀번호 변경</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../common/footer.jsp"/>
	<script>
		$('.changePwdArea').click(function(){
			$(this).css('background', 'white');
		});
		
		function changePwd(){
			location.href='changePwd.me?member_Id=' + $('.MEMBER_ID').val() + '&member_Pwd=' + $('.member_Pwd').val();
		}
		
		function sendNum(){
			$('.tableTdIdCheck').css('display', 'none');
			
			//아이디
			for (i = 0; i < document.getElementsByClassName('MEMBER_ID')[0].value.length; i++) {
	            var ch = document.getElementsByClassName('MEMBER_ID')[0].value.charAt(i);
	            
	            if(ch == ' '){
	            	alert("공백을 넣을 수 없습니다.");
	            	$('.MEMBER_ID').focus();
	                $('.MEMBER_ID').select();
	                return false;
	            }else if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
	                alert("대소문자, 숫자만 입력가능합니다.");
	                $('.MEMBER_ID').focus();
	                $('.MEMBER_ID').select();
	                return false;
	            }
	        }
	        
	        if (document.getElementsByClassName('MEMBER_ID')[0].value.length < 1 || document.getElementsByClassName('MEMBER_ID')[0].value.length > 12) {
	            alert("아이디는 1~12자까지만 입력이 가능합니다.")
	            $('.MEMBER_ID').focus();
	            $('.MEMBER_ID').select();
	            return false;
	        }
			
			//휴대폰
			var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			
			if( !regExp.test(document.getElementsByClassName('MEMBER_PHONE')[0].value) ) {
				alert("휴대폰 번호 형태가 잘 못 됐습니다.");
			    $('.MEMBER_PHONE').focus();
			    $('.MEMBER_PHONE').select();
			    
				return false;
			}
			
			$.ajax({
				url: 'selectConfirmUserId.me',
				data : {
					MEMBER_ID : $('.MEMBER_ID').val()
				},
				success : function(data){
					if(data.checkId == '1'){
						$.ajax({
							url: 'createConfirmNum.me',
							data: {
								MEMBER_PHONE : $('.MEMBER_PHONE').val()
							},
							success : function(data){
								$.ajax({
									url: 'selectConfirmNum.me',
									data: {
										MEMBER_PHONE : $('.MEMBER_PHONE').val()
									},
									success : function(data){
										$('.confirmNum').val(data.confirmNum);
										$('.sendNumPhone').css('display', 'inline-block');
									}
								});
							},
							error : function(data){
								console.log(data);
							}
						});
					}else{
						$('.tableTdIdCheck').css('display', 'block');
					}
				}
			});
			
		}
		
		function selectIdList(){
			$('.outputIdArea span').append($('.MEMBER_ID').val());
			$('.findIdOutputArea').css('display','block');
			$('.MEMBER_ID').prop('readonly', true);
			$('.MEMBER_PHONE').prop('readonly', true);
			$('.btn-default').removeAttr('onclick');
			
		}
	</script>
	</body>
</html>
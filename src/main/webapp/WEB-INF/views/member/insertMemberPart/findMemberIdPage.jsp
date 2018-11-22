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
	    width: 86px;
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
	.findMemberIdAreaBodyInfoArea > label {
		font-family: auto;
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
		width: 55px;
		height: 24px;
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
	.confirmNum {
		font-size:12px;
		padding:3px;
		width: 221px;
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
				<h2>아이디 찾기</h2>
			</div>
			<p>등록한 휴대전화로 아이디를 찾습니다.</p>
		</div>
		<div class="findMemberIdAreaBodyInfo">
			<div class="findMemberIdAreaBodyInfoCheckArea">
				<input type="radio" checked/>
			</div>
			<div class="findMemberIdAreaBodyInfoArea">
				<label>회원정보에 등록한 휴대전화로 인증</label>
				<p>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>
				<table class="findMemberIdAreaBodyInfoTable">
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
						<td colspan="3" class="confirmNumInfoTd"><div class="confirmNumInfo">인증번호가 오지 않나요</div><a class="confirmNumInfoA" title="1588 번호가 스팸 문자로 등록되어 있는 것은 아닌지 확인해주세요.스팸 문자로 등록되어 있지 않다면, 다시 한 번 '인증번호 받기'를 눌러주세요.">?</a></td>
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
				<div class="outputIdArea"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../../common/footer.jsp"/>
	<script>
		function selectIdList(){
			$.ajax({
				url : 'selectIdList.me',
				data : {
					MEMBER_PHONE : $('.MEMBER_PHONE').val()
				},
				success : function(data){
					if(!(data.idList.length == 0)){
						for(var key in data){
							for(var value in data[key]){
								$outputId = $('<div class="outputId">').append(data[key][value].MEMBER_ID);
								$('.outputIdArea').append($outputId);
							}
						}	
					}else{
						$outputId = $('<div class="outputId">').append('<span class="tableTdIdCheck">조회된 아이디가 없습니다.</span>');
						$('.outputIdArea').append($outputId);
						$('.tableTdIdCheck').css('display','block');
					}
					
					
					
					$('.findIdOutputArea').css('display','block');
				}
			});
		}
	
		function sendNum(){
			//휴대폰
			var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			
			if( !regExp.test(document.getElementsByClassName('MEMBER_PHONE')[0].value) ) {
				alert("휴대폰 번호 형태가 잘 못 됐습니다.");
			    $('.MEMBER_PHONE').focus();
			    $('.MEMBER_PHONE').select();
			    
				return false;
			}
			
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
							$('.btn-default').removeAttr('onclick');
							$('.MEMBER_PHONE').prop('readonly', true);
						}
					});
				},
				error : function(data){
					console.log(data);
				}
			});
		}
	</script>
	</body>
</html>
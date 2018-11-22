<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.studygroupModifyArea {
		background: #F9F9F9;
	    padding: 10px;
	    border-radius: 10px;
	    box-shadow: 2px 3px 3px 1px;
	}
	.studygroupModifyValueArea {
		padding-bottom:5px;
	}
	.studygroupModifyInfoSpan {
		font-size:12px;
		padding-bottom: 5px;
    	display: inline-block;
    	float:left;
    	padding-top: 5px;
	}
	.studygroupModifySpan {
		color: #5D5D5D;
		font-size: 18px;
		padding-bottom: 3px;
    	display: inline-block;
    	font-weight:bold;
    	float:left;
	}
	.studygroupModifyInput {
		width:100%;
		display:block;
		height: 30px;
		padding-left:10px;
	}
	.studygroupModifyInput::placeholder {
		font-size:12px;
	}
	.studygroupModifySubmitBtn {
		background:#00a0e9;
		width: 55px;
   	 	height: 33px;
	    margin-left: 10px;
	    margin-right: 10px;
	    font-size: 15px;
	    border-radius: 10px;
	    border-style: none;
	}
	.studygroupModifySubmitBtn:hover {
		cursor:pointer;
		background:#00a0e9;
	}
</style>
<div class="studygroupModifyArea">
	<form action="studygroupModify.sgd" method="post">
		<div class="studygroupModifyValueArea">
			<span class="studygroupModifyInfoSpan">현재 타이틀 :&nbsp;</span><span class="studygroupModifySpan">${studygroup_Name}</span>
			<input class="studygroupModifyInput" name="studygroup_Name" type="text" placeholder="변경할 그룹 제목 입력"/>
		</div>
		<div class="studygroupModifyValueArea">
			<span class="studygroupModifyInfoSpan">현재 모집 인원 수 :&nbsp;</span><span class="studygroupModifySpan">${studygroup_Maxnum}</span><span class="studygroupModifyInfoSpan">명</span>
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
		</div>
		<div class="studygroupModifyValueArea">
			<span class="studygroupModifyInfoSpan">현재 하루 목표 량 :&nbsp;</span><span class="studygroupModifySpan">${studygroup_Goaltime}</span><span class="studygroupModifyInfoSpan">시간</span>
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
		</div>
		<button type="submit" class="studygroupModifySubmitBtn btn btn-danger">수정</button>
		<input type="hidden" value="${studygroup_Code}" name="studygroup_Code"/>
	</form>
</div>
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
					<h2>입금계좌관리</h2>
					<hr>
					<p style="margin-left:2px;">무통장 입금계좌 설정</p>
					<div class="first-div" style="width:800px">
						<table id="insertAccount" class="table table-hover" style="font-size: 14px; text-align: center">
							<tr class="head">
									<th width="2%"><input type="checkbox" class="masterCheck"></th>
									<th width="7%">등록번호</th>
									<th width="15%">은행이름</th>
									<th width="30%">계좌번호</th>
									<th width="10%">예금주명</th>
							</tr>
						</table>
					</div>
					<div class="second-div" style="margin-left:300px">
							<button type="button" id="insertAccBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal"
								style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;">계좌추가</button>
							<!-- <button class="btn btn-primary" id="cppInsertBtn"
								name="cppInsertBtn1" style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;">계좌추가</button> -->
							<button class="btn btn-primary" id="cppUpdateBtn"
								name="cppUpdateBtn1" style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;margin-left:50px">계좌삭제</button>
					</div>
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">무통장 입금계좌 추가하기 입력창</h4>
								</div>
								<form method="post"
									action="<%=request.getContextPath()%>/insertAccount.caa"
									onsubmit="return checkModalForm()" name="moform">
									<div class="modal-body">
										<label>은행</label> <select name="bank"
											class="form-control modalContent1 modalContent">
											<option value="NH농협은행">NH농협은행</option>
											<option value="신한은행">신한은행</option>
											<option value="우리은행">우리은행</option>
											<option value="하나은행">하나은행</option>
											<option value="IBK기업은행">IBK기업은행</option>
											<option value="KB국민은행">KB국민은행</option>
											<option value="KEB외환은행">KEB외환은행</option>
										</select> <label>계좌번호</label> <input type="text" id="accountNo"
											class="form-control modalContent modalContent2"
											name="accountNo" placeholder="계좌번호를 입력해주세요."> <label>예금주</label>
										<input type="text"
											class="form-control modalContent modalContent3" name="name"
											placeholder="예금주명을 입력해주세요.">
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-success">추가하기</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</body>
</html>
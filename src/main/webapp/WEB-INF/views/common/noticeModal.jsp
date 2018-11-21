<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">공지사항</h4>
								</div> 
									<div class="modal-body">
										<label>제목</label> <input type="text" name="noticeTitle" value="${data[0].NOTICE_TITLE}"
											class="form-control modalContent modalContent1" readonly>
										<label>글쓴이</label> <input type="text" name="prTitle" value="관리자"
											class="form-control modalContent modalContent2" readonly>
										<label>게시날짜</label> <input type="text" name="prUrl" value="${data[0].NOTICE_ENROLLDATE}"
											class="form-control modalContent modalContent3" readonly>
										<label>글내용</label>
										<textarea class="form-control" id="textArea"  style="width : 100% !important; height:200px !important;" readonly>
			         	 				${data[0].NOTICE_CONTENT}</textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
							</div>
						</div>
					</div>
</body>
</html>
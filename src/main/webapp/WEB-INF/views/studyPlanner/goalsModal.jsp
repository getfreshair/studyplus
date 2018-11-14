<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- insertTodayModal -->
<div class="modal fade" id="insertTodayModal" tabindex="-1" role="dialog" aria-labelledby="insertTodayModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">오늘의 공부 목표!</h4>
			</div>
			<div class="modal-body">
				<div class="tab">
					<button type="button" class="btn btn-default on">시간 단위 설정</button>
					<button type="button" class="btn btn-default">페이지 단위 설정</button>
				</div>
				<!-- 시간 단위 설정 -->
				<form action="TodayTimeGoalAddModal.sp" method="post">
					<div class="time_form">
						<input type="hidden" value="1" name="goalType">
						<div class="col-sm-5 col-xs-12 chart_area">
							<canvas id="insert_Modal_donut" width="200" height="200"></canvas>
							<span class="chart_per"></span>
						</div>
						<div class="col-sm-7 col-xs-12 ipt_area">
							<dl>
								<dt>목표명</dt>
								<dd><input type="text" class="form-control" placeholder="목표를 입력하세요" id="goalName" name="goalName"></dd>
							</dl>
							<dl>
								<dt>목표 시간</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" placeholder="ex) 2" id="goalTime" name="goalTime" value="0" min="0">
									<span>시간 &nbsp;&nbsp;</span>
									<input type="number" class="form-control" placeholder="ex) 30" id="goalMin" name="goalMin" value="0" min="0">
									<span>분</span>
								</dd>
							</dl>
							<dl>
								<dt>달성량</dt>
								<dd class="ipt_wrap">
									<span id="achiev">0</span> / 
									<span id="goalAmount">0</span>
								</dd>
							</dl>
						</div>
						<div class="btn-center">
							<button type="reset" class="btn btn-default" data-dismiss="modal" id="resetBtn">취소</button>
							<button type="submit" class="btn btn-primary" id="saveBtn">저장</button>
						</div>
					</div>
				</form>
				<!-- // 시간 단위 설정 -->
				<!-- 페이지 단위 설정 -->
				<form action="TodayBookGoalAddModal.sp" method="post">
					<div class="book_form">
						<input type="hidden" value="0" name="goalType">
						<div class="col-sm-5 col-xs-12 img_area">
							
							<input type="text" id="bookIpt">
							<button type="button" id="bookBtn">책검색</button>
							<script>
								$(function(){
									//$("#bookBtn").click(function(){
										var searchTit = $("#bookIpt").val();
										console.log(searchTit);
										$.ajax({
											url : "bookIsbn.sp",
											data : {searchTit : 9791196119584},
											type : "get",
											success : function(data) {
												console.log(data)
												
												//var object = { ... };
 
												//console.log(Object.keys(data))
												for( var key in data ) {
												  console.log( key + '=>' + data[key] );
												}


												//console.log(data[key].items)
												//$(".book_info").text(data);
	
											},
											error : function() {
												console.log("에러발생!");
											}
										});
									//});
								});
							</script>
							<!-- <div class="book_img">
								img area
							</div>
							<p class="book_info">자바의 정석</p> -->
							<p class="book_info"></p>
						</div>
						<div class="col-sm-7 col-xs-12 ipt_area">
							<dl>
								<dt>목표명</dt>
								<dd><input type="text" class="form-control" placeholder="목표를 입력하세요" id="goalName" name="goalName"></dd>
							</dl>
							<dl>
								<dt>목표 페이지</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" placeholder="ex) 20" id="goalPage" name="goalPage" value="0" min="0">
									<span>페이지</span>
								</dd>
							</dl>
							<dl>
								<dt>달성량</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" id="goalAchiev" name="goalAchiev" value="0" min="0" disabled>
									<span>페이지</span>
								</dd>
							</dl>
						</div>
						<div class="btn-center">
							<button type="reset" class="btn btn-default" data-dismiss="modal" id="resetBtn">취소</button>
							<button type="submit" class="btn btn-primary" id="saveBtn">저장</button>
						</div>
					</div>
				</form>
				<!-- // 페이지 단위 설정 -->
			</div>
		</div>
	</div>
</div>
<!-- // insertTodayModal -->

<!-- todayDetailViewModal -->
<div class="modal fade" id="detailViewModal" tabindex="-1" role="dialog" aria-labelledby="detailViewModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">오늘의 공부 목표!</h4>
			</div>
			<div class="modal-body">
				<div class="tab">
					<button type="button" class="btn btn-default on">시간 단위 설정</button>
					<button type="button" class="btn btn-default">페이지 단위 설정</button>
				</div>
				<!-- 시간 단위 설정 -->
				<form action="TodayTimeGoalAddModal.sp" method="post">
					<div class="time_form">
						<input type="hidden" value="1" name="goalType">
						<div class="col-sm-5 col-xs-12 chart_area">
							<canvas id="today_Modal_donut" width="200" height="200"></canvas>
							<span class="chart_per"></span>
						</div>
						<div class="col-sm-7 col-xs-12 ipt_area">
							<dl>
								<dt>목표명</dt>
								<dd><input type="text" class="form-control" placeholder="목표를 입력하세요" id="goalName" name="goalName"></dd>
							</dl>
							<dl>
								<dt>목표 시간</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" placeholder="ex) 2" id="goalTime" name="goalTime" value="0" min="0">
									<span>시간 &nbsp;&nbsp;</span>
									<input type="number" class="form-control" placeholder="ex) 30" id="goalMin" name="goalMin" value="0" min="0">
									<span>분</span>
								</dd>
							</dl>
							<dl>
								<dt>달성량</dt>
								<dd class="ipt_wrap">
									<span id="achiev">0</span> / 
									<span id="goalAmount">0</span>
								</dd>
							</dl>
						</div>
						<div class="btn-center">
							<button type="reset" class="btn btn-default" data-dismiss="modal" id="resetBtn">취소</button>
							<button type="submit" class="btn btn-primary" id="saveBtn">저장</button>
						</div>
					</div>
				</form>
				<!-- // 시간 단위 설정 -->
				<!-- 페이지 단위 설정 -->
				<form action="TodayBookGoalAddModal.sp" method="post">
					<div class="book_form">
						<input type="hidden" value="0" name="goalType">
						<div class="col-sm-5 col-xs-12 img_area">
							<div class="book_img">
								img area
							</div>
							<p class="book_info">자바의 정석</p>
						</div>
						<div class="col-sm-7 col-xs-12 ipt_area">
							<dl>
								<dt>목표명</dt>
								<dd><input type="text" class="form-control" placeholder="목표를 입력하세요" id="goalName" name="goalName"></dd>
							</dl>
							<dl>
								<dt>목표 페이지</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" placeholder="ex) 20" id="goalPage" name="goalPage" value="0" min="0">
									<span>페이지</span>
								</dd>
							</dl>
							<dl>
								<dt>달성량</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" id="goalAchiev" name="goalAchiev" value="0" min="0">
									<span>페이지</span>
								</dd>
							</dl>
						</div>
						<div class="btn-center">
							<button type="reset" class="btn btn-default" data-dismiss="modal" id="resetBtn">취소</button>
							<button type="submit" class="btn btn-primary" id="saveBtn">저장</button>
						</div>
					</div>
				</form>
				<!-- // 페이지 단위 설정 -->
			</div>
		</div>
	</div>
</div>
<!-- // todayDetailViewModal -->

<!-- insertWeeklyModal -->
<div class="modal fade" id="insertWeeklyModal" tabindex="-1" role="dialog" aria-labelledby="insertWeeklyModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">이번주 공부 목표!</h4>
			</div>
			<div class="modal-body">
				<div class="tab">
					<button type="button" class="btn btn-default on">시간 단위 설정</button>
					<button type="button" class="btn btn-default">페이지 단위 설정</button>
				</div>
				<!-- 시간 단위 설정 -->
				<form action="WeeklyTimeGoalAddModal.sp" method="post">
					<div class="time_form">
						<input type="hidden" value="1" name="goalType">
						<div class="col-sm-5 col-xs-12 chart_area">
							<canvas id="insert_Modal_donut2" width="200" height="200"></canvas>
							<span class="chart_per"></span>
						</div>
						<div class="col-sm-7 col-xs-12 ipt_area">
							<dl>
								<dt>목표명</dt>
								<dd><input type="text" class="form-control" placeholder="목표를 입력하세요" id="goalName" name="goalName"></dd>
							</dl>
							<dl>
								<dt>이번주 학습 요일 선택</dt>
								<dd class="sel_wrap">
									<input type="checkbox" id="sun" name="checkWeek">
									<label for="sun">일요일</label>
									<input type="checkbox" id="mon" name="checkWeek">
									<label for="mon">월요일</label>
									<input type="checkbox" id="tue" name="checkWeek">
									<label for="tue">화요일</label>
									<input type="checkbox" id="wed" name="checkWeek">
									<label for="wed">수요일</label><br>
									<input type="checkbox" id="thu" name="checkWeek">
									<label for="thu">목요일</label>
									<input type="checkbox" id="fri" name="checkWeek">
									<label for="fri">금요일</label>
									<input type="checkbox" id="sat" name="checkWeek">
									<label for="sat">토요일</label>
								</dd>
							</dl>
							<dl>
								<dt>하루 목표 시간</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" placeholder="ex) 2" id="goalTime" name="goalTime" value="0" min="0">
									<span>시간 &nbsp;&nbsp;</span>
									<input type="number" class="form-control" placeholder="ex) 30" id="goalMin" name="goalMin" value="0" min="0">
									<span>분</span>
								</dd>
							</dl>
							<dl>
								<dt>달성량</dt>
								<dd class="ipt_wrap">
									<span id="achiev">0</span> / 
									<span id="goalAmount">0</span>
								</dd>
							</dl>
						</div>
						<div class="btn-center">
							<button type="reset" class="btn btn-default" data-dismiss="modal" id="resetBtn">취소</button>
							<button type="submit" class="btn btn-primary" id="saveBtn">저장</button>
						</div>
					</div>
				</form>
				<!-- // 시간 단위 설정 -->
				<!-- 페이지 단위 설정 -->
				<form action="WeeklyBookGoalAddModal.sp" method="post">
					<div class="book_form">
						<input type="hidden" value="0" name="goalType">
						<div class="col-sm-5 col-xs-12 img_area">
							<div class="book_img">
								img area
							</div>
							<p class="book_info">자바의 정석</p>
						</div>
						<div class="col-sm-7 col-xs-12 ipt_area">
							<dl>
								<dt>목표명</dt>
								<dd><input type="text" class="form-control" placeholder="목표를 입력하세요" id="goalName" name="goalName"></dd>
							</dl>
							<dl>
								<dt>이번주 학습 요일 선택</dt>
								<dd class="sel_wrap">
									<input type="checkbox" id="sun" name="checkWeek">
									<label for="sun">일요일</label>
									<input type="checkbox" id="mon" name="checkWeek">
									<label for="mon">월요일</label>
									<input type="checkbox" id="tue" name="checkWeek">
									<label for="tue">화요일</label>
									<input type="checkbox" id="wed" name="checkWeek">
									<label for="wed">수요일</label><br>
									<input type="checkbox" id="thu" name="checkWeek">
									<label for="thu">목요일</label>
									<input type="checkbox" id="fri" name="checkWeek">
									<label for="fri">금요일</label>
									<input type="checkbox" id="sat" name="checkWeek">
									<label for="sat">토요일</label>
								</dd>
							</dl>
							<dl>
								<dt>하루 목표 페이지</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" placeholder="ex) 20" id="goalPage" name="goalPage" value="0" min="0">
									<span>페이지</span>
								</dd>
							</dl>
							<dl>
								<dt>달성량</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" id="goalAchiev" name="goalAchiev" value="0" min="0" disabled>
									<span>페이지</span>
								</dd>
							</dl>
						</div>
						<div class="btn-center">
							<button type="reset" class="btn btn-default" data-dismiss="modal" id="resetBtn">취소</button>
							<button type="submit" class="btn btn-primary" id="saveBtn">저장</button>
						</div>
					</div>
				</form>
				<!-- // 페이지 단위 설정 -->
			</div>
		</div>
	</div>
</div>
<!-- // insertWeeklyModal -->

<!-- weeklyDetailViewModal -->
<div class="modal fade" id="weeklyDetailViewModal" tabindex="-1" role="dialog" aria-labelledby="weeklyDetailViewModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">이번주 공부 목표!</h4>
			</div>
			<div class="modal-body">
				<div class="tab">
					<button type="button" class="btn btn-default on">시간 단위 설정</button>
					<button type="button" class="btn btn-default">페이지 단위 설정</button>
				</div>
				<!-- 시간 단위 설정 -->
				<form action="WeeklyTimeGoalAddModal.sp" method="post">
					<div class="time_form">
						<input type="hidden" value="1" name="goalType">
						<div class="col-sm-5 col-xs-12 chart_area">
							<canvas id="weekly_Modal_donut" width="200" height="200"></canvas>
							<span class="chart_per"></span>
						</div>
						<div class="col-sm-7 col-xs-12 ipt_area">
							<dl>
								<dt>목표명</dt>
								<dd><input type="text" class="form-control" placeholder="목표를 입력하세요" id="goalName" name="goalName"></dd>
							</dl>
							<dl>
								<dt>이번주 학습 요일 선택</dt>
								<dd class="up_sel_wrap">
									<input type="checkbox" id="sun" name="checkWeek">
									<label for="sun">일요일</label>
									<input type="checkbox" id="mon" name="checkWeek">
									<label for="mon">월요일</label>
									<input type="checkbox" id="tue" name="checkWeek">
									<label for="tue">화요일</label>
									<input type="checkbox" id="wed" name="checkWeek">
									<label for="wed">수요일</label><br>
									<input type="checkbox" id="thu" name="checkWeek">
									<label for="thu">목요일</label>
									<input type="checkbox" id="fri" name="checkWeek">
									<label for="fri">금요일</label>
									<input type="checkbox" id="sat" name="checkWeek">
									<label for="sat">토요일</label>
								</dd>
							</dl>
							<dl>
								<dt>하루 목표 시간</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" placeholder="ex) 2" id="goalTime" name="goalTime" value="0" min="0">
									<span>시간 &nbsp;&nbsp;</span>
									<input type="number" class="form-control" placeholder="ex) 30" id="goalMin" name="goalMin" value="0" min="0">
									<span>분</span>
								</dd>
							</dl>
							<dl>
								<dt>달성량</dt>
								<dd class="ipt_wrap">
									<span id="achiev">0</span> / 
									<span id="goalAmount">0</span>
								</dd>
							</dl>
						</div>
						<div class="btn-center">
							<button type="reset" class="btn btn-default" data-dismiss="modal" id="resetBtn">취소</button>
							<button type="submit" class="btn btn-primary" id="saveBtn">저장</button>
						</div>
					</div>
				</form>
				<!-- // 시간 단위 설정 -->
				<!-- 페이지 단위 설정 -->
				<form action="WeeklyBookGoalAddModal.sp" method="post">
					<div class="book_form">
						<input type="hidden" value="0" name="goalType">
						<div class="col-sm-5 col-xs-12 img_area">
							<div class="book_img">
								img area
							</div>
							<p class="book_info">자바의 정석</p>
						</div>
						<div class="col-sm-7 col-xs-12 ipt_area">
							<dl>
								<dt>목표명</dt>
								<dd><input type="text" class="form-control" placeholder="목표를 입력하세요" id="goalName" name="goalName"></dd>
							</dl>
							<dl>
								<dt>이번주 학습 요일 선택</dt>
								<dd class="up_sel_wrap">
									<input type="checkbox" id="sun" name="checkWeek">
									<label for="sun">일요일</label>
									<input type="checkbox" id="mon" name="checkWeek">
									<label for="mon">월요일</label>
									<input type="checkbox" id="tue" name="checkWeek">
									<label for="tue">화요일</label>
									<input type="checkbox" id="wed" name="checkWeek">
									<label for="wed">수요일</label><br>
									<input type="checkbox" id="thu" name="checkWeek">
									<label for="thu">목요일</label>
									<input type="checkbox" id="fri" name="checkWeek">
									<label for="fri">금요일</label>
									<input type="checkbox" id="sat" name="checkWeek">
									<label for="sat">토요일</label>
								</dd>
							</dl>
							<dl>
								<dt>하루 목표 페이지</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" placeholder="ex) 20" id="goalPage" name="goalPage" value="0" min="0">
									<span>페이지</span>
								</dd>
							</dl>
							<dl>
								<dt>달성량</dt>
								<dd class="ipt_wrap">
									<input type="number" class="form-control" id="goalAchiev" name="goalAchiev" value="0" min="0" disabled>
									<span>페이지</span>
								</dd>
							</dl>
						</div>
						<div class="btn-center">
							<button type="reset" class="btn btn-default" data-dismiss="modal" id="resetBtn">취소</button>
							<button type="submit" class="btn btn-primary" id="saveBtn">저장</button>
						</div>
					</div>
				</form>
				<!-- // 페이지 단위 설정 -->
			</div>
		</div>
	</div>
</div>
<!-- // weeklyDetailViewModal -->
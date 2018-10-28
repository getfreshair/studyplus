<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div class="navbar-affixed-top" data-spy="affix" data-offset-top="150">
		<div class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<a class="logo_area" href="index.html">
						<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
					</a>
					<div class="navbar-buttons">
						<button type="button" class="navbar-toggle btn-template-main" data-toggle="collapse" data-target="#navigation">
							<span class="sr-only">Toggle navigation</span>
							<i class="fa fa-align-justify"></i>
						</button>
					</div>
				</div>
				<!-- gnb -->
				<div class="navbar-collapse collapse" id="navigation">
					<ul class="nav navbar-nav navbar-right">
						<li class="menu-st01"><a href="#">프로그램 차단</a></li>
						<li class="menu-st02"><a href="#">스터디 플래너</a></li>
						<li class="menu-st03"><a href="#">스터디 그룹</a></li>
						<li><a href="#" id="menuMore">더보기</a>
			            	<div class="more_box">
			            		<ul>
			            			<li>공지사항</li>
			            			<li>자주 묻는 질문</li>
			            			<li>1:1문의</li>
			            			<li>약관 및 정책</li>
			            		</ul>
			            	</div>
			            </li>
						<li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
					</ul>
				</div>
			 	<!-- // gnb -->
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="loginModalLabel">로그인</h4>
				</div>
				<div class="modal-body">
					


				</div>
			</div>
		</div>
	</div>
	<!-- // Modal -->
	<script>
	//모달 오픈
	$(function(){
		$('#loginModal').on('shown.bs.modal', function () {
		//$('#myInput').focus();
		});
	})
	</script>
</header>
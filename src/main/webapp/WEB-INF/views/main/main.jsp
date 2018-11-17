<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>STUDY PLUS</title>
<!-- #### CSS FILES ### -->
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<!-- #### JAVASCRIPT FILES ### -->
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<style type="text/css">
	header{position:relative; z-index:9999;}
	.main_view .section{position:relative;}
	.main_view .container{height:100%;}
	#cont0.container{background:url("/studyplus/resources/images/main/main_top_background.png") 100% 20% no-repeat; background-size:65%;}
	#cont0 .img01{position:absolute; left:3%; bottom:20%; width:30%; z-index:1;}
	#cont0 .img02{position:absolute; right:5%; bottom:15%;}
	#cont0 .img03{position:absolute; left:5%; bottom:35%;}
	#cont0 .main_txt{position:absolute; left:0; top:13%;}
	#cont0 .main_txt .line01{font-size:3.0em; color:#4e4e4e; margin-bottom:-15px;}
	#cont0 .main_txt .line02{font-size:2.0em; color:#f62637; font-weight:bold;}
	#cont0 .main_txt .line02 span{color:#000;}
	#cont0 .main_txt .line03{font-size:1.3em; color:#4e4e4e;}
	#cont1 .banner-tr{text-align:right;}
	#cont1 .img01{position:absolute;left:-160px;top:-32px;width:330px;}
	#cont1 .img02{width:100%;}
	#cont1 .planner01{margin-top:20px; margin-bottom:16px;}
	#cont1 .planner01 div{padding-left:4px;}
	#cont1 .planner01 div:first-child{padding-left:0; padding-right:4px;}
	#cont1 .row img{width:100%;}
	#cont1 .planner02 > div{padding:4px;}
	#cont1 .planner02 div:first-child{padding-left:0; padding-right:8px}
	#cont1 .planner02 div:last-child{padding-right:0; padding-left:8px;}
	#cont2{padding-top:50px;}
	#cont2 img{width:100%;}
	#cont2 .row{margin-bottom:20px;}
	#cont3{padding-top:50px; height:560px; background:url("/studyplus/resources/images/main/block_background.png") no-repeat; background-position:0 100%; background-size:100%;}
	#cont3 img{width:100%;}
	#cont3 .img01{margin-top:50px;}
	.modal-dialog{top:100px;}
	.modal-dialog .btn-center{margin-top:20px;}
	.modal-dialog .btn-center .btn{margin-top:15px;}
	.modal-content{margin:0 auto;}
	.modal-open .modal{z-index:9999;}
	/* 작은사이즈 */
	@media (max-width: 768px) {
	#cont0.container{background-position:100% 60%;}
	#cont0 .main_txt{left:5%; top:8%;}
	#cont0 .img01{width:246px;}
	}
	/* 중간사이즈 */
	@media (max-width: 992px) {
	}
	/* 큰사이즈 */
	@media (min-width: 1200px) {
	}
</style>
</head>
<body>
	<div id="all" class="main">
        <!-- Header -->
        <header>
            <div class="navbar-affixed-top" data-spy="affix" data-offset-top="1">
                <div class="navbar navbar-default">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="logo_area" href="#">
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
                                <li class="menu-st01"><a href="#" onclick="contAnchor('1')" target="_self">프로그램 차단</a></li>
                                <li class="menu-st02"><a href="#" onclick="contAnchor('2')" target="_self">스터디 플래너</a></li>
                                <li class="menu-st03"><a href="#" onclick="contAnchor('3')" target="_self">스터디 그룹</a></li>
                                <li  id="menuMore"><a href="#">더보기</a>
                                    <div class="more_box">
                                        <ul>
                                            <li><a href="notice.do">공지사항</a></li>
                                            <li><a href="#">자주 묻는 질문</a></li>
                                            <li><a href="#">1:1문의</a></li>
                                            <li><a href="#">약관 및 정책</a></li>
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
        </header>
        <!-- // Header -->
        
        <!-- section -->
        <div class="main_view">
            <!-- 영역1 -->
            <div class="container" id="cont0">
                <div class="main_txt">
                    <p class="line01">STUDY PLUS</p>
                    <p class="line02">Smart and Efficient <span>Study Planner</span></p>
                    <p class="line03">프로그램 차단, 스터디 플래너, 스터디 그룹을 통해  체계적인 학습을 하세요.</p>
                </div>
                <img class="img01" src="/studyplus/resources/images/main/main_top.gif">
                <a class="img02" onclick="questionPage()"><img src="/studyplus/resources/images/main/chatbotBtn.png"></a>
                <a href="#" class="img03"><img src="/studyplus/resources/images/main/main_top_bubble.png"></a>
            </div>
             <!-- // 영역1 -->
            <!-- 영역2 -->
            <div class="container" id="cont1">
                <div class="banner-tr col-md-12 col-sm-12">
                    <img class="img01" src="/studyplus/resources/images/main/main_planner.gif">
                    <img class="img02" src="/studyplus/resources/images/main/main_planner_top.png">
                </div>
                <div class="row planner01">
                    <div class="col-sm-6 col-xs-12">
                        <img src="/studyplus/resources/images/main/main_planner_bg01.png">
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <img src="/studyplus/resources/images/main/main_planner_bg02.png">
                    </div>
                </div>
                <div class="row planner02">
                    <div class="col-sm-4 col-xs-12">
                        <img src="/studyplus/resources/images/main/main_planner_bg03.png">
                    </div>
                    <div class="col-sm-4 col-xs-12">
                        <img src="/studyplus/resources/images/main/main_planner_bg04.png">
                    </div>
                    <div class="col-sm-4 col-xs-12">
                        <img src="/studyplus/resources/images/main/main_planner_bg05.png">
                    </div>
                </div>
            </div>
            <!-- // 영역2 -->
            <!-- 영역3 -->
            <div class="container" id="cont2">
                <div class="row">
                    <div class="col-md-5 col-sm-5">
                        <img src="/studyplus/resources/images/main/main_group.gif">
                    </div>
                    <div class="col-md-7 col-sm-7">
                        <img src="/studyplus/resources/images/main/group_top.png">
                    </div>
                </div>
                <img src="/studyplus/resources/images/main/group_background.png">
            </div>
            <!-- // 영역3 -->
            <!-- 영역4 -->
            <div class="container" id="cont3">
                <div class="row">
                    <div class="col-md-8 col-sm-8">
                        <img class="img01" src="/studyplus/resources/images/main/block_top.png">
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <img src="/studyplus/resources/images/main/main_block.gif">
                    </div>
                </div>
            </div>
            <!-- // 영역4 -->
        </div>
        <!-- // section -->
        <!-- Footer -->
		<jsp:include page="../common/footer.jsp"/>
       	<!-- // Footer -->
    </div>
    
    <!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-sm">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="loginModalLabel">로그인</h4>
				</div>
				<div class="modal-body">
					<form action="login.me" method="POST">
						<div class="form-group">
							<label for="InputId">아이디</label>
							<input type="text" name="member_Id" class="form-control" id="InputId" placeholder="아이디를 입력하세요">
						</div>
						<div class="form-group">
							<label for="InputPassword">비밀번호</label>
							<input type="text" name="member_Pwd" class="form-control" id="InputPassword" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="btn-center">
							<a href="#">아이디 찾기</a> |
							<a href="#">비밀번호 찾기</a> |
							<a href="insertMemberPage.me">회원가입</a>
							<button type="submit" class="btn btn-primary btn-block">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- // Modal -->
	
	<script type="text/javascript">
	//첫번째 컨텐츠영역 브라우저 높이에 따라 지정
    function contVh(){
       var windH = $(window).height();
        $("#cont0").css("height",windH);
    }

    //메뉴 클릭시 앵커
    function contAnchor(seq){
        var menubarH = $(".navbar-affixed-top").height();
        console.log(menubarH); 

        var offset = $("#cont" + seq).offset().top - menubarH;
        $('html, body').animate({scrollTop :offset}, 400);
       
       var nowH = $(window).scrollTop();
       if(nowH <= 100){
            var offset2 = offset -menubarH;
            $('html, body').animate({scrollTop :offset2}, 400);
       }
    }
    
    //무엇이든 물어보세요
    function questionPage(){
    	window.open('questionPage.me', '_blank', 'width=450, height=500, left=450, top=50, resizable=no, titlebar=no, status=no');
    }
    
	//모달 오픈
	function modalOpen(){
		$('#loginModal').on('shown.bs.modal', function () {
		//$('#myInput').focus();
		});
	}
	
    $(function(){
        contVh();
        modalOpen();
     });
    
    $(window).resize(function (){
        contVh();
    });
	</script>
	
</body>
</html>
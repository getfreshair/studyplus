<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/studyplus/resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="/studyplus/resources/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/studyplus/resources/css/tabs.css" />
<link rel="stylesheet" type="text/css" href="/studyplus/resources/css/tabstyles.css" />
<script src="/studyplus/resources/js/modernizr.custom.js"></script>

</head>
<body>
<!-- Header -->
<jsp:include page="../common/header.jsp"/>
<!-- // Header -->


<section>
	<div class="tabs tabs-style-linemove">
		<nav>
			<ul>
				<li><a href="#section-linemove-1" ><span><i class="fa fa-desktop"></i>Programe Setting</span></a></li>
				<li><a href="#section-linemove-2" ><span>Web Site Setting</span></a></li>
				<li><a href="#section-linemove-3" ><span>Schedule Setting</span></a></li>
				<li><a href="#section-linemove-4" ><span>Location Setting</span></a></li>
				<li><a href="#section-linemove-5" ><span>preparing..</span></a></li>
			</ul>
		</nav>
		<div class="content-wrap">
			<section id="section-linemove-1" ><p>1</p></section>
			<section id="section-linemove-2"><p>2</p></section>
			<section id="section-linemove-3"><p>3</p></section>
			<section id="section-linemove-4"><p>4</p></section>
			<section id="section-linemove-5"><p>5</p></section>
		</div><!-- /content -->
	</div><!-- /tabs -->
</section>

<script src="/studyplus/resources/js/cbpFWTabs.js"></script>
		<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
		</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/studyplus/resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="/studyplus/resources/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/studyplus/resources/css/tabs.css" />
<link rel="stylesheet" type="text/css" href="/studyplus/resources/css/tabstyles.css" />
<script src="/studyplus/resources/js/modernizr.custom.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53bcac1324c96e6414d7bd70d6c22096&libraries=services"></script>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="http://malsup.github.com/jquery.form.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule.css">
  	<link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule-demo.css"> 
	<script src="/studyplus/resources/dist/jquery.schedule.js"></script> -->
<!-- 	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" ></script> -->
  <!--   <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule-demo.css">
    <script src="/studyplus/resources/dist/jquery.schedule.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule-demo.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
    <script src="http://malsup.github.com/jquery.form.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="/studyplus/resources/dist/jquery.schedule.js"></script>
    
</head>
<body>
<!-- Header -->
<jsp:include page="../common/header.jsp"/>
<!-- // Header -->


<section>
   <div class="tabs tabs-style-linemove">
      <nav>
         <ul>
            <li><a href="#section-linemove-1" ><span>Programe Setting</span></a></li>
            <li><a href="#section-linemove-2" ><span>Web Site Setting</span></a></li>
            <li><a href="#section-linemove-3" ><span>Schedule Setting</span></a></li>
            <li><a href="#section-linemove-4" ><span>Location Setting</span></a></li>
           	<!-- <li><a href="#section-linemove-5" ><span>preparing..</span></a></li> -->
         </ul>
      </nav>
      <div class="content-wrap">
         <section id="section-linemove-1" >
         <div id="programeDiv"></div>
            <script>
               $(function(){
                  $.ajax({
                       url:"showProgram.bl",
                       type:"get",
                       success:function(data){   
                         $("#programeDiv").html(data);      
                       },
                       error:function(request,status,error){
                            console.log("code:"+request.status + "\n message : " + request.responseText + "\n error : " + error );
                            }
                      })
               })
            </script>
         </section>
         <section id="section-linemove-2">
         <%-- <jsp:include page="blockWeb.jsp"/> --%>
         <div id="webDiv"></div>
            <script>
               $(function(){
                  $.ajax({
                       url:"showWeb.bl",
                       type:"get",
                       success:function(data){   
                         $("#webDiv").html(data);         
                       },
                       error:function(request,status,error){
                            console.log("code:"+request.status + "\n message : " + request.responseText + "\n error : " + error );
                            }
                      })
               })
            </script>
         </section>
         <section id="section-linemove-3">
         <div id="scheduleDiv"></div>
            <script>
               $(function(){
                  $.ajax({
                       url:"showSchedule.bl",
                       type:"get",
                       success:function(data){   
                         $("#scheduleDiv").html(data);         
                       },
                       error:function(request,status,error){
                            console.log("code:"+request.status + "\n message : " + request.responseText + "\n error : " + error );
                            }
                      })
               })
            </script>
         </section>
         <section id="section-linemove-4">
         <%-- <jsp:include page="blockLocation.jsp"/> --%>
         <div id="locationDiv"></div>
            <script>
               $(function(){
                  $.ajax({
                       url:"showLocation.bl",
                       type:"get",
                       success:function(data){   
                         $("#locationDiv").html(data);         
                       },
                       error:function(request,status,error){
                            console.log("code:"+request.status + "\n message : " + request.responseText + "\n error : " + error );
                            }
                      })
               })
            </script>
         </section>
         <!-- <section id="section-linemove-5"></section> -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script>
latitude = 33.450701;
longitude = 126.570667
if("geolocation" in navigator){
	navigator.geolocation.getCurrentPosition(function(position) {
		latitude = position.coords.latitude;
		longitude = position.coords.longitude;
		
		});
} else {
	alert("GPS를 제공하지 않는 인터넷 브라우저 입니다.\n 지도에 내 위치 표시 기능이 동작하지 않습니다.");
}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.locationMenu {
	background: red !important;
}

.vl {
	border-left: 2px solid gray;
	margin-top: 80px;
	height: 430px;
	float: left;
}
</style>
</head>
<body>
	<div class="col-xs-12 col-md-3">
		<jsp:include page="blockSideMenu.jsp" />
	</div>
	<div class="col-xs-12 col-md-9">
		<div class="panel panel-default col-xs-11 col-md-11 "
			style="margin-top: 100px; margin-left: 50px; margin-right: 50px">
			<div class="panel-body">지역 차단을 설정합니다. 설정 후 완료 버튼을 눌러야 적용이 완료
				됩니다.</div>
		</div>
		<br> <br>
		<div class="col-xs-11 col-md-6"
			style="margin-left: 50px; padding-right: 9%; float: left">
			<h1 style="color: blue;">위치 차단 설정</h1>
			<div class="form-group" style="margin-left: 30px">
				<br> <br>

				 <input type="text" id="sample3_postcode" 
					placeholder="우편번호" class="form-control"
					style="width: 30%; display: inline-block; margin-bottom: 10px" readonly>
				- <input type="button" onclick="sample3_execDaumPostcode()"
					value="우편번호 찾기" class="btn btn-info">
				<button type="reset" class="btn btn-danger" style="float:right; margin-right:3%" >리셋</button>
				<br>

				<div id="wrap"
					style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
					<img
						src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
						id="btnFoldWrap"
						style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
						onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>
				<form action="saveBlockLocationData.bl" method="post" id="frm">
					<input type="text" id="sample3_address"
					class="d_form large form-control" placeholder="주소"
					style="display: inline-block; width: 75%" readonly> &nbsp;&nbsp; 
					<input type="button" value="위치 등록하기" class="btn btn-success"
					style="display: inline-block" onclick="inputLocationChecker()"> <br> <br> <br>
					<input type="hidden" name="locationInfo" id="inputLocation" value="">
				<br>
				</form>
				<script>
					function inputLocationChecker() {
						if( $('#sample3_address').val() == ""){
							alert("주소를 입력 후 진행을 해주세요.");
							return false;
						} else {
						 	geocoder.addressSearch($('#sample3_address').val().substr(0,$('#sample3_address').val().lastIndexOf("(")), function(result, status) {
							    console.log()
						 		// 정상적으로 검색이 완료됐으면 
							     if (status === daum.maps.services.Status.OK) {
							    	$('#inputLocation').val("lat:" + result[0].y + "/lng:" + result[0].x + "/addr:" + $('#sample3_address').val().substr(0,$('#sample3_address').val().lastIndexOf("("))); 
							    	document.getElementById("frm").submit();
							    	
							    } else {
							    	alert("시스템 오류 발생. 다시 시도해 주세요.");
							    }
							});  
/* 						 	console.log($('#inputLocation').val() + "ㅇ?");
							alert("시스템 오류 발생. 다시 시도해 주세요.");
							return false; */
						 	
						}
					}
				</script>
				<div class="form-group">
					<!-- <label for="comment">차단할 위치 목록</label> -->
					<h3>차단할 위치 목록</h3>
					<table id="listTable" width="100%" >
					<c:if test="${list.size() eq 0}">						
						<tr>
							<td>차단할 위치를 등록해주세요.</td>
						</tr>
					</c:if>
					<c:if test="${list.size() ne 0}">
					<tr>
						<th width="10%" style="text-align:center"><input type="checkbox"></th>
						<th width="90%">주소지</th>
					</tr>
						<c:forEach var="info" items="${list }">
							<tr>
								<td align="center"><input type="checkbox"></td>
								<c:set var="index" value='${fn:indexOf(info,"addr:")}'/>
								<c:set var="length" value='${fn:length(info)}'/>
								<td>${fn:substring(info,index+5,length)}</td>
							</tr>
						</c:forEach>
					</c:if>
					</table>
				</div>
			</div>
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
				// 우편번호 찾기 찾기 화면을 넣을 element
				var element_wrap = document.getElementById('wrap');

				function foldDaumPostcode() {
					// iframe을 넣은 element를 안보이게 한다.
					element_wrap.style.display = 'none';
				}

				function sample3_execDaumPostcode() {
					// 현재 scroll 위치를 저장해놓는다.
					var currentScroll = Math.max(document.body.scrollTop,
							document.documentElement.scrollTop);
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

									// 각 주소의 노출 규칙에 따라 주소를 조합한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var fullAddr = data.address; // 최종 주소 변수
									var extraAddr = ''; // 조합형 주소 변수

									// 기본 주소가 도로명 타입일때 조합한다.
									if (data.addressType === 'R') {
										//법정동명이 있을 경우 추가한다.
										if (data.bname !== '') {
											extraAddr += data.bname;
										}
										// 건물명이 있을 경우 추가한다.
										if (data.buildingName !== '') {
											extraAddr += (extraAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
										fullAddr += (extraAddr !== '' ? ' ('
												+ extraAddr + ')' : '');
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
									document.getElementById('sample3_address').value = fullAddr;

									// iframe을 넣은 element를 안보이게 한다.
									// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
									element_wrap.style.display = 'none';

									// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
									document.body.scrollTop = currentScroll;
								},
								// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
								onresize : function(size) {
									element_wrap.style.height = size.height
											+ 'px';
								},
								width : '100%',
								height : '100%'
							}).embed(element_wrap);

					// iframe을 넣은 element를 보이게 한다.
					element_wrap.style.display = 'block';
				}
			</script>
		</div>
		<div class="vl col-xs-0 col-md-1" align="center"></div>
		<div style="float: left" class="col-xs-11 col-md-4">
			<br>
			<br>
			<br>
			<br>
			<div id="map" style="width: 450px; height: 400px;"></div>
			<br>
				<form action="saveBlockLocationData.bl" method="post" onsubmit="return clickMapChecker()">
					<label style="color:gray ;padding-top:5px"> * 선택 된 마커를 기준으로 위치를 등록합니다.</label>
					<input type="submit" value="위치 등록하기" class="btn btn-success" style="float:right; margin-right:5%">
					<input type="hidden" name="locationInfo" id="latlngOnMap" value="">
				</form>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53bcac1324c96e6414d7bd70d6c22096&libraries=services">
			</script>
			<script>
				function clickMapChecker() {
					if( $('#latlngOnMap').val() == ""){
						alert("원하시는 위치를 지도에서 선택 후 저장을 진행해 주세요.");
						return false;
					} else {
						return true;
					}
				}
				var container = document.getElementById('map');
				var options = {
					center : new daum.maps.LatLng(latitude,longitude),
					level : 3
				};
				var map = new daum.maps.Map(container, options);
				// 지도를 클릭한 위치에 표출할 마커입니다
				var marker = new daum.maps.Marker({ 
				    // 지도 중심좌표에 마커를 생성합니다 
				    position: map.getCenter() 
				}),infowindow = new daum.maps.InfoWindow({zindex:1});
				
				var geocoder = new daum.maps.services.Geocoder();
				
				<c:forEach items="${list}" var="item">
				console.log('${item}');
				var lat = '${item}'.substr('${item}'.indexOf("lat:")+4,'${item}'.indexOf("/")-5);
				var lon = '${item}'.substr('${item}'.indexOf("lng:")+4,'${item}'.lastIndexOf("/"));
				console.log("lat = " + lat + " / lon = " +  lon);
				console.log('${item}');
				console.log("------");
				</c:forEach>

				
				
				// 지도에 표시할 원을 생성합니다
				var circle = new daum.maps.Circle({
				    center : new daum.maps.LatLng(latitude, longitude),  // 원의 중심좌표 입니다 
				    radius: 150, // 미터 단위의 원의 반지름입니다 
				    strokeWeight: 3, // 선의 두께입니다 
				    strokeColor: '#75B8FA', // 선의 색깔입니다
				    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				    strokeStyle: 'line', // 선의 스타일 입니다
				    fillColor: '#CFE7FF', // 채우기 색깔입니다
				    fillOpacity: 0.7  // 채우기 불투명도 입니다   
				}); 

				// 지도에 원을 표시합니다 
				circle.setMap(map); 
				
				// 지도에 마커를 표시합니다
				marker.setMap(map);
				// 지도에 클릭 이벤트를 등록합니다
				// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
				daum.maps.event.addListener(map, 'click', function(mouseEvent) {
					searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				        if (status === daum.maps.services.Status.OK) {
				            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				            detailAddr += '<div>지번주소 : ' + result[0].address.address_name + '</div>';
				            
				            var content = '<div class="bAddr">' +
				                            '<span class="title">선택한 지역 주소 정보</span>' + 
				                            detailAddr + 
				                          '</div>';
				            // 마커를 클릭한 위치에 표시합니다 
				            marker.setPosition(mouseEvent.latLng);
				            marker.setMap(map);
				            $('#latlngOnMap').val($('#latlngOnMap').val()+"/addr:"+result[0].address.address_name.replace(/<\/?[^>]+(>|$)/g, ""));
				            
				            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				            infowindow.setContent(content);
				            infowindow.open(map, marker);
				        }   
				    });
					
					daum.maps.event.addListener(map, 'idle', function() {
					    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
					});

					function searchAddrFromCoords(coords, callback) {
					    // 좌표로 행정동 주소 정보를 요청합니다
					    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
					}

					function searchDetailAddrFromCoords(coords, callback) {
					    // 좌표로 법정동 상세 주소 정보를 요청합니다
					    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
					}

					// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
					function displayCenterInfo(result, status) {
					    if (status === daum.maps.services.Status.OK) {
					        var infoDiv = document.getElementById('centerAddr');
					    }    
					}
					// 클릭한 위도, 경도 정보를 가져옵니다 
					var latlng = mouseEvent.latLng;


					var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
					message += '경도는 ' + latlng.getLng() + ' 입니다';
					
					$('#latlngOnMap').val("lat:" + latlng.getLat()+"/lng:"+latlng.getLng()) 
				});
			</script>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	alert("GPS를 제공하지 않는 인터넷 브라우저 입니다.")
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
				<form action="" method="post">
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
				<input type="text" id="sample3_address"
					class="d_form large form-control" placeholder="주소"
					style="display: inline-block; width: 75%" readonly > &nbsp;&nbsp; 
					<input type="submit" value="위치 등록하기" class="btn btn-success"
					style="display: inline-block"> <br> <br> <br>
				<br>
				</form>
				<div class="form-group">
					<label for="comment">차단할 위치 목록</label>
					<textarea class="form-control" cols="10" rows="10" id="comment"
						style="resize: none;"></textarea>
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
			<label style="color:gray ;padding-top:5px"> * 선택 된 마커를 기준으로 위치를 등록합니다.</label><input type="button" value="위치 등록하기" class="btn btn-success" style="float:right; margin-right:5%">
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53bcac1324c96e6414d7bd70d6c22096"></script>
			<script>
				
				console.log(latitude,longitude);	
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
				});
				
				/* // 주소-좌표 변환 객체를 생성합니다
				var geocoder1 = new daum.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {

				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						console.log(coords + " : coords")
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });

				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new daum.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
				        });
				        infowindow.open(map, marker);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    */
				
				//나중에 반복문으로 돌려서 수행하기..
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

					// 클릭한 위도, 경도 정보를 가져옵니다 
					var latlng = mouseEvent.latLng;

					// 마커 위치를 클릭한 위치로 옮깁니다
					marker.setPosition(latlng);

					var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
					message += '경도는 ' + latlng.getLng() + ' 입니다';

					console.log(message);

				});
			</script>
		</div>
	</div>
</body>
</html>
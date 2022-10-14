<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d315ab8ef068b674b5187aae93872661"></script>
    <style type="text/css">
    	* {
    		margin: 0;
    		padding: 0;
    	}
    	
    	body {
			width: 1060px;
			margin: 0px auto;
		}
		
		#maintable {
			border: 1px solid black;
			text-align: center;
			width: 400px;
			height: 200px;
			margin-top: 100px;
		}
		
		div {
			display: flex;
			margin: 0px auto;
			justify-content: center;
		}
				
		#img {
			display: flex;
			justify-content: center;
			width: 400px;
			height: 400px;
		}
		
		table {
			display: flex;
			justify-content: center;
			table-layout: fixed;
		}
		

    </style>
</head>
<body>
	<div>
		<img id="img" src="${showRt.gr_img }">
	<table id="maintable">
		<tr>
			<td>가게이름 : ${showRt.business_name }</td>
		</tr>
		<tr>
			<td>가게주소 : ${showRt.location }</td>
		</tr>
		<tr>
			<td>가게 번호 : ${showRt.location_tel }</td>
		</tr>
	</table>
	</div>
	<div id="map" style="width:100%;height:400px;"></div>
	
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(${showRt.latitude}, ${showRt.longitude}), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 마커가 표시될 위치
		var markerPosition = new kakao.maps.LatLng(${showRt.latitude}, ${showRt.longitude});
		
		// 마커를 생성
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);
	</script>
</body>
</html>
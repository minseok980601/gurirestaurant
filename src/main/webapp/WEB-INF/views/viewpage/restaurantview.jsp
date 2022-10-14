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
		
		#itemBox {
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
		
		#map {
			display: flex;
			margin: 0px auto;
			justify-content: center;
		}

    </style>
</head>
<body>
	<div id="itemBox">
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
	<div id="map" style="width:800px; height:300px;"></div>
	
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(${showRt.latitude}, ${showRt.longitude}), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		map.relayout();
		
		function relayout() {
			// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있다.
			// 크기를 변경한 이후에는 반드시 map.relayout 함수를 호출해야 한다.
			// window의 resize 이벤트에 의한 크기변경은 map, relayout 함수가 자동으로 호출된다.
			map.relayout();
		}
		
		// 마커가 표시될 위치
		var markerPosition = new kakao.maps.LatLng(${showRt.latitude}, ${showRt.longitude});
		
		// 마커를 생성
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);
		
		var iwContent = '<div style="padding: 5px;">${showRt.business_name}</div>',
			// 인포윈도우 표시 위치
			iwPosition = new kakao.maps.LatLng(${showRt.latitude}, ${showRt.longitude}),
			iwRemoveable = true;
		
		// 인포윈도우를 생성
		var infowindow = new kakao.maps.InfoWindow({
			position: iwPosition,
			content: iwContent,
			removable: iwRemoveable
		});
		
		// 마커 위에 인포윈도우를 표시. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시
		infowindow.open(map, marker);
	</script>
</body>
</html>
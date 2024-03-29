<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d315ab8ef068b674b5187aae93872661"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style type="text/css">
		#map {
			display: flex;
			margin: 0px auto;
			justify-content: center;
		}
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Shop Item - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="${contextPath}/resources/css/viewstyles.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath}/resources/css/viewstyles.css" rel="stylesheet" />
</head>
<body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${contextPath}/mainpage">구리 음식점</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form action="${contextPath}/login" method="post" class="d-flex">
                    	<c:choose>
                    		<c:when test="${loginMember.id == null}">
                    			<p class="login_id_p">아이디 : </p>
                    			<input class="login_input" type="text" name="id" id="id">
                    			<p class="login_pw_p">비밀번호 : </p>
                    			<input class="login_input" type="text" name="pwd" id="pwd">
                  			    <button class="login_btn" type="submit">
                           		 로그인
                        		</button>
                        		<button class="joinMember_btn" type="button" onclick="location.href='${contextPath}/join'">
                        			회원가입
                        		</button>
                    		</c:when>
                    		<c:otherwise>
                    		<div class="lobin_Member_Div_Box">
                    			<p class="loginMember_nick">${loginMember.nick_nm }님 반갑습니다.</p>
                    			<button class="myPage_btn" type="button" onclick="location.href='${contextPath}/mypage?id=${loginMember.id}'">
                    				마이페이지
                    			</button>
                    			<button class="logout_btn" type="button" onclick="location.href='${contextPath}/logout'">
                    				로그아웃
                    			</button>
                    		</div>
                    		</c:otherwise>
                    	</c:choose>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${showRt.gr_img }"/></div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${showRt.business_name}</h1>
                        <div class="fs-5 mb-5">
                            <span>가게 번호 : ${showRt.location_tel }</span>
                        </div>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="number" value="${showRt.heart }" style="max-width: 3rem" />
                            <button onclick="updateSteamed()" class="btn btn-outline-dark flex-shrink-0" type="button">
                                🧡
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
	<div id="map" style="width:800px; height:300px;"></div>
	<div class="comment_write_box">
		<form action="${contextPath}/commentwrite" method="post">
			<input type="hidden" name="gr_num" value="${showRt.gr_num}">
			<input type="hidden" name="id" value="${loginMember.id}">
			<c:choose>
				<c:when test="${!empty loginMember.id}">
					<textarea class="noIdComment" rows="content" name="com_comment" id="comment_input" placeholder="댓글을 입력해주세요."></textarea>
						<button type="submit" onclick="writeBtn()" class="submit">등록</button>
				</c:when>
				<c:otherwise>
					<textarea class="idComment" rows="content" placeholder="로그인을 해주세요." disabled="disabled"></textarea>
						<button type="submit" onclick="writeBtn()" class="submit">등록</button>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
	<div class="comment_Box">
		<c:forEach var="c_list" items="${commentList}" varStatus="cl">
			<table class="comment_table" >
				<tr>
					<td id="comment_id">
						${c_list.id }
					</td>
					<td id="comment_comment">
						${c_list.com_comment }
					</td>
					<c:if test="${c_list.id == loginMember.id}">
						
						<td>
							<form name="commentData" action="${contextPath}/selectmycomment?com_num=${c_list.com_num}" method="post">
								<input id="com_num" name="com_num" type="hidden" value="${c_list.com_num }">
								<input type="hidden" value="${c_list.id }">
								<input type="hidden" value="${c_list.gr_num }">
								<input type="button" class="modify_btn" 
									onclick="document.getElementById('update_comment_box${cl.index }').style.display='block'" 
								value="수정">
							</form>
						
						</td>
					</c:if>
						<td id="comment_date">
							${c_list.com_date }
						</td>
				</tr>
			</table>
				<form action="${contextPath}/modifymycomment?com_num=${c_list.com_num}" method="post">
					<div class="outer_modifyComment_Box">
						<div id="update_comment_box${cl.index}" class="update_comment_box"  style="display: none;">
							<input type="hidden" name="gr_num" value="${c_list.gr_num }">
							<textarea class="modifyCommentBox" id="modify_input" name="com_comment">${c_list.com_comment }</textarea>
							<div class="test_box">
								<button id="modify_button" class="modify_Success_Btn" type="submit">수정</button>
								<button type="button" class="modify_No_Btn" 
									onclick="document.getElementById('update_comment_box${cl.index }').style.display='none'">
								취소</button>
							</div>
						</div>
					</div>
				</form>
		</c:forEach>
	</div>

        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/viewscripts.js"></script>

	
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
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		function updateSteamed() {
			$.ajax({
				type : 'post',
				url : "${contextPath}/steamrestaurant",
				dataType : "json",
				data : {"gr_num" : "${showRt.gr_num}", "id" : "${loginMember.id}"},
				error : function () {
					alert("통신 에러");
				},
				success : function (steamedCheck) {
					if(steamedCheck == 0) {
						alert("찜하기 완료.");
						location.href = "${contextPath}/showpage?gr_num=${showRt.gr_num}";
					} else if (steamedCheck == 1) {
						alert("찜하기 취소");
						location.href = "${contextPath}/showpage?gr_num=${showRt.gr_num}";
					}
				}
			});
		}

	</script>
	
	<script type="text/javascript">
		$(function() {
			createComment();
		})
		
		function createComment() {
			$(".submit").on("click", function () {
				var formObj = $("form[name='gurirestaurantForm']");
				if(document.getElementById("comment_input").value.length == 0) {
					alert("댓글을 입력해주세요.")
					return false;
				} else {
					formObj.attr("action", "${contextPath}/commentwrite");
					formObj.submit();
					alert("댓글이 작성되었습니다.")
				}
			});
		}
		
 		function modifyCommentPopUpClose() {
			document.getElementById("update_comment_box").style.display = "none";
		} 
		
	</script>
</body>
</html>
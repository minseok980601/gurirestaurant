<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="${contextPath}/resources/css/change_nick_styles.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/change_nick_styles.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript">
        	function check_nick_nm() {
				
         		let specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
        		
        		// 닉네임 입력값을 가져온다
        		let nick_nm = document.getElementById('input_nick').value;
        		nick_nm = nick_nm.toUpperCase();
        		let nickLength = 0;
        		
        		// 한글, 영문 길이 2,1로 바꾸기
        		// 한글은 2, 영문은 1로 치환한다
        		for (var i = 0; i < nick_nm.length; i++) {
        			// chartAt은 String 타입 객체를 char타입으로 변환한다. 
        			nick = nick_nm.charAt(i);
        			
        			// escape() 함수는 charAt을 통해 받아온 char을 16진수로 바꿔주며 쿠키충돌을 피한다. 한글은 이 길이가 4 넘는다.
        			if(escape(nick).length > 4) {
        				nickLength += 2;
        			} else {
        				nickLength += 1;
        			}
        		}
        		
        		// 닉네임 필수 입력
        		if (nick_nm == null || nick_nm == "") {
        			alert("닉네임을 입력해 주세요.");
        			document.modify_info.focus();
        			return false;
        		} 
        		// 닉네임 빈칸 포함 안됨
        		else if (nick_nm.search(/\s/) != -1) {
        			alert("닉네임은 빈 칸을 포함 할 수 없습니다.");
        			return false;
        		}
        		// 닉네임 한글 3~10자, 영문 및 숫자 6 ~ 20자
        		else if (nickLength < 6 || nickLength > 20) {
        			alert("닉네임은 한글 3~10자, 영문 및 숫자 6~20자 까지 가능합니다.");
        			return false;
        		}
        		// 닉네임 특수문자 포함 안됨 test()는 정규식과 특정 문자열 사이의 일치에 대한 검색을 수행, 일치 true, 불일치 false 반환
        		else if (specialCheck.test(nick_nm)) {
        			alert("닉네임은 특수문자를 포함 할 수 없습니다.");
        			return false;
        		} else {
        			$.ajax({
        				url : "${contextPath}/checknickname" ,
        				type : "post" ,
        				dataType: "JSON" ,
        				data : {"nick_nm" : nick_nm} ,
        				success : function(result) {
        					if(result != 1) {
        						alert("사용 가능한 닉네임 입니다.");
        						chk_Nick.style.display = 'none';
        						change_Nick.style.display = 'block';
        					} 
        					else if(result == 1) {
        						alert("중복된 닉네임입니다.");
        					}
        				} ,
        				error : function(err) {
        					alert("닉네임 변경 오류");
        				}
        			});
        		}
        	}
        </script>

</head>
<body>
      <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="${contextPath}/mainpage">구리 음식점</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    	<p class="loginMember_nick">${loginMember.nick_nm }님 반갑습니다.</p>
                    	<button class="myPage_btn" type="button" onclick="location.href='${contextPath}/mypage?id=${loginMember.id}'">
                    		마이페이지
                    	</button>
                    	<button class="logout_btn" type="button" onclick="location.href='${contextPath}/logout'">
                    		로그아웃
                    	</button>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">닉네임 변경</h1>
                            <p class="lead fw-normal text-muted mb-0">안전한 비밀번호를 사용합시다</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- * * SB Forms Contact Form * *-->
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- This form is pre-integrated with SB Forms.-->
                                <!-- To make this form functional, sign up at-->
                                <!-- https://startbootstrap.com/solution/contact-forms-->
                                <!-- to get an API token!-->
                                <form id="contactForm" method="post" name="nick_box" >
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                    	<input type="hidden" value="${loginMember.id }">
                                    	<input type="hidden" value="${loginMember.nick_nm }">
                                        <input class="form-control" id="input_nick" name="nick_nm" type="text" />
                                        <label for="name" >변경할 닉네임</label>
                                    </div>
                                    <!-- Submit Button-->
                                    <div class="d-grid">
                                    	<button class="nick__chk_button" type="button" id="chk_Nick" onclick="check_nick_nm()">닉네임 검사</button>
                                    	<button class="nick_button" type="button" id="change_Nick" onclick="change_nick_nm()">닉네임 변경</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Contact cards-->
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2022</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
</body>
</html>
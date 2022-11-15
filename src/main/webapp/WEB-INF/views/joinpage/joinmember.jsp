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
        <link href="${contextPath}/resources/css/join_member_styles.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/join_member_styles.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript">
        
        let checkcode = 0;
        
        let idDupcode = 0;
        let nickDupcode = 0;
        
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
    			checkcode = -1;
    			return false;
    		} 
    		// 닉네임 빈칸 포함 안됨
    		else if (nick_nm.search(/\s/) != -1) {
    			alert("닉네임은 빈 칸을 포함 할 수 없습니다.");
    			checkcode = -1;
    			return false;
    		}
    		// 닉네임 한글 3~10자, 영문 및 숫자 6 ~ 20자
    		else if (nickLength < 6 || nickLength > 20) {
    			alert("닉네임은 한글 3~10자, 영문 및 숫자 6~20자 까지 가능합니다.");
    			checkcode = -1;
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
    						nickDupcode = 1;
    						checkcode = 1;
    					} 
    					else if(result == 1) {
    						alert("중복된 닉네임입니다.");
    						checkcode = -1;
    					}
    				} ,
    				error : function(err) {
    					alert("닉네임 변경 오류");
    				}
    			});
    		}
    	}
    	
    	function check_id() {
			
    		let specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
    		
    		let check_id = document.getElementById('input_id').value;
    		check_id = check_id.toUpperCase();
    		let idLength = 0;
    		
    		for(var i = 0; i < check_id.length; i++) {
    			id = check_id.charAt(i);
    			
    			if(escape(id).length > 4) {
    				idLength += 2;
    			} else {
    				idLength += 1;
    			}
    		}
    		
    		if (check_id == null || check_id == "") {
    			alert("아이디를 입력해 주세요.");
    			document.Check_id_form.focus();
    			checkcode = -1;
    			return false;
    		}
    		else if (check_id.search(/\s/) != -1) {
    			alert("아이디는 빈 칸을 포함 할 수 없습니다.");
    			checkcode = -1;
    			return false;
    		}
    		else if (idLength < 8 || idLength > 20) {
    			alert("아이디는 영문 및 숫자 8 ~ 20자 까지 가능합니다.");
    			checkcode = -1;
    			return false;
    		}
    		else if (specialCheck.test(check_id)) {
    			alert("아이디는 특수문자를 포함 할 수 없습니다.");
    			checkcode = -1;
    			return false;
    		} else {
    			$.ajax({
    				url : "${contextPath}/checkid" ,
    				type : "post" ,
    				dataType  :"JSON" ,
    				data : {"id" : check_id} ,
    				success : function (result) {
						if(result != 1) {
							alert("사용 가능한 아이디 입니다.");
							idDupcode = 1;
							checkcode = 1;
						} 
						else if(result == 1) {
							checkcode = -1;
							alert("중복된 아이디 입니다.");
						}
					} ,
					error : function (err) {
						alert("아이디 입력 오류");
					}
    			});
     		}
    		
		}
    	
    	function Check() {
			
    		// 1이면 성곡적으로 폼액션, 1이 아닌경우 form action 불가
    		checkcode = 0;
    		
    		if(checkcode == 1)
    		check_id();
    		if(checkcode == 1)
    		check_nick_nm();
    		
    		/* alert('체크코드: ' + checkcode); */
    		
    		if(idDupcode != 1) {
    			alert("아이디 중복확인 인증을 해주세요");
    			checkcode = -1;
    			return false;
    		}
    		if(nickDupcode != 1) {
    			alert("닉네임 중복확인 인증을 해주세요.");
    			checkcode = -1;
    			return false;
    		}
    		
    		if(idDupcode == 1 && nickDupcode == 1) {
    			alert("회원가입 성공");
    			document.getElementsByName("chk_Nick")[0].setAttribute("type", "submit");
    		}
    		else
    			return false;

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
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                            <li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="blog-home.html">Blog Home</a></li>
                                    <li><a class="dropdown-item" href="blog-post.html">Blog Post</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Portfolio</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                                    <li><a class="dropdown-item" href="portfolio-overview.html">Portfolio Overview</a></li>
                                    <li><a class="dropdown-item" href="portfolio-item.html">Portfolio Item</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">회원 가입</h1>
                            <p class="lead fw-normal text-muted mb-0">구리 음식점을 가입해 주셔서 감사합니다.</p>
                        </div>
                        <form action="${contextPath}/joinmember" id="Check_id_form" method="post">
	                        <div class="row gx-5 justify-content-center">
	                            <div class="col-lg-8 col-xl-6">
	                                <!-- * * * * * * * * * * * * * * *-->
	                                <!-- * * SB Forms Contact Form * *-->
	                                <!-- * * * * * * * * * * * * * * *-->
	                                <!-- This form is pre-integrated with SB Forms.-->
	                                <!-- To make this form functional, sign up at-->
	                                <!-- https://startbootstrap.com/solution/contact-forms-->
	                                <!-- to get an API token!-->
	                                    <!-- Name input-->
	                                    
		                                    <div class="form-floating mb-3">
		                                        <input class="form-control" id="input_id" name="id" type="text"/>
		                                        <button class="id_chk_btn" type="button" onclick="check_id()">아이디 중복 확인</button>
		                                        <label for="id" >아이디</label>
		                                    </div>
	                                    
		                                    <div class="form-floating mb-3">
		                                        <input class="form-control" id="input_pwd" name="pwd" type="password" />
		                                        <label for="pwd">비밀번호</label>
		                                    </div>
		                                    <div class="form-floating mb-3">
		                                        <input class="form-control" id="input_name" name="name" type="text" />
		                                        <label for="name">이름</label>
		                                    </div>
		                                    <div class="form-floating mb-3">
		                                        <input class="form-control" id="input_nick" name="nick_nm" type="text">
		                                        <button class="nick_chk_btn" type="button" onclick="check_nick_nm()">닉네임 중복 확인</button>
		                                        <label for="nick_nm">닉네임</label>
		                                    </div>
		                                    <div class="form-floating mb-3">
		                                        <input class="form-control" id="input_nick_nm" name="email" type="email">
		                                        <label for="email">이메일</label>
											</div>	
		                                    <!-- Submit Button-->
		                                    <div class="d-grid">
		                                    	<button class="nick__chk_button" type="button" id="chk_Nick" name="chk_Nick" onclick="Check()">회원가입</button>
		                                    </div>
	                            </div>
	                        </div>
                        </form>
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
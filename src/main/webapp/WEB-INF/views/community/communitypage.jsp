<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 페이지</title>
    <meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Shop Homepage - Start Bootstrap Template</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="${contextPath}/resources/css/mainstyles.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${contextPath}/resources/css/mainstyles.css" rel="stylesheet" />
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
                    			<input class="login_input" type="password" name="pwd" id="pwd">
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
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">구리 음식점</h1>
                    <p class="lead fw-normal text-white-50 mb-0">구리의 모든 음식점</p>
                    <form action="${contextPath}/searchRestaurant" method="get">
	                    <div class="search">
	                    	<select name="searchType" id="selectBox">
	                    		<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}" />>제목</option>
	                    	</select>
	                    	<input type="text" name="keyword" id="keywordInput" value="${scri.keyword }"/>
	                    	
	                    	<button id="searchBtn" type="submit">검색</button>
	                    </div>
                    </form>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                	<div class="container">
						<div class="row">
							<div class="col-md-9">
					    	 <table class="community_table" style="width: 500px;">
					                    <thead>
					                        <tr>
					                            <th>번호</th>
					                            <th>제목</th>
					                            <th>작성자</th>
					                            <th>조회수</th>
					                            <th>추천</th>
					                            <th>반대</th>
					                            <th>작성일</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                        <tr>
					                            <td>1</td>
					                            <td>안녕하세요</td>
					                            <td>테스트</td>
					                            <td>5</td>
					                            <td>3</td>
					                            <td>0</td>
					                            <td>2023/02/08</td>
					                        </tr>
					                    </tbody>
					                </table>   
							</div>
						</div>
					</div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/mainscripts.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
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
    <script type="text/javascript">
	$(function () {
		$('searchBtn').click(
			function () {
				self.location = "${contextPath}/searchRestaurant"
							  + '${pageMaker.makeQuery(1)}' + "&searchType="
							  + $("select option:selected").val() + "&keyword="
							  + encodeURIComponent($('#keywordInput').val());
			});
	});
    </script>
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
                    			<p>${loginMember.nick_nm }님 반갑습니다.</p>
                    			<button type="button" onclick="location.href='${contextPath}/mypage?id=${loginMember.id}'">
                    				마이페이지
                    			</button>
                    			<button type="button" onclick="location.href='${contextPath}/logout'">
                    				로그아웃
                    			</button>
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
                <c:forEach var="list" items="${showRt }" begin="0" end="2">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${list.gr_img }" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a class="fw-bolder" href="${contextPath }/showpage?gr_num=${list.gr_num}">${list.business_name }</a>
                                    <!-- Product price-->
                                    
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                	<p>${list.heart}🧡</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:forEach var="list" items="${showRt }" begin="3" end="5">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${list.gr_img }" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a class="fw-bolder" href="${contextPath }/showpage?gr_num=${list.gr_num}">${list.business_name }</a>
                                    <!-- Product price-->
                                    
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                	<p>${list.heart}🧡</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:forEach var="list" items="${showRt }" begin="6" end="8">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${list.gr_img }" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a class="fw-bolder" href="${contextPath }/showpage?gr_num=${list.gr_num}">${list.business_name }</a>
                                    <!-- Product price-->
                                    
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                	<p>${list.heart}🧡</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
	<div class="pagingbox">
		<c:if test="${paging.startPage != 1 }">
			<a href="${contextPath}/mainpage?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b class="b-page">${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a class="a-page" href="${contextPath}/mainpage?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="${contextPath}/mainpage?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
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
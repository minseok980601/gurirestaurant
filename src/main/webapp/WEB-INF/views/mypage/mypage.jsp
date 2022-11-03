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
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="${contextPath}/resources/css/mypagestyles.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/mypagestyles.css" rel="stylesheet" />
</head>
<body>
     <!-- Navigation-->
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
         <div class="container px-4 px-lg-5">
             <a class="navbar-brand" href="#!">Start Bootstrap</a>
             <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                 <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                     <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                     <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                     <li class="nav-item dropdown">
                         <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                         <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                             <li><a class="dropdown-item" href="#!">All Products</a></li>
                             <li><hr class="dropdown-divider" /></li>
                             <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                             <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                         </ul>
                     </li>
                 </ul>
                 <form class="d-flex">
                     <button class="btn btn-outline-dark" type="submit">
                         <i class="bi-cart-fill me-1"></i>
                         Cart
                         <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                     </button>
                 </form>
             </div>
         </div>
     </nav>
     <!-- Header-->
     <header class="bg-dark py-5">
         <div class="container px-4 px-lg-5 my-5">
         	<ul>
         		<li>${loginMember.id }</li>
         		<li>${loginMember.name }</li>
         		<li>${loginMember.nick_nm }</li>
         		<li>${loginMember.email }</li>
         	</ul>
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
             </div>
         </div>
		<div class="pagingbox">
			<c:if test="${paging.startPage != 1 }">
				<a href="${contextPath}/mypage?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&id=${loginMember.id }">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b class="b-page">${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a class="a-page" href="${contextPath}/mypage?nowPage=${p }&cntPerPage=${paging.cntPerPage}&id=${loginMember.id }">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="${contextPath}/mypage?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&id=${loginMember.id }">&gt;</a>
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
     <script src="js/scripts.js"></script>
</body>
</html>
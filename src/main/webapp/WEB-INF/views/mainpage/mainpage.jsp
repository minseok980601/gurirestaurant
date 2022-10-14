<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Shop Item - Start Bootstrap Template</title>
    <style type="text/css">
    	* {
    		margin: 0;
    		padding: 0;
    	}
    	
    	body {
			width: 1060px;
			margin: 0px auto;
		}
		
		table img {
			width: 300px;
			height: 200px;
			margin-right: 20px;
		}
		
		h1 {
			font-size: 50px;
		}
		
		#itembox_1 {
			margin: 20px;
		}
		
		#itembox_2 {
			margin: 20px;
		}
    </style>
</head>
<body>
	<h1 align="center">구리 음식점</h1>
	<table id="itembox_1">	
		<tr>
			<c:forEach var="list" items="${showRt }" begin="0" end="2">
				<td>
					<div >
						<img src="${list.gr_img }">
					</div>
					<div align="center">
						<a href="${contextPath}/showpage?gr_num=${list.gr_num}">${list.business_name }</a>
					</div>
				</td>
			</c:forEach>
		</tr>
	</table>
	<table id="itembox_2">
		<tr>
			<c:forEach var="list" items="${showRt }" begin="3" end="5">
				<td>
					<div>
						<img src="${list.gr_img }">
					</div>
					<div align="center">
						<a href="${contextPath}/showpage?gr_num=${list.gr_num}">${list.business_name }</a>
					</div>
				</td>
			</c:forEach>
		</tr>
	</table>
</body>
</html>
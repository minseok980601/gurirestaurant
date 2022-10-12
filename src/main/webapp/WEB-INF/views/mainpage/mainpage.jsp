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
		}
    </style>
</head>
<body>
	<table>	
		<tr>
			<c:forEach var="list" items="${showRt }" begin="0" end="2">
				<td>
					<div>
						<img src="${list.gr_img }">
					</div>
					<div>
						${list.business_name }
					</div>
				</td>
			</c:forEach>
		</tr>
	</table>
	<table>
		<tr>
			<c:forEach var="list" items="${showRt }" begin="3" end="5">
				<td>
					<div>
						<img src="${list.gr_img }">
					</div>
					<div>
						${list.business_name }
					</div>
				</td>
			</c:forEach>
		</tr>
	</table>
</body>
</html>
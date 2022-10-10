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
		
		#maintable {
			border: 1px solid black;
			text-align: center;
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
		<img id="img" src="https://ldb-phinf.pstatic.net/20190528_242/1559014880314LpXzD_JPEG/u4SUS6_Qbq2nNeviP8NYWWeG.jpg">
	<table id="maintable">
		<tr>
			<td>가게이름 : 김밥천국</td>
		</tr>
		<tr>
			<td>가게주소 : 경기 구리시 이문안로 71 대호빌딩</td>
		</tr>
		<tr>
			<td>평점 : 3.5</td>
		</tr>
	</table>
	</div>
</body>
</html>
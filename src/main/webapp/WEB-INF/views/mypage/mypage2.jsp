<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

		#itembox_1 {
			margin: 20px;
		}
		
		#itembox_2 {
			margin: 20px;
		}
</style>
</head>
<body>
	<div>
		<table id="information_box">
			<td>
				<b>${loginMember.id }</b>
				<b>${loginMember.name }</b>
				<b>${loginMember.nick_nm }</b>
				<b>${loginMember.email }</b>
			</td>
		</table>
	</div>
	<table id="itembox_1">	
		<tr>
			<c:forEach var="list" items="${steamList }" begin="0" end="2">
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
			<c:forEach var="list" items="${steamList }" begin="3" end="5">
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
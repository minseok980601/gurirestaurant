<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
	</table>
	<form action="${contextPath}/okwriteboard"></form>
	<a href="${contextPath}/boardwrite">게시글 작성</a>
	<input type="text" value="${loginMember.id }">
	<table border="1px solid black">
		<tr>
			<td>제목 : </td>
			<td><input type="text"></td>
			<td>내용 : </td>
			<td><input type="text"></td>
		</tr>
		<c:forEach items="${listBoard}" varStatus="list" begin="0" end="9" >
		
		</c:forEach>
	</table>
	<input type="button" value="작성하기">
</body>
</html>
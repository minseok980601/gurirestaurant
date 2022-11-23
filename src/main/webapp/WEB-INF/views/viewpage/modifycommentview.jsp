<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='modifyForm']");
		
		$(".modify_btn").on("click", function () {
			location.href = "${contextPath}/showpage?gr_num=${myComment.gr_num}";
		})
		
	})
</script>
</head>
<body>
	<form name="modifyForm" action="${contextPath}/modifymucomment" method="post">
		<input type="hidden" name="gr_num" value="${myComment.gr_num }">
		<input type="hidden" name="com_num" value="${myComment.com_num }">
		<textarea rows="" cols="" id="com_comment" name="com_comment">${myComment.com_comment }</textarea>
		<input type="submit" value="수정">
		<input type="button" class="modify_btn" value="수정">
	</form>
</body>
</html>
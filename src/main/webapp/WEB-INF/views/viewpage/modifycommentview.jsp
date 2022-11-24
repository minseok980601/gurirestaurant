<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

	$(".update_btn").on("click", function(e) {
		const gr_num = '${myComment.gr_num}';
		const com_num = '${myComment.com_num}';
		const com_comment = $("#com_comment").val();
		
		const data = {
				gr_num : grnum,
				com_num = comnum,
				com_comment = comcomment
		}
		
		$.ajax({
			data : data,
			type : 'POST',
			url : '${contextPath}/modifymucomment',
			success : function(result) {
				$(opener.location).attr("href", "javascript:replyListInit();");
				window.close();
			}
		});
	});
	 
/* 
	function update_btn() {
		const gr_num = '${myComment.gr_num}';
		const com_num = '${myComment.com_num}';
		const com_comment = $("#com_comment").val();
		
		const data = {
				gr_num : grnum,
				com_num = comnum,
				com_comment = comcomment
		}
		
		$.ajax({
			url: "${contextPath}/modifymucomment",
			type: "POST",
			dataType : "JSON",
			data : data
			success : function (result) {
				alert("댓글 수정이 완료되었습니다.");
				window.close();
			}
		});
	}
	  */
/* 	 
	function update_btn2() {
		location.href="${contextPath}/modifymucomment";
		window.close();
	}
	  */
</script>
</head>
<body>
	<form name="modifyForm" action="${contextPath}/modifymucomment" method="post">
		<input type="hidden" name="gr_num" value="${myComment.gr_num }">
		<input type="hidden" name="com_num" value="${myComment.com_num }">
		<textarea rows="" cols="" id="com_comment" name="com_comment">${myComment.com_comment }</textarea>
		<input type="button" class="update_btn2" onclick="update_btn()" value="수정1">
		<input type="button" class="update_btn" value="수정2">
		<input type="button" class="modify_btn" onclick="update_btn2()" value="수정3">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하기</title>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
</head>
<body class="remove">
	<header>정말로 호신사를 떠나시겠습니까?</header>
	<div align="center">
		<input type="text" name="id" value="${member.id }" readonly="readonly"> <br>
		<input type="password" name="pw" placeholder="PASSWORD"> <br>
		<button class="remove">탈퇴</button>
		<button onclick="javascript:window.close();">탈퇴 그만두기</button>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(".removeBtn").on("click", function(e) {
		if ($("#pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		}
		var removeForm = $("#removeForm");
		var check = confirm("정말 탈퇴하시겠습니까?");
		
		if(check) {
			removeForm.submit();
		} else {
			
		}
	});
	
	$(".cancleBtn").on("click", function(e) {
		$(location).attr('href', '/member/myPage');
	});
});
</script>

<%@ include file="../includes/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$(".remove").on("click", function(e) {
		e.preventDefault();
		var check = confirm("정말 탈퇴하시겠습니까?");		
	});
});
</script>
</html>
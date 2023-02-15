<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		아이디 <input type="text" name="id" value="${member.id }" readonly="readonly"> <br>
		비밀번호 <input type="password" name="pw"> <br>
		<button class="remove">탈퇴</button>
		<button>탈퇴 그만두기</button>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".remove").on("click", function(e) {
		e.preventDefault();
		var check = confirm("정말 탈퇴하시겠습니까?");		
	});
});
</script>
</html>
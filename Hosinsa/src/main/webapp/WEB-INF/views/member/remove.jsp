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
	<div align="center">
	<form id="removeForm" action="/member/remove" method="post">
		아이디 <input type="text" name="id" value="${member.id }" readonly="readonly"> <br>
		비밀번호 <input type="password" name="pw" id="pw"> <br>
		<button class="removeBtn">탈퇴</button>
		<button class="cancleBtn">탈퇴 그만두기</button>
	</form>
	</div>
	<div>
		<c:if test="${result == 0}">
			비밀번호가 맞지않습니다.
		</c:if>
	</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".removeBtn").on("click", function(e) {
		if ($("#pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		}
		
		
		 var check = confirm("정말 탈퇴하시겠습니까?");
		
		 if (check) { 
			 
		 var url = "/member/remove";
		   var target = "/member/myPage";
		   var form = $("#removeForm");
		
		   form.attr("action", url);
	       form.attr("target", target);
	       form.attr("method", "post");
		   form.submit();
		   
			window.close();
		} 
	});
	
	$(".cancleBtn").on("click", function() {
		window.close();
	});
});
</script>
</html>
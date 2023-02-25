<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="complete_text">
		주문이 완료되었습니다. 이용해주셔서 감사합니다.
	</div>
	<br>
	<div class="complete_Btn">
		<button id="complete_Btn" type="button"> 메인으로 돌아가기. </button>
	</div>
		
</body>


<script>
    
$(function() {
	$("#complete_Btn").on("click", function(e) {
		location.href="/";
	}); 
});
</script>

<%@ include file="../includes/footer.jsp"%>
</html>
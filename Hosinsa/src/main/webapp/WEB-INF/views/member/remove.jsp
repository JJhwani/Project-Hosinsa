<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<p>HOSINSA를 정말 떠나시는 건가요? <br>
		   다시 한 번 더 생각해 보시지 않으시겠어요?</p>
	</div>
	<div>
		<input type="checkbox" name="A"> &nbsp; 쇼핑 기능이 어려워요! <br>
		<input type="checkbox" name="B"> &nbsp; 배송이 너무 느려요! <br>
		<input type="checkbox" name="C"> &nbsp; 상품 가격이 너무 비싸요! <br>
		<input type="checkbox" name="D"> &nbsp; 광고 알림이 너무 많아요! <br>
		<input type="checkbox" name="E"> &nbsp; 구매할 만한 상품이 없어요! <br>
		<input type="checkbox" name="F"> &nbsp; 재가입 예정이에요! <br>
		<input type="checkbox" name="G"> &nbsp; 사용 빈도가 너무 낮아요! <br>
		<input type="checkbox" name="H"> &nbsp; 기타
	</div>
	<div style="color: red;">
		<p>
		계정을 삭제하면 회원님의 모든 컨텐츠와 활동 기록, <br> 
		포인트 충전 · 적립 · 사용 내역이 삭제됩니다. <br>
		삭제된 정보는 복구할 수 없으니 신중하게 결정해주세요.
		</p>
	</div>
	<div>
	<form id="removeForm" action="/member/remove" method="post">
		아이디 <input type="text" id="id" name="id" value="${member.id }" readonly="readonly"> <br>
		비밀번호 <input type="password" name="pw" id="pw"> <br>
		<button type="button" class="removeBtn">탈퇴</button>
		<button type="button" class="cancleBtn">탈퇴 그만두기</button>
	</form>
	</div>
	<div>
		<c:if test="${msg == 0}">
			비밀번호가 틀립니다.
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
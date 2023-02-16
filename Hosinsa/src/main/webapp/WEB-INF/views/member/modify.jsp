<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 class="title">회원 정보 수정</h2>
	
	<h4 class="miniTitle">나의 정보</h4>
	
	<form role="form" action="/member/modify" method="post">
	<input type="hidden" name="grade" value="${member.grade }">
	<input type="hidden" name="introducer" value="${member.introducer }">
	<input type="hidden" name="point" value="${member.point }">
		<p class="grade">나의 등급 : ${member.grade }</p>
		<table class="table1 member_info">
			<tr>
				<th>프로필이미지</th>
				<td><input name="profilimg" type="text" value="${member.profilimg }"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="id" value="${member.id}" readonly="readonly"> </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name="pw" type="password" value="${member.pw }"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="name" type="text" value="${member.name }" readonly="readonly"> </td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input name="gender" type="text" value="${member.gender }"> </td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input name="birthday" type="text" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${member.birthday}'/>"> </td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input name="nickname" type="text" value="${member.nickname }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="email" type="text" value="${member.email }"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input name="phone" type="text" value="${member.phone }"></td>
			</tr>
		</table>
		
		<button type="submit" data-oper="modify" class="btn btn-default">수정</button>
		<button type="button" data-oper="close" class="btn btn-danger">취소</button>
	</form>
	
</body>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation === 'close') {
			formObj.find("input[name='pw']").remove();
			formObj.attr("action", "/member/myPage").attr("method", "get");
		} 
		formObj.submit();
	});
});
</script>
<%@ include file="../includes/footer.jsp" %>
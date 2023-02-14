<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<form role="form" action="/admin/memberModify" method="post">
	<input type="hidden" name="pageNum" value="${cri.pageNum}">
	<input type="hidden" name="amount" value="${cri.amount}">
	<input type="hidden" name="keyword" value="${cri.keyword}">
		<div class="container">
			<h2>Manager Page</h2>
			<table class="table table-hover">
				<tr>
					<th><label>아이디</label></th>
					<td><input name="id" value='<c:out value="${member.id}"/>' readonly="readonly"></td>
				</tr>
				<tr>
					<th><label>이름</label></th>
					<td><input name="name" value='<c:out value="${member.name}"/>' readonly="readonly"></td>
				</tr>
				<tr>
					<th><label>닉네임</label></th>
					<td><input name="nickname" value='<c:out value="${member.nickname}"/>' readonly="readonly"></td>
				</tr>
				<tr>
					<th><label>등급</label></th>
					<td>
						<c:choose>
			 				<c:when test="${member.grade eq 'C'}">
			 					<input type="radio" name="grade" value="C" checked="checked">&nbsp;LV.1 브론즈
			 					<input type="radio" name="grade" value="B">&nbsp;LV.2 실버
			 					<input type="radio" name="grade" value="A">&nbsp;LV.3 골드
								<input type="radio" name="grade" value="S">&nbsp;LV.4 운영자
			 				</c:when>
			 				<c:when test="${member.grade eq 'B'}">
								<input type="radio" name="grade" value="C">&nbsp;LV.1 브론즈
								<input type="radio" name="grade" value="B" checked="checked">&nbsp;LV.2 실버
			 					<input type="radio" name="grade" value="A">&nbsp;LV.3 골드
			 					<input type="radio" name="grade" value="S">&nbsp;LV.4 운영자
			 				</c:when>
			 				<c:when test="${member.grade eq 'A'}">
								<input type="radio" name="grade" value="C">&nbsp;LV.1 브론즈
								<input type="radio" name="grade" value="B">&nbsp;LV.2 실버
			 					<input type="radio" name="grade" value="A" checked="checked">&nbsp;LV.3 골드
			 					<input type="radio" name="grade" value="S">&nbsp;LV.4 운영자
			 				</c:when>
			 				<c:otherwise>
			 					<input type="radio" name="grade" value="C">&nbsp;LV.1 뉴비
								<input type="radio" name="grade" value="B">&nbsp;LV.2 멤버
			 					<input type="radio" name="grade" value="A">&nbsp;LV.3 골드
			 					<input type="radio" name="grade" value="S" checked="checked">&nbsp;LV.4 운영자
			 				</c:otherwise>
			 			</c:choose>
					</td>
				</tr>
				<tr>
					<th><label>Point</label></th>
					<td><input id="point" name="point" value='<c:out value="${member.point}"/>'></td>
				</tr>
			</table>
			<br><br>
			<button type="submit" data-oper='modify'>수정</button>
			<button type="submit" data-oper='list'>목록</button>
		</div>
	</form>
</body>

<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form");
	
	$("button").on("click", function(e) {
		e.preventDefault();
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'list') {
			formObj.attr("action", "/admin/member").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
		}
		formObj.submit();
	});
});
</script>
</html>
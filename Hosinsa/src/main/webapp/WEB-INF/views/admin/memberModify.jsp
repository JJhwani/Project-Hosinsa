<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<form role="form" action="/admin/memberModify" method="post">
<input type="hidden" name="pageNum" value="${cri.pageNum}">
<input type="hidden" name="amount" value="${cri.amount}">
<input type="hidden" name="keyword" value="${cri.keyword}">
	<div class="contentWrap">
		<h2 class="bigTitle">회원 정보 수정</h2>
		<table class="table array_center table3">
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
				<td class="grade">
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
							<input type="radio" name="grade" value="B">&nbsp;LV.2 실버
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
		<div class="array_center align_center">
			<button type="submit" data-oper='modify'>수정</button>
			<button type="submit" data-oper='list'>목록</button>
		</div>
	</div>
</form>
<%@ include file="../includes/footer.jsp"%>
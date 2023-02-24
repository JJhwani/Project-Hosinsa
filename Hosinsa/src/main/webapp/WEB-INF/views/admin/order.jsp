<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<form role="form" action="/admin/memberModify" method="post">
<input type="hidden" name="pageNum" value="${cri.pageNum}">
<input type="hidden" name="amount" value="${cri.amount}">
<input type="hidden" name="keyword" value="${cri.keyword}">
	<div class="contentWrap">
		<h2 class="bigTitle">주문 정보</h2>
		<table class="table array_center table3">
			<tr>
				<th><label>아이디</label></th>
				<td></td>
			</tr>
			<tr>
				<th><label>이름</label></th>
				<td></td>
			</tr>
			<tr>
				<th><label>닉네임</label></th>
				<td></td>
			</tr>
			<tr>
				<th><label>Point</label></th>
				<td></td>
			</tr>
		</table>
		<div class="array_center align_center">
			<button type="submit" data-oper='modify'>수정</button>
			<button type="submit" data-oper='list'>목록</button>
		</div>
	</div>
</form>
<%@ include file="../includes/footer.jsp"%>
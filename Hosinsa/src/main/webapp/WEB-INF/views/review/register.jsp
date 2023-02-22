<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

<div class="contentWrap reviewForm">
	<h2 class="bigTitle">리뷰 작성</h2>
	<h4 class="miniTitle">Product Info <i>제품 정보</i></h4>
	<img class="proimg" src="${product.proimg }">
	<table class="infoTable">
		<tr>
			<th>제품명</th>
			<td>${product.proname }</td>
		</tr>
		<tr>
			<th>브랜드</th>
			<td>${product.brand }</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${product.price }</td>
		</tr>
	</table>
	<form role="form" action="/review/register" method="post">
		<input type="hidden" name="id" value="${member.id}">
		<input type="hidden" name="pronum" value="${product.pronum }">
		<input type="hidden" name="ordernum" value="${ordernum }">
		<h4 class="miniTitle">제목</h4>
		<input type="text" name="title" value="">
		<h4 class="miniTitle">내용</h4>
		<textarea class="inputDetail" name="content" cols="70" rows="16"></textarea>
		<div class="btnWrap">
			<button type="submit">작성 완료</button>
			<button type="reset">다시 작성</button>
		</div>	
	</form>
</div>

<%@include file="../includes/footer.jsp" %>

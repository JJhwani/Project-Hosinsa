<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="mainWrap">
	<div class="form-group">
		<h2>${event.title}</h2>
		<h5>기간
			<fmt:formatDate pattern="yyyy-MM-dd" value="${event.start_date}"></fmt:formatDate>~
			<fmt:formatDate pattern="yyyy-MM-dd" value="${event.end_date}"></fmt:formatDate>
		</h5>
		<button data-oper="modify" class="btn btn-default btn-info">Modify</button>
		<button data-oper="list" class="btn btn-default">List</button>
		<br><br>
		<img src="${event.content}">
	</div>
	<form class="paging" action="/board/event/modify" method="get">
		<input type="hidden" name="event_no" value="${event.event_no}">
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}">
	</form>					
</div>

<script src="../../../resources/js/board.js"></script>

<%@ include file="../includes/footer.jsp" %>
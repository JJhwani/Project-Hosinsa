<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="mainWrap">
	<div class="eventRead">
		<h2>${event.title}</h2>
		<h5>기간
			<fmt:formatDate pattern="yyyy-MM-dd" value="${event.start_date}"></fmt:formatDate>~
			<fmt:formatDate pattern="yyyy-MM-dd" value="${event.end_date}"></fmt:formatDate>
		</h5>
		<input type="hidden" name="event_no" value="${event.event_no}">
		<button class="modify">수정</button>
		<button class="delete">삭제</button>
		<br><br>
		<img src="${event.content}">
	</div>
	<form class="paging" action="/board/event/modify" method="post">
		<input type="hidden" name="event_no" value="${event.event_no}">
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}">
	</form>	
	<form class="eventForm" action="/board/event/modify" method="get">
		<input type="hidden" name="event_img" value="">
	</form>				
</div>

<script src="../../../resources/js/board.js"></script>

<%@ include file="../includes/footer.jsp" %>
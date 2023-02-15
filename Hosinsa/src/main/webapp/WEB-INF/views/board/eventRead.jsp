<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<div class="mainWrap">
	<div class="eventRead">
		<h2>${event.title}</h2>
		<h5>기간
			<fmt:formatDate pattern="yyyy-MM-dd" value="${event.start_date}"></fmt:formatDate>~
			<fmt:formatDate pattern="yyyy-MM-dd" value="${event.end_date}"></fmt:formatDate>
		</h5>
		<c:if test="${member.grade eq 'S'}">
			<button class="btn modify">수정</button>
			<button class="btn list">뒤로</button>
		</c:if>
		<br><br>
		<img src="${event.content}">
	</div>
	<form class="eventForm" action="/board/event/modify" method="post">
		<input type="hidden" name="event_no" value="${event.event_no}">
		<input type="hidden" name="event_img" value="${event.event_img}">
	</form>
</div>

<script src="../../../resources/js/board.js"></script>

<%@ include file="../includes/footer.jsp" %>
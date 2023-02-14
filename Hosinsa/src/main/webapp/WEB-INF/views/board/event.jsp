<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<div class="mainWrap">
	<h2 class="bigTitle">이벤트 페이지
		<c:if test="${member.grade eq 'S'}">
			<a class="register" href="/board/event/register">이벤트 등록</a>
		</c:if>
	</h2>
	<div class="eventView">
		<section class="eventList">
			<c:forEach var="event" items="${event}">
	 			<div class="event_box">
					<c:choose>
						<c:when test="${event.start_date <= today and today <= event.end_date}">
							<div class="event_img">
								<p>진행중 이벤트</p>
								<a class="move" href="${event.event_no}">
									<img src="${event.event_img}" width="250px" height="200px">
								</a>
							</div>
							<div class="event_info">
								<span class="period">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${event.start_date}"></fmt:formatDate>~
									<fmt:formatDate pattern="yyyy-MM-dd" value="${event.end_date}"></fmt:formatDate>
								</span>
								<p class="title">${event.title}</p>
								<p class="subtext">${event.subtext}</p>							
							</div>
						</c:when>
						<c:when test="${event.start_date <= today and event.end_date <= today}">
							<div class="event_img">
								<p>완료된 이벤트</p>
								<a class="move" href="${event.event_no}">
									<img src="${event.event_img}" width="250px" height="200px">
								</a>
							</div>
							<div class="event_info">
								<span class="period">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${event.start_date}"></fmt:formatDate>~
									<fmt:formatDate pattern="yyyy-MM-dd" value="${event.end_date}"></fmt:formatDate>
								</span>
								<p class="title">${event.title}</p>
								<p class="subtext">${event.subtext}</p>							
							</div>
						</c:when>
					</c:choose>
				</div>
				
	 		</c:forEach>
		</section>
	</div>

	<!-- 페이지 처리 시작 -->
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}"><a href="${num}">${num}</a></li>							
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a></li>
		</c:if>
	</ul>
	<form class="paging" action="/event/list" method="post">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>	



</div>

<script src="../../../resources/js/board.js"></script>

<%@ include file="../includes/footer.jsp" %>
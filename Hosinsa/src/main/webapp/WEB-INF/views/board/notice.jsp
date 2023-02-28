<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<div class="contentWrap">
	<h2 class="bigTitle">공지사항
		<c:if test="${member.grade eq 'S'}">
			<a class="register" href="/board/notice/register">공지사항 등록</a>
		</c:if>
	</h2>

	<table class="Notice table4">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
		</thead>

		<c:forEach var="notice" items="${notice}">
			<tr>
				<td>${notice.nno}</td>
				<td>
					<a class="move" href="${notice.nno}">${notice.title}
						<b>[ ${notice.readcount} ]</b>
					</a>
				</td>
				<td>${notice.id}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regdate}"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.update_date}"/></td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="searchNotice">
		<form class="noticeSearch" action="/board/notice/search" method="get">
			<input type="text" name="b_keyword" value="${pageMaker_b.cri.b_keyword}">
			<input type="hidden" name="pageNum" value="${pageMaker_b.cri.b_pageNum}">
			<input type="hidden" name="amount" value="${pageMaker_b.cri.b_amount}">
			<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
		</form>
	</div>
	<!-- 페이지 처리 시작 -->
	<ul class="pagination board">
		<c:if test="${pageMaker_b.prev}">
			<li class="board_paginate_button previous"><a href="${pageMaker_b.startPage-1}">Previous</a></li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker_b.startPage}" end="${pageMaker_b.endPage}">
			<li class="board_paginate_button ${pageMaker_b.cri.b_pageNum == num ? 'active':''}"><a href="${num}">${num}</a></li>							
		</c:forEach>
		<c:if test="${pageMaker_b.next}">
			<li class="board_paginate_button next"><a href="${pageMaker_b.endPage+1}">Next</a></li>
		</c:if>
	</ul>
	<form class="paging board" action="/board/notice/list" method="post">
		<input type="hidden" name="b_pageNum" value="${pageMaker_b.cri.b_pageNum}">
		<input type="hidden" name="b_amount" value="${pageMaker_b.cri.b_amount}">
		<input type="hidden" name="b_type" value="${pageMaker_b.cri.b_type}">
		<input type="hidden" name="b_keyword" value="${pageMaker_b.cri.b_keyword}">
	</form>	
</div>

<script src="../../../resources/js/board.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if("${register}"==="success"){
			alert("공지사항 등록이 성공적으로 처리되었습니다.");
		}
		if("${modify}"==="success"){
			alert("공지사항 수정이 성공적으로 처리되었습니다.");
		}
		if("${remove}"==="success"){
			alert("공지사항 삭제가 성공적으로 처리되었습니다.");
		}
	});
</script>

<%@ include file="../includes/footer.jsp" %>
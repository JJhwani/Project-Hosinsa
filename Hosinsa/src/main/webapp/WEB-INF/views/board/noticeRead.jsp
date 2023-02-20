<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<div class="contentWrap">
	<form class="noticeRead" action="/board/notice/read" method="post">
		<h4 class="miniTitle">Notice Info <i>공지사항</i></h4>
		<table class="infoTable">
			<tr>
				<th> 번호 </th>
				<td><input type="text" name="nno" value="${notice.nno}" style="width:327px" readonly></td>
			</tr>
			<tr>
				<th> 작성자 </th>
				<td><input type="text" name="id" value="${notice.id}" style="width:327px" readonly></td>
			</tr>			
			<tr>
				<th> 타이틀 </th>
				<td><input type="text" name="title" value="${notice.title}" style="width:327px" readonly></td>
			</tr>
			<tr>
				<th> 등록일 </th>
				<td>
					<input type="date" name="regdate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${notice.regdate}'/>" style="width:330px" readonly>
				</td>
			</tr>
			<tr>
				<th> 수정일 </th>
				<td>
					<input type="date" name="update_date" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${notice.update_date}'/>" style="width:330px" readonly>
				</td>
			</tr>
		</table>
		<h4 class="miniTitle">상세정보</h4>
		<textarea class="inputDetail" name="content" cols="70" rows="16" readonly>${notice.content}</textarea>
		<div class="noticeBtn">
			<c:if test="${member.grade eq 'S'}">
				<button class="btn modify">공지사항 수정</button>
			</c:if>
			<button class="btn list">뒤로</button>
		</div>
		<input type="text" name="b_keyword" value="${pageMaker_b.cri.b_keyword}">
		<input type="text" name="b_pageNum" value="${pageMaker_b.cri.b_pageNum}">
		<input type="text" name="b_amount" value="${pageMaker_b.cri.b_amount}">
	</form>
</div>

<script src="../../../resources/js/board.js"></script>

<%@ include file="../includes/footer.jsp" %>
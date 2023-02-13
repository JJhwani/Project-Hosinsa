<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="mainWrap">
	<div class="form-group">
		<form role="form" action="/board/modify" enctype="multipart/form-data" method="post">
			<div class="imgWrap">
				<img class="event_img" src="${event.event_img}">
				<input type="file" name="uploadFile" class="event_imgFile hidden">
			</div>
			<input type="hidden" name="event_img">
			<h4 class="miniTitle">Event Info <i>이벤트 정보</i></h4>
			<table>
				<tr>
					<th> 타이틀 </th>
					<td><input type="text" name="title" value="${event.title}"></td>
				</tr>
				<tr>
					<th> 시작일 </th>
					<td>
						<input type="date" name="start_date" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${event.start_date}'/>">
					</td>				
				</tr>
				<tr>
					<th> 종료일 </th>
					<td>
						<input type="date" name="end_date" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${event.end_date}'/>">
					</td>
				</tr>
			</table>
			<h4 class="miniTitle">상세정보</h4>
			<textarea class="inputDetail" name="detail" cols="70" rows="16">${event.content}</textarea>
			<div class="btnWrap right">
				<button class="btn register">이벤트 수정</button>
				<button class="btn delete">이벤트 삭제</button>
				<button class="btn list">뒤로</button>
			</div>
		</form>
	</div>					
</div>

<script src="../../../resources/js/board.js"></script>

<%@ include file="../includes/footer.jsp" %>
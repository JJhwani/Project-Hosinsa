<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

<h1>리뷰 작성하기</h1>


<form role="form" action="/review/register" method="post">
	<input type="hidden" name="nickname" value="${member.nickname }">
	<div class="form-group">	
		<label>제목</label> <input class="form-control" name="title">
	</div>
	
	<div class="form-group">
		<label>내용</label> 
		<textarea class="form-control" rows="5" name="content"></textarea>
	</div>
	<button type="submit">submit</button>
	<button type="reset">reset</button>
</form>


<%@include file="../includes/footer.jsp" %>

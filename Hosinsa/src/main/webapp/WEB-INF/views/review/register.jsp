<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

<h1>리뷰 작성</h1>


<form role="form" action="/review/register" method="post">
	<div class="form-group">
		
	
		<label>Title</label> <input class="form-control" name="title">
	</div>
	
	<div class="form-group">
		<label>Text area</label> 
		<textarea class="form-control" rows="5" name="content"></textarea>
	</div>
	
	<div class="form-group">
		<label>Nickname</label> <input class="form-control" name="nickname">
	</div>
	
	
	<button type="submit">submit</button>
	<button type="reset">reset</button>
</form>


<%@include file="../includes/footer.jsp" %>

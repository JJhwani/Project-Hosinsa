<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@include file="../includes/header.jsp"%>


<div class="container">
	<h2>공지사항 등록</h2>

	<form role="form" action="/notice/register" method="post">
		<div class="form-group">
			<label for="ntitle">제목</label> 
			<input class="form-control" placeholder="제목을 입력하세요." name='ntitle'>
		</div>

		<div class="form-group">
			<label for="ncontent">내용</label>
			<textarea class="form-control" rows="10" placeholder="내용을 입력하세요."
				name='ncontent'></textarea>
		</div>

		<div class="form-group">
			<label for="id">작성자</label> 
			<input class="form-control" placeholder="ID를 입력하세요." name='id'>
		</div>
		<div style="display: inline-block; margin: 0 5px; float: right;">
			<button type="reset" class="btn btn-default">취소</button>
			<button type="submit" class="btn">등록</button>
		</div>

	</form>

</div>



<%@include file="../includes/footer.jsp"%>
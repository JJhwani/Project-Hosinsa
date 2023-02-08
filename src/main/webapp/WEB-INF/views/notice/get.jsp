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
<%-- <%@include file="../includes/header.jsp"%> --%>

<div class="container">
	<h2>공지사항 조회</h2>

	<div class="form-group">
		<label>번호</label> <input class="form-control" name='nno'
			value='<c:out value="${notice.nno }"/>' readonly="readonly">
	</div>

	<div class="form-group">
		<label>제목</label> <input class="form-control" name='ntitle'
			value='<c:out value="${notice.ntitle }"/>' readonly="readonly">
	</div>

	<div class="form-group">
		<label>내용</label>
		<textarea class="form-control" rows="10" name='ncontent'
			readonly="readonly"><c:out value="${notice.ncontent}" /></textarea>
	</div>

	<div class="form-group">
		<label>작성자</label> <input class="form-control" name='id'
			value='<c:out value="${notice.id }"/>' readonly="readonly">
	</div>


	<div style="display: inline-block; margin: 0 5px; float: right;">
		<button data-oper='list' class="btn btn-default"
			onclick="location.href='/notice/list'">목록</button>
		<button data-oper='modify' class="btn"
			onclick="location.href='/notice/modify?nno=<c:out value="${notice.nno}"/>'">수정
		</button>
	</div>

	<form id='operForm' action="/notice/modify" method="get">
		<input type='hidden' id='nno' name='nno'
			value='<c:out value="${notice.nno}"/>'> <input type='hidden'
			name='pageNum' value='<c:out value="${cri.pageNum}"/>'> <input
			type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
		<input type='hidden' name='keyword'
			value='<c:out value="${cri.keyword}"/>'> <input type='hidden'
			name='type' value='<c:out value="${cri.type}"/>'>

	</form>

</div>
<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/notice/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#nno").remove();
			operForm.attr("action", "/notice/list")
			operForm.submit();

		});
	});
</script>
<%-- <%@include file="../includes/footer.jsp"%> --%>
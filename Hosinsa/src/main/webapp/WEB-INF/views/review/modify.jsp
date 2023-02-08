<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form role="form" action="/review/modify" method="post">
		
		<div class="form-group">
			<label>Bno</label>
			<input class="form-control" name="bno" value="${review.bno }" readonly>
		</div>
		
		<div class="form-group">
			<label>Title</label>
			<input class="form-control" name="title" value="${review.title }">
		</div>
		
		<div class="form-group">
			<label>Text area</label>
			<textarea class="form-control" rows="5" name="content" value="${review.content }"></textarea>
		</div>
		
		<div class="form-group">
			<label>Nickname</label>
			<input class="form-control" name="nickname" value="${review.nickname }" readonly>
		</div>
		
		<div class="form-group">
			<label>Update Date</label>
			<input class="hidden" name="uploadDate" 
						value='<fmt:formatDate pattern ="yyyy/MM/dd" value="${review.uploadDate }"/>' readonly>
		</div>
			
			<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
			<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
			<button type="submit" data-poer='list' class="btn btn-info">List</button>
	
	</form>


<script type="text/javascript">

	$(document).ready(function() {

	var formObj = $("form");

	$('button').on("click", function(e) {

		e.preventDefault();

		var operation = $(this).data("oper");

		console.log(operation);

		if(operation === 'remove') {
			formObj.attr("action","/review/remove");
		}else if(operation === 'list') {
			formObj.attr("action","/review/list").attr("method","get");
			formObj.empty();
			
		}

		formObj.submit();
	});
});

</script>

<%@include file="../includes/footer.jsp" %>

</body>
</html>
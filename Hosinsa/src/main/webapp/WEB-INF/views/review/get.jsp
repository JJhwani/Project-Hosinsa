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

<h1>get</h1>

		<div class="form-group">
			<label>Bno</label><input class="form-control" name='bno' value="${review.bno}" readonly>
		</div>
		
		<div class="form-group">
			<label>Title</label><input class="form-control" name='bno' value="${review.title}" readonly>
		</div>
		
		<div class="form-group">
			<label>Text area</label><textarea class="form-control" rows="5" name='content' readonly> ${review.content} </textarea>
		</div>
		
		<div class="form-group">
			<label>Nickname</label><input class="form-control" name='nickname' value="${review.nickname}" readonly>
		</div>
		
		
		<button data-oper='modify' class="btn btn-default" 
					onclick="location.href='/review/modify?bno=${review.bno }'">modify</button>
		<button data-oper='list' class="btn btn-info" 
					onclick="location.href='/review/list'">List</button>

		<form action='operForm' action="/review/modify" method="get">
			<input type='hidden' id='bno' name='bno' value="${review.bno }">
			<input type='hidden' name='pageNum' value="${cri.pageNum }">
			<input type='hidden' name='amount' value="${cri.amount }">
			<input type='hidden' name='keyword' value="${cri.keyword }">
			<input type='hidden' name='type' value="${cri.type }">
			
			
		</form>

<script type="text/javascript">

		$(document).ready(function() {
		
		var operForm = $("#operForm");
	
		$("button[data-oper='modify']").on("click", function(e){
	
			operForm.attr("action","/review/modify").submit();
	
		});
	
		$("button[data-oper='list']").on("click",function(e){
	
			operForm.find("#bno").remove();
			operForm.attr("action","/review/lsit");
			operForm.submit();
		});
	});	
	
</script>



<%@include file="../includes/footer.jsp" %>

</body>
</html>
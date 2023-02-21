<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<div class="productInfo">
	<img src="${product.proimg }">
	<div>${product.proname }</div>
	<div>${product.brand }</div>
	<div>${product.price }</div>
</div>
	<form role="form" action="/review/modify" method="post">		
		<div class="form-group">
			<input type="hidden" name="bno" value="${review.bno }">
		</div>
		
		<div class="form-group">
			<label>제목</label>
			<input class="form-control" name="title" value="${review.title }">
		</div>
		
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="5" name="content">${review.content}</textarea>
		</div>			
			<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
			<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='list' class="btn btn-info">돌아가기</button>	
	</form>


<script type="text/javascript">

	$(document).ready(function() {

	var formObj = $("form");

	$('button').on("click", function(e) {

		e.preventDefault();

		var operation = $(this).data("oper");

		if(operation === 'remove') {			
			formObj.attr("action","/review/remove");
		}else if(operation === 'modify') {
			formObj.attr("action","/review/modify");
		}else if(operation === 'list') {
			formObj.empty();
			formObj.attr("action","/member/myPage").attr("method","get");
		}
		
		formObj.submit();
	});
});

</script>

<%@include file="../includes/footer.jsp" %>

</body>
</html>
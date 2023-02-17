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
	<h2>문의사항 수정</h2>

	<form role="form" action="/qna/modify" method="post">

		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'> 
		<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
 		<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>


		<div class="form-group">
			<label>번호</label> <input class="form-control" name='qno'
				value='<c:out value="${qna.qno }"/>' readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>구분</label> <input class="form-control" name='qcategory'
				value='<c:out value="${qna.qcategory }"/>' readonly="readonly">
		</div>
		
		
		<div class="form-group">
			<label>제목</label> <input class="form-control" name='qtitle'
				value='<c:out value="${qna.qtitle }"/>'>
		</div>

		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="10" name='qcontent'><c:out
					value="${qna.qcontent}" /></textarea>
		</div>

		<div class="form-group">
			<label>작성자</label> <input class="form-control" name='id'
				value='<c:out value="${qna.id}"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>작성일</label> <input class="form-control" name='nwritedate'
				value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${qna.qwritedate}" />'
				readonly="readonly">
		</div>


		<div style="display: inline-block; margin: 0 5px; float: right;">
		<button type="submit" data-oper='modify' class="btn">수정</button>
		<button type="submit" data-oper='list' class="btn btn-default">목록</button>
<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
			
		</div>
	</form>


</div>



<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/qna/remove");

			} else if (operation === 'list') {
				
				formObj.attr("action", "/qna/list").attr("method", "get");

				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone(); 

				formObj.empty();

				formObj.append(pageNumTag);
				formObj.append(amountTag);
  				formObj.append(keywordTag);
				formObj.append(typeTag); 
			}

			formObj.submit();
		});

	});
</script>

<%@include file="../includes/footer.jsp"%>
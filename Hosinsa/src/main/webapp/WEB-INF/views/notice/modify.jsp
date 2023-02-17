<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%> 

<div class="container">
	<h2>공지사항 수정</h2>

	<form role="form" action="/notice/modify" method="post">

		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'> 
		<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
 		<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>


		<div class="form-group">
			<label>번호</label> <input class="form-control" name='nno'
				value='<c:out value="${notice.nno }"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>제목</label> <input class="form-control" name='ntitle'
				value='<c:out value="${notice.ntitle }"/>'>
		</div>

		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="10" name='ncontent'><c:out
					value="${notice.ncontent}" /></textarea>
		</div>

		<div class="form-group">
			<label>작성자</label> <input class="form-control" name='id'
				value='<c:out value="${notice.id}"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>작성일</label> <input class="form-control" name='nwritedate'
				value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.nwritedate}" />'
				readonly="readonly">
		</div>

		<div class="form-group">
			<label>수정일</label> <input class="form-control" name='nupdatedate'
				value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.nupdatedate}" />'
				readonly="readonly">
		</div>

		<button type="submit" data-oper='modify' class="btn">수정</button>
		<button type="submit" data-oper='list' class="btn btn-default">목록</button>
		<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>

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
				formObj.attr("action", "/notice/remove");

			} else if (operation === 'list') {
				
				formObj.attr("action", "/notice/list").attr("method", "get");

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
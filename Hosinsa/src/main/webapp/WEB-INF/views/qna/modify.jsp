<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" href="../../../resources/css/hosinsa.css">

<div class="container">
	<h2>문의사항 수정</h2>

	<!-- 검색 처리 -->
	<form role="form" action="/qna/modify" method="post"
		enctype="multipart/form-data">
		<input type='hidden' name='pageNum'
			value='<c:out value="${cri.pageNum }"/>'> <input
			type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
		<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword'
			value='<c:out value="${cri.keyword }"/>'>


		<div class="form-group">
			<label>번호</label> <input class="form-control" name='qno'
				value='<c:out value="${qna.qno }"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>구분</label> <input class="form-control" name='category'
				value='<c:out value="${qna.category }"/>' readonly="readonly">
		</div>


		<div class="form-group">
			<label>제목</label> <input class="form-control" name='title'
				value='<c:out value="${qna.title }"/>'>
		</div>

		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="10" name='content'><c:out
					value="${qna.content}" /></textarea>
		</div>

		<div class="form-group">
			<label>작성자</label> <input class="form-control" name='id'
				value='<c:out value="${qna.id}"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>작성일</label> <input class="form-control" name='regdate'
				value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${qna.regdate}" />'
				readonly="readonly">
		</div>

		<!-- accept="image/*" 업로드에 이미지만 허용함 파일 업로드할떼 이미지 이외에 선택 불가-->
		<input type='file' name='photoUpload' id="photoUpload"
			accept="image/*" multiple>

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

<script>
	$(document).ready(function() {

		$(".modify").on("click", function() {

			const photo = $("#photoUpload")
			if (photo[0].files.length > 3) {
				alert("이미지는 3장 이상 업로드 불가합니다.");
				location.reload();
			} else {
				confirm("업로드 성공");
			}
		});
	});
</script>


<%@include file="../includes/footer.jsp"%>
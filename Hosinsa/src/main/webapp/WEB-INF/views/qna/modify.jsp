<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<div class="contentWrap">
	<form role="form" action="/qna/modify" method="post" class="noticeRead" enctype="multipart/form-data">
		<h4 class="miniTitle">문의사항 수정</h4>
		
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'> 
		<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
 		<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
		<table class="infoTable">
			<tr>
				<th> 번호 </th>
				<td><input type="text" name="qno" value="${qna.qno }" style="width:327px" readonly></td>
			</tr>
			<tr>
				<th> 카테고리 </th>
				<td><input type="text" name="category" value="${qna.category }" style="width:327px"></td>
			</tr>			
			<tr>
				<th> 제목 </th>
				<td><input type="text" name="title" value="${qna.title }" style="width:327px"></td>
			</tr>
			<tr>
				<th> 작성자 </th>
				<td><input type="text" name="id" value="${qna.id }" style="width:327px" readonly></td>
			</tr>
			<tr>
				<th> 등록일 </th>
				<td>
					<input type="date" name="regdate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${qna.regdate}'/>" style="width:330px" readonly>
				</td>
			</tr>
		</table>
		<h4 class="miniTitle">내용</h4>
		<textarea class="inputDetail" name="content" cols="70" rows="16">${qna.content}</textarea>
		
		<div class="align_center">
		<input type="hidden" name="photo1" value="${qna.photo1 }">
         <input type="hidden" name="photo2" value="${qna.photo2 }">
         <input type="hidden" name="photo3" value="${qna.photo3 }">
         <!-- accept="image/*" 업로드에 이미지만 허용함 파일 업로드할때 이미지 이외에 선택 불가-->
         <input type='file' name='photoUpload' id="photoUpload"accept="image/*" multiple>
         
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
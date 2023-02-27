<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<div class="contentWrap">
	<form role="form" action="/qna/modify" method="post" class="noticeRead">
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
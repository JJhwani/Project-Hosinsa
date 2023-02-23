<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<div class="contentWrap reviewForm">
	<h2 class="bigTitle">리뷰 수정</h2>
	<h4 class="miniTitle">Product Info <i>제품 정보</i></h4>
	<img class="proimg" src="${product.proimg }">
	<table class="infoTable">
		<tr>
			<th>제품명</th>
			<td>${product.proname }</td>
		</tr>
		<tr>
			<th>브랜드</th>
			<td>${product.brand }</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${product.price }</td>
		</tr>
	</table>
	<form role="form" action="/review/modify" method="post">
		<input type="hidden" name="bno" value="${review.bno }">
		<h4 class="miniTitle">제목</h4>
		<input type="text" name="title" value="${review.title }">
		<h4 class="miniTitle">내용</h4>
		<textarea class="inputDetail" name="content" cols="70" rows="16">${review.content}</textarea>
		<div class="btnWrap">
			<button data-oper="modify" class="btn modify">리뷰 수정</button>
			<button data-oper="remove" class="btn remove">리뷰 삭제</button>
			<button data-oper="list" class="btn list">뒤로</button>
		</div>	
	</form>
	<script type="text/javascript">
	
		$(document).ready(function() {
	
		var formObj = $("form");
	
		$('button').on("click", function(e) {
	
			e.preventDefault();
	
			var operation = $(this).data("oper");
	
			if(operation === 'remove') {
				if(confirm("정말로 리뷰를 삭제하시겠습니까?")){
					formObj.attr("action","/review/remove");
				}else{
					return false;
				}				
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
</div>
<%@include file="../includes/footer.jsp" %>

</body>
</html>
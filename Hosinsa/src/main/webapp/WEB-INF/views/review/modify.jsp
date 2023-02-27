<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form role="form" action="/review/modify" method="post" enctype="multipart/form-data"> 
		<input type="hidden" name="bno" value="${review.bno }">
		<input type="hidden" name="id" value="${review.id }"> <!-- 리뷰수정시 id를 첨부파일 앞에 붙여주는 히든값 -->
		<h4 class="miniTitle">제목</h4>
		<input type="text" name="title" value="${review.title }">
		<h4 class="miniTitle">내용</h4>
		<textarea class="inputDetail" name="content" cols="70" rows="16">${review.content}</textarea>
		<div class="btnWrap">
			<input type="hidden" name="photo1" value="${review.photo1 }">
			<input type="hidden" name="photo2" value="${review.photo2 }">
			<input type="hidden" name="photo3" value="${review.photo3 }">
			<!-- accept="image/*" 업로드에 이미지만 허용함 파일 업로드할떼 이미지 이외에 선택 불가-->
			<input type='file' name ='photoUpload' id="photoUpload" accept="image/*" multiple> 
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
	
	<script>
	$(document).ready(function(){
		
		$(".modify").on("click",function(){
	
		const photo = $("#photoUpload") 
		if(photo[0].files.length > 3) {
				alert("이미지는 3장 이상 업로드 불가합니다.");
				location.reload();
			}else{
				//confirm("업로드 성공");
			}
		});
	});
	</script>
	
	
</div>
<%@include file="../includes/footer.jsp" %>

</body>
</html>
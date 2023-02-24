<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../includes/header.jsp" %>

<h1>리뷰 작성하기</h1>

<p>이 상품은 어떠셨나요?</p>

<div class="productInfo">
	<img src="${product.proimg }">
	<div>${product.proname }</div>
	<div>${product.brand }</div>
	<div>${product.price }</div>
</div>


<form role="form" action="/review/register" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${member.id}">
	<input type="hidden" name="pronum" value="${product.pronum }">
	<input type="hidden" name="ordernum" value="${ordernum }">
	<div class="form-group">	
		<label>제목</label> <input class="form-control" name="title">
	</div>	
	<div class="form-group">
		<label>내용</label> 
		<textarea class="form-control" rows="5" name="content"></textarea>
	</div>
	
		<!-- accept="image/*" 업로드에 이미지만 허용함 파일 업로드할떼 이미지 이외에 선택 불가-->
	<input type='file' name ='photoUpload' id="photoUpload" accept="image/*" multiple> 
	
	<button type="submit" id="submit">submit</button>
	<button type="reset">reset</button>
</form>



	<!-- 포토리뷰 작성시 이미지 3장 이상 업로드 불가 스크립트 -->
	<script>
	$(document).ready(function(){
		$("#submit").on("click",function(){
	
		const photo = $("#photoUpload") 
		if(photo[0].files.length > 3) {
			alert("이미지는 3장 이상 업로드 불가합니다.");
			return false;		
			}else{
			confirm("업로드 성공");
			}
		});
	});
	</script>



<%@include file="../includes/footer.jsp" %>

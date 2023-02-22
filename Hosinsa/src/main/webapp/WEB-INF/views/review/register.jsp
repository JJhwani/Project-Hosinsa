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

<form role="form" action="/review/register" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data 사진 업로드 추가 -->
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
	
	<input type='file' name ='photoUpload' id="photoUpload" multiple>
	
	<button type="submit">submit</button>
	<button type="reset">reset</button>
</form>

<script>

	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
		function(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("#photoUpload").on("click", function(e) {
		
	})
  
  
</script>



<%@include file="../includes/footer.jsp" %>

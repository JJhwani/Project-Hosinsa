<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="contentWrap">
	<form action="/admin/modify" enctype="multipart/form-data" method="post">
		<h2 class="productName">제품명 : <input type="text" name="proname" value="${product.proname}"></h2>
		<div class="imgWrap">
			<img class="proimg" src="${product.proimg}">
			<input type="file" name="uploadFile" class="proimgFile hidden">
		</div>
		<input type="text" name="proimg">
		<h4 class="miniTitle">Product Info <i>제품정보</i></h4>
		<table class="infoTable">
			<tr>
				<th> 카테고리 </th> <td> <input type="text" name="category" value="${product.category}" readonly> </td>
			</tr>
			<tr>
				<th> 품번 </th> <td><input type="text" name="pronum" value="${product.pronum}" readonly></td>
			</tr>
			<tr>
				<th> 브랜드 </th> <td><input type="text" name="brand" value="${product.brand}"></td>
			</tr>
			<tr>
				<th> 재고 </th> <td><input type="number" name="stock" value="${product.stock}"></td>
			</tr>
		</table>
		<h4 class="miniTitle">Price Info <i>가격정보</i></h4>
		<table class="infoTable">	
			<tr>
				<th> 가격 (비회원) </th> <td><input type="number" name="price" value="${product.price}"></td>
			</tr>		
		</table>		
		<h4 class="miniTitle">상세정보</h4>
		<textarea class="inputDetail" name="detail" cols="70" rows="16">${product.detail }</textarea>
		<div class="btnWrap right">
			<button class="btn modify">제품 수정</button>
			<button class="btn delete">제품 삭제</button>
			<button class="btn list">뒤로</button>
		</div>
	</form>
</div>


<script type="text/javascript">
	
$(document).ready(function(){
	
var registerForm = $(".registerForm");
	
	$("input[name='proimg']").val($(".proimg").attr("src"));
	
	$(".proimg").on("click",function(e){
		$(".proimgFile").click();
	})
	
	//업로드 이미지 미리보기
	$(".proimgFile").change(function() {
        readURL(this);
    });
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('.proimg').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
	
	$(".btn.list").on("click",function(e){		
		e.preventDefault();
		history.go(-1);
	})
});
</script>
	
<%@ include file="../includes/footer.jsp" %>
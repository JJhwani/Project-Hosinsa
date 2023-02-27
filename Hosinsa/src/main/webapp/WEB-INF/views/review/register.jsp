<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../includes/header.jsp" %>
<div class="contentWrap reviewForm">
<h2 class="bigTitle">리뷰 작성하기</h2>
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
<form role="form" action="/review/register" method="post" enctype="multipart/form-data"> 
	<input type="hidden" name="id" value="${member.id}">
	<input type="hidden" name="pronum" value="${product.pronum }">
	<input type="hidden" name="ordernum" value="${ordernum }">
	<h4 class="miniTitle">제목</h4>
	<input type="text" name="title">
	<h4 class="miniTitle">내용</h4>
	<textarea class="inputDetail" name="content" cols="70" rows="16"></textarea>
	<div class="btnWrap">
		<input type='file' name ='photoUpload' id="photoUpload" accept="image/*" multiple> 
		<button type="submit" id="submit" class="black">작성 완료</button>
		<button type="reset">다시 작성</button>
		<a href="/member/myPage">마이페이지로</a>
	</div>	
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
</div>

<%@include file="../includes/footer.jsp" %>

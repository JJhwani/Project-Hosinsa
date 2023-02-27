<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" href="../../../resources/css/hosinsa.css">

<div class="container">
	<h2>문의하기</h2>

	<form role="form" action="/qna/register" method="post"
		enctype="multipart/form-data">

		<div>
			<label for="category">구분</label> <select name='category'>
				<option>상품문의</option>
				<option>배송문의</option>
				<option>결제문의</option>
				<option>기타문의</option>
			</select>
		</div>


		<div class="form-group">
			<label for="title">제목</label> <input class="form-control"
				placeholder="제목을 입력하세요." name='title'>
		</div>


		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" rows="10"
				placeholder="현재 문의량 증가와 코로나19 재확산 영향으로 답변이 일부 지연되고 있습니다.
고객님들의 문의사항을 빠르게 답변하기 위해 최선을 다하고 있으니 너그러운 마음으로 양해 부탁드립니다."
				name='content'></textarea>
		</div>

		<div class="form-group">
			<label for="id">작성자</label> <input class="form-control"
				placeholder="ID를 입력하세요." name='id'>
		</div>

		<!-- accept="image/*" 업로드에 이미지만 허용함 파일 업로드할 때 이미지 이외에 선택 불가-->
		<input type='file' name='photoUpload' id="photoUpload"
			accept="image/*" multiple>

		<button type="reset" class="btn btn-default">취소</button>
		<button type="submit" class="btn">등록</button>

	</form>
</div>

<!-- 포토리뷰 작성시 이미지 3장 이상 업로드 불가 스크립트 -->
<script>
	$(document).ready(function() {
		$("#submit").on("click", function() {

			const photo = $("#photoUpload")
			if (photo[0].files.length > 3) {
				alert("이미지는 3장 이상 업로드 불가합니다.");
				return false;
			} else {
				confirm("업로드 성공");
			}
		});
	});
</script>



<%@include file="../includes/footer.jsp"%>
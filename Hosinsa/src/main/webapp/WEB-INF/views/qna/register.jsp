<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="contentWrap">
	<h2 class="bigTitle">문의하기</h2>
	<form role="form" action="/qna/register" method="post" class="array_center" enctype="multipart/form-data">
		<table class="infoTable qnaTable">
			<tr>
				<th> 구분 </th>
				<td><select name='category'>
					<option>상품문의</option>
					<option>배송문의</option>
					<option>결제문의</option>
					<option>기타문의</option>
				</select></td>
			</tr>
			<tr>
				<th> 작성자 </th>
				<td><input type="text" name="id" value="${member.id }" readonly></td>
			</tr>
			<tr>
				<th> 제목 </th>
				<td><input type="text" name="title" value=""></td>
			</tr>
		</table>
		<h4 class="miniTitle">내용</h4>
		<textarea class="inputDetail" name="content" placeholder="현재 문의량 증가와 코로나19 재확산 영향으로 답변이 일부 지연되고 있습니다. 고객님들의 문의사항을 빠르게 답변하기 위해 최선을 다하고 있으니 너그러운 마음으로 양해 부탁드립니다."cols="70" rows="16"></textarea>
		
		<!-- accept="image/*" 업로드에 이미지만 허용함 파일 업로드할 때 이미지 이외에 선택 불가-->
		<input type='file' name='photoUpload' id="photoUpload"
			accept="image/*" multiple>
		
		
		<div class="btnWrap">
			<button class="btn register">문의 등록</button>
			<a href="/qna/list">뒤로</a>
		</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%-- <%@include file="../includes/header.jsp"%> --%>


<div class="container">
	<h2>문의하기</h2>

<form role="form" action="/qna/register" method="post">

		<div>
				<label for="qcategory">구분</label> 
			
				<select name='qcategory'>

					<option>상품문의</option>
					<option>배송문의</option>
					<option>결제문의</option>
					<option>기타문의</option>
</select>
</div>

	
		<div class="form-group">
			<label for="qtitle">제목</label> 
			<input class="form-control" placeholder="제목을 입력하세요." name='qtitle'>
		</div>


		<div class="form-group">
			<label for="qcontent">내용</label>
			<textarea class="form-control" rows="10" placeholder="현재 문의량 증가와 코로나19 재확산 영향으로 답변이 일부 지연되고 있습니다.
고객님들의 문의사항을 빠르게 답변하기 위해 최선을 다하고 있으니 너그러운 마음으로 양해 부탁드립니다." name='qcontent'></textarea>
		</div>

		<div class="form-group">
			<label for="id">작성자</label> 
			<input class="form-control" placeholder="ID를 입력하세요." name='id'>
		</div>
		<div style="display: inline-block; margin: 0 5px; float: right;">
			<button type="reset" class="btn btn-default">취소</button>
			<button type="submit" class="btn">등록</button>
		</div>

	</form>

</div>



<%-- <%@include file="../includes/footer.jsp"%> --%>
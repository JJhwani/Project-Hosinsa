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
<form role="form" action="/review/register" method="post">
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
	<button type="submit">submit</button>
	<button type="reset">reset</button>
</form>


<%@include file="../includes/footer.jsp" %>

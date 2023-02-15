<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Order / Payment</h2>
	<div class="orderInfo">
		<div class="titleArea">
			<h1>배송지 입력</h1>
		</div>
		<form role="form" method="post" autocomplete="off">

			<div class="inputArea">
				<label for="">수령인</label> <input type="text" name="orderRec"
					id="orderRec" required="required" value="${member.name} }" />
			</div>

			<div class="inputArea">
				<label for="orderPhon">수령인 연락처</label> <input type="text"
					name="orderPhon" id="orderPhon" required="required" />
			</div>

			<div class="inputArea">
				<label for="userAddr1">우편번호</label> <input type="text"
					name="userAddr1" id="userAddr1" required="required" />
			</div>

			<div class="inputArea">
				<label for="userAddr2">1차 주소</label> <input type="text"
					name="userAddr2" id="userAddr2" required="required" />
			</div>

			<div class="inputArea">
				<label for="userAddr3">2차 주소</label> <input type="text"
					name="userAddr3" id="userAddr3" required="required" />
			</div>

			<div class="inputArea">
				<button type="submit" class="order_btn">주문</button>
				<button type="button" class="cancel_btn">취소</button>
			</div>

		</form>
	</div>


</body>
<%@ include file="../includes/footer.jsp"%>
</html>
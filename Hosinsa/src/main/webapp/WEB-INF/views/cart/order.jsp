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
	<%-- <div class="orderInfo"  style="border: 1px solid;">
		<div class="titleArea">
			<h1>배송지 입력</h1>
		</div>
		<div class="order_add">
			<div class="inputArea">
				<label for="">수령인</label> <input type="text" name="orderRec"
					id="orderRec" required="required" value="${member.id}" />
			</div>

			<div class="inputArea">
				<label for="orderPhon">수령인 연락처</label> <input type="text"
					name="orderPhon" id="orderPhon" required="required" value=""/>
			</div>

			<div class="inputArea">
				<label for="userAddr1">우편번호</label> <input type="text"
					name="userAddr1" id="userAddr1" required="required" value=""/>
			</div>

			<div class="inputArea">
				<label for="userAddr2">1차 주소</label> <input type="text"
					name="userAddr2" id="userAddr2" required="required" value=""/>
			</div>

			<div class="inputArea">
				<label for="userAddr3">2차 주소</label> <input type="text"
					name="userAddr3" id="userAddr3" required="required" value=""/>
			</div>

			<div class="inputArea">
				<button type="submit" class="order_btn">주문</button>
				<button type="button" class="cancel_btn">취소</button>
			</div>
		</div>
	</div>
	<br> <br>
	<div class="orderInfo"  style="border: 1px solid;">
		<div class="titleArea">
			<h1>상품정보</h1>
		</div>
		<table width="100%">
					<thead>
						<tr>
							<th>선택 <br>
							 <input type="checkbox" name="Chk_SelectAll"></th>
							<th>주문 번호</th>
							<th></th>
							<th>제품 번호</th>
							<th>제품 이름</th>
							<th>아이디</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${order}" var="cart">
							<tr class="odd gradeX">
								<td><input type="checkbox" name="Chk_List" id="Chk_List"></td>
								<td>${cart.cartnum}</td>
								<td>${cart.proimg}</td>
								<td>${cart.pronum}</td>
								<td><a class="move" href='${cart.pronum}'>
										${cart.proname} </a></td>
								<td>${cart.id}</td>
								<td>${cart.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
	</div> --%>


</body>
<%@ include file="../includes/footer.jsp"%>
</html>

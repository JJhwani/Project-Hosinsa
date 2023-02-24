<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="orderWrap">
	<h2>Order / Payment</h2>
	<div class="shippingInfo">
		<h3>배송정보</h3>
		<form class="order_form" action="/order" method="post" >
			<div class="order_address">
				<ul class="address_shipping">
					<li>배송지</li>
					<li>
						<div>
							<label><input type=radio class="check" name="shipping" checked="checked">${address.shipping}</label>
							<input type="hidden" class="hidden" name="address_no" value="${address.address_no}">
							<input type="hidden" class="hidden" name="id" value="${address.id}">
				 			<input type="hidden" class="hidden" name="recipient" value="${address.recipient}">
				 			<input type="hidden" class="hidden" name="shipping" value="${address.shipping}">
				 			<input type="hidden" class="hidden" name="phone" value="${address.phone}">
				 			<input type="hidden" class="hidden" name="tel" value="${address.tel}">
				 			<input type="hidden" class="hidden" name="zipcode" value="${address.zipcode}">
				 			<input type="hidden" class="hidden" name="address" value="${address.address}">
				 			<input type="hidden" class="hidden" name="basic" value="${address.basic}">
						</div>
						<c:forEach var="shipping" items="${shipping}" varStatus="status">									
							<div>
								<label><input type=radio class="check" name="shipping">${shipping.shipping}</label>
								<input type="hidden" class="hidden" name="address_no" value="${shipping.address_no}">
								<input type="hidden" class="hidden" name="id" value="${shipping.id}">
					 			<input type="hidden" class="hidden" name="recipient" value="${shipping.recipient}">
					 			<input type="hidden" class="hidden" name="shipping" value="${shipping.shipping}">
					 			<input type="hidden" class="hidden" name="phone" value="${shipping.phone}">
					 			<input type="hidden" class="hidden" name="tel" value="${shipping.tel}">
					 			<input type="hidden" class="hidden" name="zipcode" value="${shipping.zipcode}">
					 			<input type="hidden" class="hidden" name="address" value="${shipping.address}">
					 			<input type="hidden" class="hidden" name="basic" value="${shipping.basic}">
							</div>
					 	</c:forEach>
					 </li>
					 <li>
					 	<c:choose>
					 		<c:when test="${total == 0}">
					 			<button type="button" class="address_register">배송지 등록</button>
					 		</c:when>
					 		<c:otherwise>
					 			<button type="button" class="address_modify">배송지 변경</button>
					 		</c:otherwise>					 		
					 	</c:choose>
					</li>
				</ul>
				<ul class="address_info1">
					<li>이름 / 연락처</li>
					<li><p class="recipient">${address.recipient}</p></li>
					<li><p class="phone">${address.phone}</p></li>
					<li><p class="tel">${address.tel}</p></li>
					<li></li>
				</ul>
				<ul class="address_info2">		
					<li>주소</li>
					<li><p class="address">(${address.zipcode})&nbsp;${address.address}</p>
					<li></li>
				</ul>
				<div class="inputArea">
					<button type="submit" class="order_btn">주문</button>
					<button type="button" class="cancel_btn">취소</button>
				</div>
				
			</div>
		</form>
		<form class="popupForm" name="popupForm" action="/order/order_form" method="post" onsubmit="return false">
			<input type="hidden" name="userid" value="${member.id}">
		</form>
	</div>
	<div class="orderInfo">
		<h2>상품정보</h2>
		<table width="100%">
			<div class="order_">
				<tr>
					<th>상품정보</th>
					<th>수량</th>
					<th>제품 번호</th>
					<th>제품 이름</th>
					<th>아이디</th>
					<th>가격</th>
				</tr>
			</div>
			<div>
				<c:forEach items="${order}" var="order">
					<tr class="odd gradeX">
						<td></td>
						<td>${order.cartnum}</td>
						<td>${order.proimg}</td>
						<td>${order.pronum}</td>
						<td><a class="move" href='${order.pronum}'>
								${order.proname} </a></td>
						<td>${order.id}</td>
						<td>${order.price}</td>
					</tr>
				</c:forEach>
			</div>
		</table>
	</div>
</div>



<script src="../../../resources/js/order.js"></script>
<%@ include file="../includes/footer.jsp"%>
</html>
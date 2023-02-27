<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="orderWrap">
	<h2>Order / Payment</h2>
	<div class="shippingInfo">
		<h3>배송정보</h3>
		<form action="/order/complete" method="post" id="orderForm">
	      <div class="titleArea">
	         <input type="hidden" name="name" value="">
	         <input type="hidden" name="address" value="">
	         <input type="hidden" name="request" value="">
	         <input type="hidden" name="phone" value="">
	         <input type="hidden" name="id" value="${member.id}">
	      </div>
	         <input type="hidden" name="cartnum" value="">
	   </form>
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
			</div>
		</form>
		<form class="popupForm" name="popupForm" action="/order/order_form" method="post" onsubmit="return false">
			<input type="hidden" name="userid" value="${member.id}">
		</form>
	</div>
	<div class="orderInfo cart">
		<h4 class="miniTitle">상품정보</h4>
		<table width="100%">
				<tr>
					<th>제품 이미지</th>
					<th>제품 번호</th>
					<th>제품 이름</th>
					<th>수량</th>
					<th>가격</th>
				</tr>
				<c:set var="total" value="${0}" />
				<c:forEach items="${order}" var="order">
					<tr class="odd gradeX">
						<td class="cartnum" style="display: none">${order.cartnum}</td>
						<td><img src="${order.proimg}"></td>
						<td>${order.pronum}</td>
						<td><a class="move" href='${order.pronum}'>
								${order.proname} </a></td>
						<td>${order.quantity}</td>
						<td>${order.price}</td>
					</tr>
					<c:set var="total" value="${total + (order.quantity*order.price)}" />
				</c:forEach>
		</table>
	</div>
	<ul class="cart_info">
		<li>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
		<li>호신사 스토어는 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함 전 지역, 전 상품 무료배송입니다.</li>
		<li>해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.</li>
		<li>2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</li>
	</ul>

	<button id="payBtn" type="button" class="black">
		<span id="btn-pay_amt"> ${total} </span>원 결제하기
	</button>
	<input type="hidden" id="input">
</div>

<script>
    
$(document).ready(function() {
	$("#payBtn").on("click", function(e) {
		var total = {
				total : ${total}
		};
    	$.ajax({
			url : "/order/kakaopay", 
			dataType : "json",
			type : "POST",
			data : total,
			success:function(data){
				var box = data.next_redirect_pc_url;
				window.open(box);
			},
			error:function(error){
				alert(error);
			}
		});
    });
	
	
	var cartnum = [];
	$(".cartnum").each(function(){
		cartnum.push($(this).text());
	})
	$("#orderForm").find("input[name=cartnum]").val(cartnum);
	
});
</script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>



<script src="../../../resources/js/order.js"></script>
<%@ include file="../includes/footer.jsp"%>
</html>
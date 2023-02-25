<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="contentWrap">
	<h2>Order / Payment</h2>
	<div class="orderInfo" style="border: 1px solid;">
		<!-- 배송지 정보 -->
		<form action="/order/complete" method="post" id="orderForm">
		<div class="titleArea">
			<h1>배송지 입력</h1>
			<input type="hidden" name="name" value="sangho">
			<input type="hidden" name="address" value="sangho">
			<input type="hidden" name="request" value="sangho">
			<input type="hidden" name="phone" value="sangho">
			<input type="hidden" name="id" value="admin">
		</div>
			<input type="hidden" name="cartnum" value="">
	</form>
	</div>
	<br> <br>
	<div class="orderInfo_pro" style="border: 1px solid;">
		<!-- 결제 상품정보 -->
		<div class="titleArea">
			<h1>상품정보</h1>
		</div>
		<table width="100%">
			<tr>
					<th></th>
					<th>주문 번호</th>
					<th></th>
					<th>제품 번호</th>
					<th>제품 이름</th>
					<th>수량</th>
					<th>가격</th>
			</tr>
				<c:set var="total" value="${0}" />
				<c:forEach items="${order}" var="order">
					<tr class="odd_gradeX">
						<td></td>
						<td class="cartnum">${order.cartnum}</td>
						<td>${order.proimg}</td>
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
	<div>
		<br>
		<ul class="order_text">
			<li>· 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
			<li>· 호신사 스토어는 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함 <span>전 지역,
					전 상품 무료배송입니다.</span></li>
			<li>· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도
				표기되어 있습니다.</li>
			<li>· 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</li>
		</ul>
	</div>

	<button id="payBtn" type="button">
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



<%@ include file="../includes/footer.jsp"%>
</html>
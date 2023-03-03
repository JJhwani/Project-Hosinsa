<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
	<div class="contentWrap">
		<h2 class="bigTitle">주문 정보</h2>
		<table class="table array_center table3">
			<tr>
				<th><label>주문번호</label></th>
				<td>${order.ordernum }</td>
			</tr>
			<tr>
				<th><label>제품번호</label></th>
				<td>${order.pronum }</td>
			</tr>
			<tr>
				<th><label>제품명</label></th>
				<td><a href="/product/${order.pronum}">${order.proname }</a></td>
			</tr>
			<tr>
				<th><label>수량</label></th>
				<td>${order.quantity }</td>
			</tr>
			<tr>
				<th><label>가격</label></th>
				<td>${order.price }</td>
			</tr>
			<tr>
				<th><label>할인</label></th>
				<td>${order.sale }</td>
			</tr>
			<tr>
				<th><label>이름</label></th>
				<td>${order.name }</td>
			</tr>
			<tr>
				<th><label>주소</label></th>
				<td>${order.address }</td>
			</tr>
			<tr>
				<th><label>요청사항</label></th>
				<td>${order.request }</td>
			</tr>
			<tr>
				<th><label>연락처</label></th>
				<td>${order.phone }</td>
			</tr>
			<tr>
				<th><label>아이디</label></th>
				<td>${order.id }</td>
			</tr>
			<tr>
				<th><label>주문일</label></th>
				<td><fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${order.order_date }"></fmt:formatDate></td>
			</tr>
			<tr>
				<th><label>주문상태</label></th>
				<td class="process">${order.process}</td>
			</tr>
			<tr>
				<th><label>택배사</label></th>
				<td>${order.delivery}</td>
			</tr>
			<tr>
				<th><label>운송장번호</label></th>
				<td>${order.trackingNum}</td>
			</tr>
			<tr class="cancel hidden">
				<th><label>주문취소사유</label></th>
				<td>${order.reason}</td>
			</tr>
		</table>
		<div class="array_center align_center">
			<a href="/member/myPage">돌아가기</a>
		</div>
	</div>
	
<script>
$(document).ready(function(){
	if($(".process").text()=="주문 취소"){
		$(".cancel").removeClass("hidden");
	}
})
</script>

<%@ include file="../includes/footer.jsp"%>
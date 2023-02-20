<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="contentWrap">
	<h2 class="title">장바구니</h2>
	<div class="cart">
		<table width="100%">
			<thead>
				<tr>
					<th><input type="checkbox" name="Chk_SelectAll"></th>
					<th class="cartNum">카트번호</th>
					<th>제품 이미지</th>
					<th>제품 번호</th>
					<th>제품 이름</th>
					<th>수량</th>
					<th>이름</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="cart">
					<tr class="odd gradeX">
						<td><input type="checkbox" name="Chk_List" id="Chk_List"></td>
						<td class="cartNum">${cart.cartnum}</td>
						<td><img src="${cart.proimg}"></td>
						<td>${cart.pronum}</td>
						<td><a class="move" href='/product/${cart.pronum}'>${cart.proname}</a></td>
						<td>
							<button class="quantity_btn_minus">-</button> ${cart.quantity}
							<button class="quantity_btn_plus">+</button>
						</td>
						<td>${cart.id}</td>
						<td>${cart.price}</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<div>
			<button class="del_Btn">선택상품 삭제</button>
		</div>

		<div>
			<ul class="cart_info">
				<li>호신사는 전 상품 무료 배송입니다.</li>
				<li>2개 이상의 브랜드를 주문하신 경우, 개별 배송됩니다.</li>
				<li>결제 시 각종 할인 적용이 달라질 수 있습니다.</li>

				<li>해외배송 상품은 배송료가 추가로 발생될 수 있습니다.</li>
				<li>장바구니 상품은 최대 1년 보관(비회원 2일)되며 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
				<li>장바구니에는 최대 100개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는 100개로
					제한됩니다.</li>

				<li>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
				<li>수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준, 기존 주문
					합산)</li>
			</ul>
		</div>

		<!-- <form action="/cart/order" method="get" class="cartForm">
			<input type="hidden" name="cartnum" value="">
		</form> -->
		
		<!-- 수량 조정 form -->
		<form action="/cart/plusQuantity" method="post" class="quantity_plus_form">
			<input type="hidden" name="cartnum" value="">
		</form>
		<form action="/cart/minusQuantity" method="post" class="quantity_minus_form">
			<input type="hidden" name="cartnum" value="">
		</form>
					
					
	</div>
	<div>
		<button type="button" class="order black" id="order">주문하기</button>
		<button class="move_main">계속 쇼핑하기</button>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						/* 수량버튼 */
						$(".quantity_btn_plus").on("click", function(e) {
							var number = $(this).parent().siblings(".cartNum").text()
							$(".quantity_plus_form").find("input[name=cartnum]").val(number);
							
							$(".quantity_plus_form").submit();
						});
						$(".quantity_btn_minus").on("click",function(e) {
							var number = $(this).parent().siblings(".cartNum").text()
							$(".quantity_minus_form").find("input[name=cartnum]").val(number);
							
							$(".quantity_minus_form").submit();
						});

						// 오더 목록
						$("#order").on("click", function(e) {
							var text = $(
									"tbody input[type='checkbox']:checked")
									.parent().next().text();
							var list = $("tbody input[type='checkbox']");
							var valueArr = new Array();
							$("tbody input[type='checkbox']").each(function() {
								if ($(this).is(":checked")) { //선택되어 있으면 배열에 값을 저장함
									valueArr.push($(this).parent().next().text());
								} else {
									console.log($(this));
										}
								});
							if (valueArr.length == 0) {
								alert("선택된 상품이 없습니다.");
							} else { 
								
								$.ajax({
									url : "/cart/order", // 전송 URL
									dataType : "text",
									contentType : "application/json",
									type : "get", // GET or POST 방식
									async : false,
									data : {valueArr:JSON.stringify(valueArr)},
									success : function(data) {
										location.href="/cart/order";
									}
									});
								}
						});
						
						/* 
						if (valueArr.length == 0){
				    	alert("선택된 상품이 없습니다.");
				    }else{				
						$(".cartForm input").val(valueArr);
						$(".cartForm").submit();				
					}
						*/

						// 카트 목록 전체선택
						$(function() {
							var chkObj = document.getElementsByName("Chk_List");
							var rowCnt = chkObj.length;

							$("input[name='Chk_SelectAll']").click(function() {
								var chk_listArr = $("input[name='Chk_List']");
								for (var i = 0; i < chk_listArr.length; i++) {
									chk_listArr[i].checked = this.checked;
								}
							});
							$("input[name='Chk_List']")
									.click(
											function() {
												if ($("input[name='Chk_List']:checked").length == rowCnt) {
													$("input[name='Chk_SelectAll']")[0].checked = true;
												} else {
													$("input[name='Chk_SelectAll']")[0].checked = false;
												}
											});
						});

						// 계속 쇼핑하기 버튼
						$(".move_main").on("click", function(e) {
							self.location = "../";
						})

						// 카트삭제 버튼
						$(".del_Btn").on("click",function(e) {
							var text = $(
									"tbody input[type='checkbox']:checked")
									.parent().next().text();
							var list = $("tbody input[type='checkbox']");
							var valueArr = new Array();

							$("tbody input[type='checkbox']").each(function() {
								if (
										$(this).is(":checked")) { //선택되어 있으면 배열에 값을 저장함
										valueArr.push($(this).parent()
													.next()
													.text());
								} else {
									console
											.log($(this));
								}
							});

								if (valueArr.length == 0) {
									alert("선택된 글이 없습니다.");
								} else {

									if (!confirm("정말 삭제하시겠습니까?")) {
										alert("취소되었습니다.");
									} else {
										$.ajax({
											url : "/cart/deleteCart", // 전송 URL
											dataType : "json",
											type : 'POST', // GET or POST 방식
											async : false,
											data : {
											valueArr : valueArr //보내고자 하는 data 변수 설정
											}
									
										});
								}
							location.reload();
						}

										});
					})
</script>

<%@ include file="../includes/footer.jsp"%>
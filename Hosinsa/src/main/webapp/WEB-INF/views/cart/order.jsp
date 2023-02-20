<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="contentWrap">
	<h2>Order / Payment</h2>
	
	
	<div class="orderInfo"  style="border: 1px solid;">
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
					name="orderPhon" id="orderPhon" required="required" value="${member.phone}"/>
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
					<div class="order_">
						<tr>
							<th></th>
							<th>주문 번호</th>
							<th></th>
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
<%@ include file="../includes/footer.jsp"%>
</html>

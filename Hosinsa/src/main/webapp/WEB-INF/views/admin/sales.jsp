<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="contentWrap">
	<h2 class="bigTitle">판매관리</h2>
	<table class="adminList table1">
		<thead>
			<tr>
				<th>품번</th>
				<th>사진</th>
				<th>품명</th>
				<th>브랜드</th>
				<th>카테고리</th>
				<th>가격</th>
				<th>재고</th>
				<th>조회수</th>				
				<th>등록일자</th>
				<th>수정일자</th>
				<th>상품관리</th>
				<th>상품관리</th>
				<th>상품관리</th>
				<th>상품관리</th>
			</tr>
		</thead>
		<c:forEach var="orderList" items="${order }">
			<tr>
				<td>${order.o_no }</td>
				<td>${order.ordernum }</td>
				<td>${order.pronum }</td>
				<td>${order.proname }</td>
				<td>${order.quantity }</td>
				<td>${order.price }</td>
				<td>${order.sale }</td>
				<td>${order.name }</td>
				<td>${order.address }</td>
				<td>${order.request }</td>
				<td>${order.phone}</td>
				<td>${order.id }</td>	
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.order_date }"></fmt:formatDate></td>
				<td><button class="modify">수정</button><button class="delete">삭제</button></td>		
			</tr>
		</c:forEach>
	</table>
</div>

<%@ include file="../includes/footer.jsp" %>
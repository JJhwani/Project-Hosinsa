<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

<div class="contentWrap">
	<h2 class="title">마이페이지</h2>
	
	<h4 class="miniTitle">나의 정보</h4>
	
	<p class="grade">나의 등급 : ${member.grade }</p>
	<table class="table1 member_info">
		<tr><th>프로필이미지</th><td>${member.profilimg }</td></tr>
		<tr><th>이름</th><td>${member.name }</td></tr>
		<tr><th>아이디</th><td>${member.id }</td></tr>
		<tr><th>닉네임</th><td>${member.nickname }</td></tr>
		<tr><th>성별</th><td>${member.gender }</td></tr>
		<tr><th>생일</th><td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.birthday }"/> </td></tr>
		<tr><th>이메일</th><td>${member.email }</td></tr>
		<tr><th>연락처</th><td>${member.phone }</td></tr>
	</table>
	<button data-oper="modify" class="btn btn-default btn-info">회원정보 수정</button>
	<button data-oper="remove" class="btn btn-default">탈퇴하기</button>
	
	<form id="operForm" action="/member/modify" method="get">
		<input type="hidden" id="id" name="id" value="${member.id}">
	</form>
	
	<form id="removeForm" action="/member/remove" method="get">
		<input type="hidden" id="id" name="id" value="${member.id}">
	</form>
	
	<h4 class="miniTitle">주문내역</h4>	
	<table class="table1">
		<c:choose>
			<c:when test="${empty orderList}">
				<tr><td>주문 내역이 없습니다.</td><tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th>주문번호</th><th>주문날짜</th><th>주문상품</th><th>주문금액</th><th>진행상태</th>
				</tr>
				<c:forEach var="orderList" items="${orderList}">
					<tr>
						<td>{orderList.ordernum}</td><td>{orderList.orderDate}</td><td>{orderList.product}</td><td>{orderList.price}</td><td>{orderList.process}</td>
					</tr>
				</c:forEach>
			</c:otherwise>		
		</c:choose>		
	</table>	
</div>

<script src="../../../resources/js/member.js"></script>

<%@ include file="../includes/footer.jsp" %>
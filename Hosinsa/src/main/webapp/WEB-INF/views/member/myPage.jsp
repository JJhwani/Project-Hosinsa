<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

<div class="contentWrap">
	<h2 class="bigTitle">마이페이지</h2>
	<section class="myInfo info1">
		<h4 class="title">나의 정보</h4>
		<table class="table3 member_info">
			<tr><th>나의 등급</th><td>${member.grade }</td></tr>
			<tr><th>프로필이미지</th><td><img src="../${member.profilimg }"></td></tr>
			<tr><th>이름</th><td>${member.name }</td></tr>
			<tr><th>아이디</th><td>${member.id }</td></tr>
			<tr><th>닉네임</th><td>${member.nickname }</td></tr>
			<tr><th>성별</th><td>${member.gender }</td></tr>
			<tr><th>생일</th><td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.birthday }"/> </td></tr>
			<tr><th>이메일</th><td>${member.email }</td></tr>
			<tr><th>연락처</th><td>${member.phone }</td></tr>
		</table>
		<div class="array_center align_center">
			<button data-oper="modify" class="btn btn-default btn-info">회원정보 수정</button>
			<button data-oper="remove" class="btn btn-default">탈퇴하기</button>
		</div>	
		
		<form id="operForm" action="/member/modify" method="get">
			<input type="hidden" id="id" name="id" value="${member.id}">
		</form>
		
		<form id="removeForm" action="/member/remove" method="get">
			<input type="hidden" id="id" name="id" value="${member.id}">
		</form>
	</section>
	<section class="myInfo info2">
	<h4 class="title">주문내역</h4>	
		<table class="table3">
			<c:choose>
				<c:when test="${empty order}">
					<tr><td>주문 내역이 없습니다.</td><tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th>주문번호</th><th>주문날짜</th><th>주문상품</th><th>주문금액</th><th>진행상태</th>
					</tr>
					<c:forEach var="order" items="${order}">
						<tr>
							<td>${order.ordernum}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${order.order_date}"></fmt:formatDate></td>
							<td><a href="/product/${order.pronum}">${order.proname}</a></td>
							<td>${order.price}</td>
							<td>${order.process}</td>
						</tr>
					</c:forEach>
				</c:otherwise>		
			</c:choose>		
		</table>
	</section>
	<section class="myInfo info3">
		<h4 class="title">내 리뷰 관리</h4>
		<div class="tabWrap tab2">
			<button class="tab tab_possible">작성 가능한 리뷰</button>
			<button class="tab tab_already">내가 작성한 리뷰</button>
		</div>
		<div class="tabArea area1 reviewArea">
			<c:if test = "${empty possible}">		
				<p class='no_review'>작성 가능 리뷰가 없습니다.<br>호신사에서 쇼핑하고 첫 리뷰를 작성해 보세요!</p>
			</c:if>
			<c:forEach var="possible" items="${possible}">
				<div class="reviewWrap">
					<div class="topper">
						<img class="proimg" src="${possible.proimg}">
						<span class="ordernum">${possible.ordernum }</span>
						<b class="brand">${possible.brand }</b>
						<a href="/product/${possible.pronum }"><b>${possible.pronum }</b></a>
						<button class="review_register black">작성하기</button>
						<i>~${possible.expiredate }</i>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="tabArea area2 reviewArea hidden">
			<c:if test = "${empty already}">		
				<p class='no_review'>아직 리뷰가 없습니다.<br>호신사에서 쇼핑하고 첫 리뷰를 작성해 보세요!</p>
			</c:if>
			<c:forEach var="already" items="${already}">
				<div class="reviewWrap">
					<div class="topper">
						<img class="proimg" src="${already.proimg}">
						<span class="bno">${already.bno }</span>
						<a href="/product/{pronum}"><b>${already.proname }</b></a>
						<button class="review_modify">수정</button>
						<button class="review_delete">삭제</button>
						<i>${already.uploadDate }</i>
					</div>
					<p class="reviewTitle">${already.title }</p>
					<p class="content">${already.content }</p>
					<p class="reReplyWrap"><button class="reReply">댓글 ${already.rereply }개</button></p>
				</div>
			</c:forEach>
		</div>
		<form class="reviewForm" action="/review/register" method="get">
			<input type="hidden" name="ordernum" value="">
		</form>
	</section>
</div><!-- //contentWrap -->

<script type="text/javascript">
$(document).ready(function(){
	$(".tabWrap .tab").on("click",function(){
		if($(this).hasClass("tab_possible")){
			$(".area1").removeClass("hidden");
			$(".area2").addClass("hidden");
		}else if($(this).hasClass("tab_already")){
			$(".area1").addClass("hidden");
			$(".area2").removeClass("hidden");
		}
	})
})
</script>

<script src="../../../resources/js/member.js"></script>

<%@ include file="../includes/footer.jsp" %>
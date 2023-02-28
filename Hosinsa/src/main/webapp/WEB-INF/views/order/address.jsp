<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<div class="addressWrap">
	<h2>배송지 변경</h2>
	<button type="button" class="btn addRegister">신규 배송지 등록+</button>
	<form class="address_Form" action="/order/address/list" method="get" >
		<c:forEach var="addList" items="${addList}" varStatus="status">
			<div class="addressInfo">
				<p>
					<span>${addList.recipient}</span>&nbsp;&nbsp;<span>${addList.shipping}</span>
					<c:if test="${addList.basic eq 'O'}">
						<button type="button" class="btn basic">기본배송지</button><br>
					</c:if>
				</p>
				<p><span>${addList.phone} </span><span> | </span><span> ${addList.tel}</span></p><br>
				<p><span>(${addList.zipcode})</span><span>${addList.address1}&nbsp;${addList.address2}</span></p><br>
				<input type="hidden" class="address_no" name="address_no" value="${addList.address_no}">
				<input type="hidden" class="id" name="id" value="${addList.id}">
	 			<input type="text" class="basic" name="basic" value="${addList.basic}">	 			
	 			<button type="button" class="btn addModify">수정</button>
	 			<c:if test="${addList.basic eq 'X'}">
					<button type="button" class="btn addRemove">삭제</button>
				</c:if>
	 			<button type="button" class="btn addChoice">선택</button>
			</div>
	 	</c:forEach>
	 	<input type="hidden" id="userid" name="id" value="${id}">
	</form>
	<!-- 페이지 처리 시작 -->
	<ul class="pagination address">
		<c:if test="${pageMaker_b.prev}">
			<li class="board_paginate_button previous"><a href="${pageMaker_b.startPage-1}">Previous</a></li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker_b.startPage}" end="${pageMaker_b.endPage}">
			<li class="board_paginate_button ${pageMaker_b.cri.b_pageNum == num ? 'active':''}"><a href="${num}">${num}</a></li>							
		</c:forEach>
		<c:if test="${pageMaker_b.next}">
			<li class="board_paginate_button next"><a href="${pageMaker_b.endPage+1}">Next</a></li>
		</c:if>
	</ul>
	<form class="paging address" action="/order/address/list" method="get">
		<input type="hidden" name="b_pageNum" value="${pageMaker_b.cri.b_pageNum}">
		<input type="hidden" name="b_amount" value="${pageMaker_b.cri.b_amount}">
		<input type="hidden" name="b_type" value="${pageMaker_b.cri.b_type}">
		<input type="hidden" name="b_keyword" value="${pageMaker_b.cri.b_keyword}">
	</form>	
	<!-- 페이지 처리 끝 -->
	<form class="address_modifyForm" action="/order/address/modify" method="post" onsubmit="return false;">
	</form>
</div>

<script src="../../../resources/js/board.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	addListForm();	
	function addListForm(){
		var userid =$(".address_Form").find("input[id=userid]").val();
		$(".address_Form").action="/order/address/listForm?id="+userid;
	}
	
	if("${register}"==="success"){
		alert("주소 등록이 성공적으로 처리되었습니다.");
	}
	if("${modify}"==="success"){
		alert("주소 수정이 성공적으로 처리되었습니다.");
	}
	if("${remove}"==="success"){
		alert("주소 삭제가 성공적으로 처리되었습니다.");
	}
	
	
});
</script>
<script src="../../../resources/js/order.js"></script>

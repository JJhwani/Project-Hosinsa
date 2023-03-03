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
			<tr class="hidden">
				<th><label>주문취소사유</label></th>
				<td>${order.reason}</td>
			</tr>
		</table>
		<div class="array_center align_center">
			<button class="modify">배송</button> <button class="delete">취소</button> <a href="javascript:history.go(-1)">목록</a>
		</div>
	</div>
	
	<!-- Modal -->
 <div class="modal fade hidden" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 	<div class="modal-dialog">
 	  <div class="modal-content medium-modal">
 		<div class="modal-header">
 		  <h4 class="modal-title" id="myModalLabel">배송 관리</h4>
 		</div>
 		<div class="modal-body">
 		 <form class="salesForm" action="/admin/sales" method="post">
 		  <label class="delivery">택배사 <input name="delivery"></label>
 		  <label class="trackingNum">운송장 번호 <input name="trackingNum"></label>
 		  <label class="reason">주문 취소 사유 <input name="reason"></label>
 		  <input type="hidden" name="ordernum" value="${order.ordernum}">
 		  <input type="hidden" name="pronum" value="${order.pronum }">
 		  <input type="hidden" name="process">
 		 </form>
 		</div> 		
 		<div class="modal-footer">
 			<button id="modalRegBtn" type="button" class="btn black">작성하기</button>
 			<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
 		</div>	
 	  </div>
 	</div> 		  
 </div>
<!-- Modal 끝 -->

<script type="text/javascript">
$(document).ready(function(){
	var modal = $("#myModal");
	var closeBtn = $("#modalCloseBtn");
	
	closeBtn.on("click",function(){
		modal.find("input").val("");
		modal.addClass("hidden");
		$("body").removeClass("fix");
	})
	
	$(".array_center button").on("click",function(e){
		
		if($(this).hasClass("modify")){
			$(".reason").addClass("hidden");
			$(".delivery").removeClass("hidden");
			$(".trackingNum").removeClass("hidden");
			$("input[name=process]").val("배송중");
		}else if($(this).hasClass("delete")){
			$(".reason").removeClass("hidden");
			$(".delivery").addClass("hidden");
			$(".trackingNum").addClass("hidden");
			$("input[name=process]").val("주문취소");
		}		
		modal.removeClass("hidden");
		$("body").addClass("fix");				
	});	
	
	$("#modalRegBtn").on("click",function(){
		$(".salesForm").submit();
	})
})
</script>

<%@ include file="../includes/footer.jsp"%>
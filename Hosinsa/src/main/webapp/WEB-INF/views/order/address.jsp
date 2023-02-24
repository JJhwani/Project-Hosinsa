<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<div class="addressWrap">
	<h2>배송지 변경</h2>
	<form class="address_Form" action="/order/address" method="post" >
		<c:forEach var="addList" items="${addList}" varStatus="status">
			<div class="addressInfo">
				<span>${addList.recipient}"</span>
	 			<input type="hidden" class="hidden" name="zipcode" value="${shipping.zipcode}">
				<input type="hidden" class="hidden" name="address_no" value="${shipping.address_no}">
	 			<input type="hidden" class="hidden" name="recipient" value="${shipping.recipient}">
	 			<input type="hidden" class="hidden" name="shipping" value="${shipping.shipping}">
	 			<input type="hidden" class="hidden" name="phone" value="${shipping.phone}">
	 			<input type="hidden" class="hidden" name="tel" value="${shipping.tel}">
	 			<input type="hidden" class="hidden" name="address" value="${shipping.address}">
	 			<input type="hidden" class="hidden" name="basic" value="${shipping.basic}">
			</div>				
	 	</c:forEach>
	</form>
	<form class="address_modifyForm" action="/order/address/modify" method="post" onsubmit="return false;">
	</form>
</div>

<script src="../../../resources/js/board.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<div class="addressWrap">
	<h2>주소 추가</h2>
	<form class="address_registerForm" action="/order/address/register" method="post" >
		<table class="infoTable">
			<tr>
				<th> 이름 </th>
				<td><input type="text" name="recipient" value="" placeholder="수령인"></td>
			</tr>
			<tr>
				<th> 배송지명(선택) </th>
				<td><input type="text" name="shipping" value="" placeholder="배송지명"></td>
			</tr>
			<tr>
				<th> 휴대전화 </th>
				<td><input type="text" name="phone" value=""></td>
			</tr>
			<tr>
				<th> 전화번호 </th>
				<td><input type="text" name="tel" value=""></td>
			</tr>
			<tr>
				<th> 배송지주소 </th>
				<td><input type="text" name="zipcode" value=""></td>
				<td><input type="button" value="주소검색" onclick="addressPopup()"></td>
			</tr>
		</table>
	
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

<%@ include file="../includes/footer.jsp" %>
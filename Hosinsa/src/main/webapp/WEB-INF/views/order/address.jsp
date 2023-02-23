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
		<c:forEach var="shipping" items="${shipping}" varStatus="status">
			<c:choose>
				<c:when test="${status.index == 0}">
					<div>
						<input type=radio class="check" name="shipping" checked="checked">${shipping.shipping}</label>
						<input type="hidden" class="hidden" name="address_no" value="${shipping.address_no}">
			 			<input type="hidden" class="hidden" name="recipient" value="${shipping.recipient}">
			 			<input type="hidden" class="hidden" name="shipping" value="${shipping.shipping}">
			 			<input type="hidden" class="hidden" name="phone" value="${shipping.phone}">
			 			<input type="hidden" class="hidden" name="tel" value="${shipping.tel}">
			 			<input type="hidden" class="hidden" name="zipcode" value="${shipping.zipcode}">
			 			<input type="hidden" class="hidden" name="address" value="${shipping.address}">
			 			<input type="hidden" class="hidden" name="basic" value="${shipping.basic}">
					</div>
				</c:when>
				<c:when test="${status.index != 0}">
					<div>
						<input type=radio class="check" name="shipping"><label>${shipping.shipping}</label>
						<input type="hidden" class="hidden" name="address_no" value="${shipping.address_no}">
			 			<input type="hidden" class="hidden" name="recipient" value="${shipping.recipient}">
			 			<input type="hidden" class="hidden" name="shipping" value="${shipping.shipping}">
			 			<input type="hidden" class="hidden" name="phone" value="${shipping.phone}">
			 			<input type="hidden" class="hidden" name="tel" value="${shipping.tel}">
			 			<input type="hidden" class="hidden" name="zipcode" value="${shipping.zipcode}">
			 			<input type="hidden" class="hidden" name="address" value="${shipping.address}">
			 			<input type="hidden" class="hidden" name="basic" value="${shipping.basic}">
					</div>
				</c:when>
			</c:choose>								
	 	</c:forEach>
	</form>
	<form class="address_modifyForm" action="/order/address/modify" method="post" onsubmit="return false;">
	</form>
</div>

<script src="../../../resources/js/board.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	$(".telLabel").on("click",function(e) {
		if($("input[name='telCheck']:checkbox").is(":checked")){
			$("input[name='tel']").attr("disabled", "disabled");
		}
		else {
			$("input[name='tel']").removeAttr("disabled");
		}

	});
	
		
	function addressSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

							
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("address1").value = addr;
				
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("address2").focus();
			}
		}).open("","","top=1000,left=1000");
	}
	
	$(".registerTable .btn.search").on("click", function(e) {
		addressSearch();
	});
	
	
	
});
</script>
<script src="../../../resources/js/order.js"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<div class="addressWrap">
	<h2>신규 배송지</h2>
	<form class="address_registerForm" action="/order/address/register" method="post" >
		<table class="registerTable">
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
				<td><label class="telLabel"><input type="checkbox" name="telCheck">없음</label></td>
			</tr>
			<tr>
				<th> 배송지주소 </th>
				<td><input type="text" id="zipcode" name="zipcode" value="" readonly></td>
				<td><button type="button" class="btn search">주소검색</button></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" id="address1" name="address1" value="" readonly></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" id="address2" name="address2" value=""></td>
			</tr>
			<tr>
				<th></th>
				<td><label class="basicLabel"><input type="checkbox" name="basicCheck">기본 배송지 설정</label></td>
			</tr>
		</table>
		<input type="text" name="userid" value="${id}">
		<input type="hidden" name="id" value="">
		<input type="hidden" name="address" value="">
		<input type="text" name="teltel" value="">
		<input type="text" name="basic" value="">
		<div class="registerBtn">
			<button type="reset" class="btn cancle">취소</button>
			<button type="button" class="btn back">돌아가기</button>
			<button type="button" class="btn register">등록</button>
		</div>	
	</form>
	<form class="address_registerFormBasic" action="/order/address/registerWithBasic" method="post">
	</form>
</div>

<script src="../../../resources/js/board.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){

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

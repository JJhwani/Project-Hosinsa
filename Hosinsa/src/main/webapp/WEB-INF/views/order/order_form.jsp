<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="contentWrap">
	<h2>Order / Payment</h2>


	<div class="orderInfo" style="border: 1px solid;">
		<div class="titleArea">
			<h1>배송지 입력</h1>
		</div>
		<form action="/order/" method="post" class="quantity_plus_form">
		<div class="order_add">
			<div class="inputArea">
				<label for="ordername">수령인</label> 
				<input type="text" name="orderRec"
					id="orderRec" required="required" value="${member.id}" /><br>
				<label for="orderPhone">수령인 연락처</label>
				<input type="text"
					name="orderPhon" id="orderPhon" required="required"
					value="${member.phone}" /><br>
				<label for="zipcode">우편번호</label>
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<label for="address">주소</label>
				<input type="text" id="sample6_address" placeholder="주소"><br>
				<label for="address_detail">상세주소</label>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소">
			</div>

			<div class="inputArea">
				<button type="submit" class="order_btn">주문</button>
				<button type="button" class="cancel_btn">취소</button>
			</div>
		</div>
	</div>
	<br> <br>
	<div class="orderInfo" style="border: 1px solid;">
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
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

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


<%@ include file="../includes/footer.jsp"%>
</html>
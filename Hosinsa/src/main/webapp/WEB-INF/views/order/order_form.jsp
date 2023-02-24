<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
    String id = (String)request.getAttribute("id");
    String name = (String)request.getAttribute("name");
%>

<%@ include file="../includes/header.jsp"%>
<div class="contentWrap">
	<h2>Order / Payment</h2>


	<div class="orderInfo" style="border: 1px solid;"> <!-- 배송지 정보 -->
		<div class="titleArea">
			<h1>배송지 입력</h1>
		</div>
		<form action="/order/" method="post" class="quantity_plus_form">
		<div class="order_add">
			<div class="inputArea">
				<c:if test="sl">
				
				</c:if>
			</div>
		</div>
	</div>
	<br> <br>
	<div class="orderInfo_pro" style="border: 1px solid;"> <!-- 결제 상품정보 -->
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
					<th>수량</th>
					<th>가격</th>
				</tr>
			</div>
			<div>
				<c:set var = "total" value="${0}"/>
				<c:forEach items="${order}" var="order">
					<tr class="odd gradeX">
						<td></td>
						<td>${order.cartnum}</td>
						<td>${order.proimg}</td>
						<td>${order.pronum}</td>
						<td><a class="move" href='${order.pronum}'>
								${order.proname} </a></td>
						<td>${order.quantity}</td>
						<td>${order.price}</td>
					</tr>
					<c:set var="total" value="${total + (order.quantity*order.price)}" />
				</c:forEach>
			</div>
		</table>
	</div>
	<div>
	<br>
		<ul class="order_text">
			<li>· 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
			<li>· 호신사 스토어는 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함 <span>전 지역, 전 상품 무료배송입니다.</span></li>
			<li>· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.</li>
			<li>· 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</li>
		</ul>
	</div>
	
	<!-- id는 check_module를 쓰겠습니다. -->
	<!-- <form method="post" action="/order/kakaoPay" class="order_kakao">
	<input type="hidden" name="total" value="5000">
	</form> -->
    <button id="payBtn" type="button">
	<span id="btn-pay_amt"> ${total} </span>원 결제하기
	</button>
	
</div>




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    
$(function() {
	$("#payBtn").on("click", function(e) {
		var total = {
				total : ${total}
		}
    	$.ajax({
			url : "/order/kakaopay", 
			dataType : "json",
			type : "POST",
			data : total,
			success:function(data){
				var box = data.next_redirect_pc_url;
				window.open(box);
			},
			error:function(error){
				alert(error);
			}
		});
    	/* $(".order_kakao").find("input[name=total]").val(total);
		$(".order_kakao").submit(); */
    });
});

/* function sample6_execDaumPostcode() {
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
    
} */


</script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>



<%@ include file="../includes/footer.jsp"%>
</html>
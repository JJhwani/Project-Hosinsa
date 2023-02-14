<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row">
	<div class="col-lg-12">
		<h2 class="page-header">장바구니</h2>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<table width="80%">
					<thead>
						<tr>
							<th>선택 <br>
							 <input type="checkbox" name="Chk_SelectAll"></th>
							<th>주문 번호</th>
							<th></th>
							<th>제품 번호</th>
							<th>제품 이름</th>
							<th>아이디</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${list}" var="cart">
							<tr class="odd gradeX">
								<td><input type="checkbox" name="Chk_List" id="Chk_List"></td>
								<td>${cart.cartnum}</td>
								<td>${cart.proimg}</td>
								<td>${cart.pronum}</td>
								<td><a class="move" href='${cart.pronum}'>
										${cart.proname} </a></td>
								<td>${cart.id}</td>
								<td>${cart.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<button type="submit" class="del_Btn" > 선택상품 삭제</button>
				</div>
				
				<form id="actionForm" action="/cart/list" method="get">
                  	<input type="hidden" name="pronum" value="${pronum}">
                  	<input type="hidden" name="proname" value="${proname}">
                  </form>

				


				<div>
					<ul class="cart_info">
						<li>무신사는 전 상품 무료 배송입니다.</li>
						<li>2개 이상의 브랜드를 주문하신 경우, 개별 배송됩니다.</li>
						<li>결제 시 각종 할인 적용이 달라질 수 있습니다.</li>

						<li>해외배송 상품은 배송료가 추가로 발생될 수 있습니다.</li>
						<li>장바구니 상품은 최대 1년 보관(비회원 2일)되며 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
						<li>장바구니에는 최대 100개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는 100개로
							제한됩니다.</li>

						<li>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
						<li>수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준, 기존
							주문 합산)</li>
					</ul>
				</div>


				<div>
					<button class="order">주문하기</button>
					<button>계속 쇼핑하기</button>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var actionForm = $("#actionForm");
		
		/* $(".order").on("click",function(e){
		console.log("버튼 클릭은 댐");
		self.location = "order";
		});*/
		
		 $(function(){
			var chkObj = document.getElementsByName("Chk_List");
			var rowCnt = chkObj.length;
			
			$("input[name='Chk_SelectAll']").click(function(){
				var chk_listArr = $("input[name='Chk_List']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='Chk_List']").click(function(){
				if($("input[name='Chk_List']:checked").length == rowCnt){
					$("input[name='Chk_SelectAll']")[0].checked = true;
				}
				else{
					$("input[name='Chk_SelectAll']")[0].checked = false;
				}
			});
		});
		
		$(".del_Btn").on("click",function(e){
		console.log("버튼 클릭은 댐");
		
		var text = $("tbody input[type='checkbox']:checked").parent().next().text();
		var list = $("tbody input[type='checkbox']");
		var valueArr = new Array();
		
		$("tbody input[type='checkbox']").each(function(){
			console.log("티바디 안에 들어옴");
			if($(this).is(":checked")){ //선택되어 있으면 배열에 값을 저장함
	            valueArr.push($(this).parent().next().text());
	            console.log("선택된 배열 저장");
	        }
			else{
				console.log($(this));		
			}
		});
		console.log(valueArr);
		
		if (valueArr.length == 0){
	    	alert("선택된 글이 없습니다.");
	    }else{
			var chk = confirm("정말 삭제하시겠습니까?");				 
			$.ajax({
			    url : "/cart/deleteCart",					// 전송 URL
			    dataType: "json",
			    type : 'POST',								// GET or POST 방식
			    data : {valueArr : valueArr},				//보내고자 하는 data 변수 설정
                
			});
		}
		
		
		
		
		/* var url = "delete";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
		var valueArr = new Array();
	    var list = $("input[name='Chk_List']");
	    for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
	            valueArr.push(list[i].value);
	            console.log("선택된 배열 저장");
	        }
	    }
	    if (valueArr.length == 0){
	    	alert("선택된 글이 없습니다.");
	    }
	    else{
	    	console.log("이프문 진입");
			var chk = confirm("정말 삭제하시겠습니까?");				 
			$.ajax({
			    url : url,                    // 전송 URL
			    type : 'POST',                // GET or POST 방식
			    traditional : true,
			    data : {
			    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
			    },
                success: function(jdata){
                    if(jdata = 1) {
                        alert("삭제 성공");
                        location.replace("list")
                    }
                    else{
                        alert("삭제 실패");
                    }
                }
			});
		} */
		});
	})
</script>
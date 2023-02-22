<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

<div class="contentWrap">
	<h2 class="title">마이페이지</h2>
	
	<h4 class="miniTitle">나의 정보</h4>
	
	<p class="grade">나의 등급 : ${member.grade }</p>
	<table class="table1 member_info">
		<tr><th>프로필이미지</th><td><img src="${member.profilimg }"></td></tr>
		<tr><th>이름</th><td>${member.name }</td></tr>
		<tr><th>아이디</th><td>${member.id }</td></tr>
		<tr><th>닉네임</th><td>${member.nickname }</td></tr>
		<tr><th>성별</th><td>${member.gender }</td></tr>
		<tr><th>생일</th><td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.birthday }"/> </td></tr>
		<tr><th>이메일</th><td>${member.email }</td></tr>
		<tr><th>연락처</th><td>${member.phone }</td></tr>
	</table>
	<button data-oper="modify" class="btn btn-default btn-info">회원정보 수정</button>
	<button id="remove" class="btn btn-default">탈퇴하기</button>
	
	<form id="operForm" action="/member/modify" method="get">
		<input type="hidden" id="id" name="id" value="${member.id}">
	</form>
	<form id="removeForm" action="/member/remove" method="get">
		<input type="hidden" id="id" name="id" value="${member.id}">
	</form>
	
	<h4 class="miniTitle">주문내역</h4>	
	<table class="table1">
		<c:choose>
			<c:when test="${empty orderList}">
				<tr><td>주문 내역이 없습니다.</td><tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th>주문번호</th><th>주문날짜</th><th>주문상품</th><th>주문금액</th><th>진행상태</th>
				</tr>
				<c:forEach var="orderList" items="${orderList}">
					<tr>
						<td>{orderList.ordernum}</td><td>{orderList.orderDate}</td><td>{orderList.product}</td><td>{orderList.price}</td><td>{orderList.process}</td>
					</tr>
				</c:forEach>
			</c:otherwise>		
		</c:choose>		
	</table>
	
	<h4 class="miniTitle">내 리뷰 관리</h4>
	<div class="tabWrap tab2">
		<button class="tab tab_possible">작성 가능한 리뷰</button>
		<button class="tab tab_already">내가 작성한 리뷰</button>
	</div>
	<div class="tabArea area1 reviewArea">
		<div class="reviewWrap">
			<div class="topper">
				<img class="proimg" src="../../resources/images/upload.jpg">
				<span class="ordernum">2</span>
				<b class="brand">브랜드브랜드</b>
				<a href="/product/{pronum}"><b>상품이름</b></a>
				<button class="review_register black">작성하기</button>
				<i>~2023-02-13</i>
			</div>
		</div>
		<div class="reviewWrap">
			<div class="topper">
				<img class="proimg" src="../../resources/images/upload.jpg">
				<span class="ordernum">2</span>
				<b class="brand">브랜드브랜드</b>
				<a href="/product/{pronum}"><b>상품이름</b></a>
				<button class="review_register black">작성하기</button>
				<i>~2023-02-13</i>
			</div>
		</div>
	</div>
	<div class="tabArea area2 reviewArea hidden">		
		<div class="reviewWrap">
			<div class="topper">
				<img class="proimg" src="../../resources/images/upload.jpg">
				<span class="bno">2</span>
				<a href="/product/{pronum}"><b>상품이름</b></a>
				<button class="review_modify">수정</button>
				<button class="review_delete">삭제</button>
				<i>2023-02-13</i>
			</div>
			<p class="reviewTitle">집에가고싶다2</p>
			<p class="content">기절하겠네</p>
			<p class="reReplyWrap"><button class="reReply">댓글 0개</button></p>
		</div>
	</div>
	<form class="reviewForm" action="/review/register" method="get">
		<input type="hidden" name="ordernum" value="">
	</form>
</div><!-- //contentWrap -->

<!-- Modal -->
 <div class="modal fade hidden" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 	<div class="modal-dialog">
 	  <div class="modal-content">
 		<div class="modal-header">
 		  <h4 class="modal-title" id="myModalLabel">회원 탈퇴</h4>
 		</div>
 		<div class="modal-body">
 			<p>정말 탈퇴 하시겠습니까?</p><br>
			<c:if test="${msg == 0}">
				비밀번호가 틀립니다.
			</c:if>
 		  <div class="form-group">
 		  <form id="modalForm" action="/member/remove" method="post">
 		  		<input type="text" name="id" value="${member.id}" readonly="readonly">
 		  		<input type="password" class="form-control" id="pw" name="pw" placeholder="PASSWORD">
 		  </form>
 		  </div>
 		</div>
 		
 		<div class="modal-footer">
 			<button id="modalRegBtn" type="button" class="btn black">탈퇴</button>
 			<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">탈퇴 그만두기</button>
 		</div>	
 	  </div>
 	</div> 		  
 </div>
<!-- Modal 끝 -->

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
	});
});
</script>

<script type="text/javascript">
$(document).ready(function(){
    var operForm = $("#operForm");
    var removeForm = $("#removeForm");
    var modalForm = $("#modalForm");
    
    $("button[data-oper='modify']").on("click",function(e){
		operForm.attr("action","/member/modify").submit();
  	});
    
    // 모달
    var modal = $("#myModal");
    var closeBtn = $("#modalCloseBtn");
    
    closeBtn.on("click",function(){
		modal.find("input").val("");
		modal.addClass("hidden");
		$("body").removeClass("fix");
	});   
    
    $("#remove").on("click", function() {
    	modal.removeClass("hidden");
		$("body").addClass("fix");
    });
    
    $("#modalRegBtn").on("click", function() {
    	if ($(".form-control").val() == "") {
    		alert("비밀번호를 입력하세요");
    		$(".form-control").focus();
    		return false;
    	}
    	var check = confirm("정말 탈퇴하시겠습니까?");
    	
    	if(check) {
			modalForm.submit();    	
    	}
    });
	
    if("${msg}"=="0"){
    	modal.removeClass("hidden");
		$("body").addClass("fix");
    }
});
</script>

<%@ include file="../includes/footer.jsp" %>
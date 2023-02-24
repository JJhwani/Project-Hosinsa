<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

<div class="contentWrap">
	
	<h2 class="bigTitle">마이페이지</h2>
	<section class="myInfo info0">
		<h4 class="title align_center"><i class="fa-solid fa-heart"></i> 내 찜 목록 <i class="fa-solid fa-heart"></i></h4>
		<section class="productList">
			<c:if test = "${empty LikesList}">		
				<p class='no_review'><i class="fa-sharp fa-solid fa-heart-circle-xmark"></i> 아직 찜한 아이템이 없습니다.</p>
			</c:if>
			<c:forEach var="LikesList" items="${LikesList}">
	 			<div class="list_box">
	 				<a href="/product/${LikesList.pronum }">
						<div class="list_img">
							<img src="${LikesList.proimg}">
						</div>
						<div class="article_info">
							<p class="pbrand">${LikesList.brand}</p>
							<p class="pname">${LikesList.proname}</p>
							<p class="price">${LikesList.price}</p>
							<p class="view"><i class="fa-solid fa-eye"></i> ${LikesList.proview}</p>
						</div>
					</a>
				</div>
	 		</c:forEach>
		</section>
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}"><a href="${num}">${num}</a></li>							
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a></li>
			</c:if>
		</ul>
	</section>
	<section class="myInfo info1">
		<h4 class="title">나의 정보</h4>
		<table class="table3 member_info">
			<tr><th>나의 등급</th><td>${member.grade }</td></tr>
			<tr><th>프로필이미지</th><td><img src="../${member.profilimg }"></td></tr>
			<tr><th>이름</th><td>${member.name }</td></tr>
			<tr><th>아이디</th><td>${member.id }</td></tr>
			<tr><th>닉네임</th><td>${member.nickname }</td></tr>
			<tr><th>성별</th><td>${member.gender }</td></tr>
			<tr><th>생일</th><td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.birthday }"/> </td></tr>
			<tr><th>이메일</th><td>${member.email }</td></tr>
			<tr><th>연락처</th><td>${member.phone }</td></tr>
		</table>
		<div class="array_center align_center">
			<button data-oper="modify" class="btn btn-default btn-info">회원정보 수정</button>
			<button data-oper="remove" class="btn btn-default">탈퇴하기</button>
		</div>	
		
		<form id="operForm" action="/member/modify" method="get">
			<input type="hidden" id="id" name="id" value="${member.id}">
		</form>
		
		<form id="removeForm" action="/member/remove" method="get">
			<input type="hidden" id="id" name="id" value="${member.id}">
		</form>
	</section>
	<section class="myInfo info2">
	<h4 class="title">주문내역</h4>	
		<table class="table3">
			<c:choose>
				<c:when test="${empty order}">
					<tr><td>주문 내역이 없습니다.</td><tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th>주문번호</th><th>주문날짜</th><th>주문상품</th><th>주문금액</th><th>진행상태</th>
					</tr>
					<c:forEach var="order" items="${order}">
						<tr>
							<td>${order.ordernum}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${order.order_date}"></fmt:formatDate></td>
							<td><a href="/product/${order.pronum}">${order.proname}</a></td>
							<td>${order.price}</td>
							<td><a href="/member/order/${order.ordernum }">${order.process}</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>		
			</c:choose>		
		</table>
	</section>
	
	<section class="myInfo info3">
		<h4 class="title">내 리뷰 관리</h4>
		<div class="tabWrap tab2">
			<button class="tab tab_possible">작성 가능한 리뷰</button>
			<button class="tab tab_already">내가 작성한 리뷰</button>
		</div>
		<div class="tabArea area1 reviewArea">
			<c:if test = "${empty possible}">		
				<p class='no_review'>작성 가능 리뷰가 없습니다.<br>호신사에서 쇼핑하고 리뷰를 작성해 보세요!</p>
			</c:if>
			<c:forEach var="possible" items="${possible}">
				<div class="reviewWrap">
					<div class="topper">
						<img class="proimg" src="${possible.proimg}">
						<span class="ordernum">${possible.ordernum }</span>
						<b class="brand">${possible.brand }</b>
						<a href="/product/${possible.pronum }" class="pronum" data-pronum="${possible.pronum }"><b>${possible.proname }</b></a>
						<button class="review_register black">작성하기</button>
						<i>~<fmt:formatDate pattern="yyyy-MM-dd" value="${possible.expiredate }"></fmt:formatDate></i>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="tabArea area2 reviewArea hidden">
			<c:if test = "${empty already}">
				<p class='no_review'>아직 리뷰가 없습니다.<br>호신사에서 쇼핑하고 첫 리뷰를 작성해 보세요!</p>
			</c:if>
			<c:forEach var="already" items="${already}">
				<div class="reviewWrap">
					<div class="topper">
						<img class="proimg" src="${already.proimg}">
						<span class="bno">${already.bno }</span>
						<a href="/product/${already.pronum}"><b>${already.proname }</b></a>
						<button class="review_modify">수정</button>
						<button class="review_delete">삭제</button>
						<i><fmt:formatDate pattern="yyyy-MM-dd" value="${already.uploadDate }"></fmt:formatDate></i>
					</div>
					<p class="reviewTitle">${already.title }</p>
					<p class="content">${already.content }</p>
					<p class="reReplyWrap"><button class="reReply">댓글 ${already.rereply }개</button></p>
				</div>
			</c:forEach>
		</div>
		<form class="reviewForm" action="/review/register" method="get">
			<input type="hidden" name="pronum" value="">
			<input type="hidden" name="ordernum" value="">
			<input type="hidden" name="bno" vanlu="">
		</form>
	</section>
</div><!-- //contentWrap -->

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
	})
	
	var reviewForm = $(".reviewForm");
	
	$(".review_register").on("click",function(){
		reviewForm.find("input[name=pronum]").val($(this).siblings(".pronum").attr("data-pronum"));
		reviewForm.find("input[name=ordernum]").val($(this).siblings(".ordernum").text());
		reviewForm.attr("action","/review/register");
		reviewForm.submit();
	})
	
	$(".review_modify").on("click",function(){
		reviewForm.find("input[name=bno]").val($(this).siblings(".bno").text());
		reviewForm.attr("action","/review/modify");
		reviewForm.submit();
	})
		
	$(".review_delete").on("click",function(){
		if(confirm("정말로 리뷰를 삭제하시겠습니까?")){
			reviewForm.find("input[name=bno]").val($(this).siblings(".bno").text());
			reviewForm.attr("action","/review/remove");
			reviewForm.submit();
		}else{
			return false;
		}
	})
	
	if("${review}"=="success"){
		alert("리뷰 작성이 완료되었습니다.");
	}
	
	if("${modify}"=="success"){
		alert("리뷰 수정이 완료되었습니다.");
	}
	
	if("${remove}"=="success"){
		alert("리뷰 삭제가 완료되었습니다.");
	}
	
	//날짜 포맷 변경 함수
	function formatDate(date) {
	    
	    var d = new Date(date),
	    
	    month = '' + (d.getMonth() + 1) , 
	    day = '' + d.getDate(), 
	    year = d.getFullYear();
	    
	    if (month.length < 2) month = '0' + month; 
	    if (day.length < 2) day = '0' + day; 
	    
	    return [year, month, day].join('-');
	    
    }
	
	//대댓글 표시
	$(document).on("click",".reReply",function(e){
		var replyNum = $(this).parent().siblings(".topper").find(".bno").text();
		var reviewWrap = $(this).parent(".reReplyWrap");
		var button = $(this);
		$(this).attr("disabled","disabled");		
		$.ajax({
			type:'get',
			url:'/replies/'+replyNum,
			dataType:'json',
			success:function(list){	
				var str="";
				for(var i=0, len=list.length; i<len ; i++){
					
					var time = new Date(list[i].replyDate);
					str += "<div class='reviewWrap2'><div class='topper'><span class='bno'>"+list[i].rno+"</span><b>"+list[i].replyer+"</b>";
					if(list[i].id == "${member.id}"){
						str+= "<button class='reReply_delete'>삭제</button>";
					}
					str += "<i>"+formatDate(time)+"</i></div>";
					str += "<p class='content'>" + list[i].reply + "</p></div>";
				}					
				reviewWrap.append(str);
				button.html("댓글 "+list.length+"개");
			}
		})
		
	})//대댓글 표시 끝
	
	//대댓글 삭제
	$(document).on("click",".reReply_delete",function(e){
		var rno = $(this).siblings(".bno").text();
		var selectDiv = $(this).parents(".reReplyWrap")
		
		
		if(confirm("댓글을 삭제하시겠습니까?")){
			replyService.remove(rno,function(){
				alert("삭제되었습니다.");
				selectDiv.find(".reviewWrap2").remove();
				selectDiv.find(".reReply").removeAttr("disabled").trigger("click").attr("disabled","disabled");
			});
		}else{
			return false;
		}
	})
		
	//찜목록 페이징 처리
	$(".pagination li a").on("click",function(e){
		e.preventDefault();
		var page = $(this).attr("href");
		
		var form = {
				id : "${member.id}",
				page : page
		}
		
		$.ajax({
			type : 'Post',
            url : '/member/likes',
            data : form,
            dataType : 'json',
            success : function(list) {
            	var str=""
            	for(i=0;i<list.length;i++){
            		str+='<div class="list_box">';
            		str+='<a href="/product/'+list[i].pronum+'">';
            		str+='<div class="list_img">';
            		str+='<img src="'+list[i].proimg+'">';
            		str+='</div>';
            		str+='<div class="article_info">';
            		str+='<p class="pbrand">'+list[i].brand+'</p>';
            		str+='<p class="pname">'+list[i].pname+'</p>';
            		str+='<p class="price">'+list[i].price+'</p>';
            		str+='<p class="view"><i class="fa-solid fa-eye"></i> '+list[i].proview+'</p>';
            		str+='</div></a></div>';
            	}
            	$(".productList").html(str);
            }
		})
		
		$(".paginate_button").removeClass("active");
		$(this).parent().addClass("active");
	})
})
</script>

<script src="../../../resources/js/member.js"></script>

<%@ include file="../includes/footer.jsp" %>
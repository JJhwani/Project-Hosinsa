<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div class="contentWrap">
	<h2 class="bigTitle">관리자 회원 관리 페이지</h2>
	<div class="search_area">
		<form class="searchForm" action="/admin/search/member" method="get">
        		<input type="text" name="keyword"/>
        		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
       		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
       		<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
   		</form>
	</div>
	<table class="table adminList table2" width="100%">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>등급</th>
				<th>포인트</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="member">
			<tr>
				<td>
					<a class="move" href="${member.id}"> 
						<c:out value="${member.id}" />
					</a>
				</td>
				<td><c:out value="${member.name}" /></td>
				<td><c:out value="${member.nickname}" /></td>
				<c:choose>
					<c:when test="${member.grade eq 'C' }">
						<td>LV.1 브론즈</td>
					</c:when>
					<c:when test="${member.grade eq 'B' }">
						<td>LV.2 실버</td>
					</c:when>
					<c:when test="${member.grade eq 'A' }">
						<td>LV.3 골드</td>
					</c:when>
					<c:otherwise>
						<td>LV.4 운영자</td>
					</c:otherwise>
				</c:choose>
				<td><c:out value="${member.point}" /></td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이지 처리 시작 -->
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="${pageMaker.startPage-1}">Previous</a>
			</li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
			<li	class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}">
				<a href="${num}">${num}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="${pageMaker.endPage+1}">Next</a>
			</li>
		</c:if>
	</ul>
	<form class="paging" action="/admin/member" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
	<!-- 페이지 처리 끝 -->

</div>
<script type="text/javascript">
$(document).ready(function() {
	var actionForm = $(".paging");
	var searchForm = $(".searchForm");
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='id' value='" + $(this).attr("href") +"'>");
		actionForm.attr("action", "/admin/memberModify");
		actionForm.submit();
	});
	
	$(".searchForm button").on("click", function(e){
	      if(!searchForm.find("input[name='keyword']").val()){
	         alert("키워드를 입력하세요.");
	         $("input[name='keyword']").focus();
	         return false;
	      }   
	      
	      searchForm.find("input[name='pageNum']").val("1");
	      searchForm.find("input[name='amount']").val("28");
	      e.preventDefault();
	      searchForm.submit();
	});
});
</script>
</html>

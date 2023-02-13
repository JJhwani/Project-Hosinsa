<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.searchInput {
	display: flex;
	flex-direction: row-reverse;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<h2>Manager Page</h2>
		</div>
		<form id="searchForm" action="/member/manager" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<div class="searchInput">
				<button type="submit">검색</button> &nbsp;&nbsp;
				<input type="text" name="keyword">
			</div>
		</form>
		<table class="table table-hover">
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
					<td><a class="move" href='<c:out value="${member.id}"/>'>
							<c:out value="${member.id}" />
					</a></td>
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
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage-1}">Previous</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li
					class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}"><a
					href="${num}">${num}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage+1}">Next</a></li>
			</c:if>
		</ul>
		<form class="paging" action="/member/manager" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
		<!-- 페이지 처리 끝 -->
	</div>
</body>

<script type="text/javascript">
$(document).ready(function() {
	var paging = $(".paging");
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		paging.find("input[name='pageNum']").val($(this).attr("href"));
		paging.submit();
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		paging.append("<input type='hidden' name='id' value='" + $(this).attr("href") + "'>");
		paging.attr("action", "/member/managerGet");
		paging.submit();
	})
});
</script>
</html>
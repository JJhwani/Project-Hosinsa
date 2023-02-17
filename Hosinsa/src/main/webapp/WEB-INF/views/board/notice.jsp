<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<div class="mainWrap">
	<h2 class="bigTitle">공지사항
		<c:if test="${member.grade eq 'S'}">
			<a class="register" href="/board/notice/register">공지사항 등록</a>
		</c:if>
	</h2>

	<table class="Notice table1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
		</thead>

		<c:forEach var="notice" items="${notice}">
			<tr>
				<td>${notice.nno}</td>
				<td>
					<a class="move" href="${notice.nno}">${notice.title}
						<b>[ ${notice.readcount} ]</b>
					</a>
				</td>
				<td>${notice.id}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regdate}"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.update_date}"/></td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="searchNocite">
		<form class="search" action="board/notice/search" method="get">
			<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
		</form>
	</div>
	<!-- 페이지 처리 시작 -->
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
	<form class="paging" action="/board/notice/list" method="post">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
	</form>	
</div>

<!-- Modal  추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
<!-- /.modal -->

<script type="text/javascript">
	$(document).ready(function() {

		var result = '<c:out value="${result}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"게시글 " + parseInt(result)
								+ " 번이 등록되었습니다.");
			}

			$("#myModal").show();
		}
	});
</script>
<script src="../../../resources/js/board.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if("${register}"==="success"){
			alert("공지사항 등록이 성공적으로 처리되었습니다.");
		}
		if("${modify}"==="success"){
			alert("공지사항 수정이 성공적으로 처리되었습니다.");
		}
		if("${remove}"==="success"){
			alert("공지사항 삭제가 성공적으로 처리되었습니다.");
		}
	});
</script>

<%@ include file="../includes/footer.jsp" %>
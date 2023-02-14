<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%-- <%@include file="../includes/header.jsp"%> --%>
<div class="container">
	<h2>Notice</h2>

	<button id='regBtn' type="button" class="btn pull-right">공지사항 등록</button>

	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th> <!-- 추가 -->
			</tr>
		</thead>

		<c:forEach items="${list}" var="notice">
			<tr>
				<td><c:out value="${notice.nno}" /></td>
				<td><a class='move' href='<c:out value="${notice.nno}"/>'>
									<c:out value="${notice.ntitle}" /></a></td>
				<td><c:out value="${notice.id}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${notice.nwritedate}" /></td>
						<td><c:out value="${notice.readcount}" /></td> <!-- 추가 -->
			</tr>
		</c:forEach>
	</table>
	
	<div class='row'>
		<div class="col-lg-12">

			<form id='searchForm' action="/notice/list" method='get'>
				<select name='type'>
				<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>-검색 종류 선택-</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
					<option value="W"
						<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
					<option value="TC"
						<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
						or 내용</option>
					<option value="TW"
						<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
						or 작성자</option>
					<option value="TWC"
						<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
						or 내용 or 작성자</option>
				</select> 
				<input type='text' name='keyword' placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
				<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
				<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
				<button class='btn btn-default'>조회</button>
			</form>
		</div>
	</div>


	<div class='pull-right'>
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous">
				<a href="${pageMaker.startPage -1}">Previous</a>
				</li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
			<a href="${pageMaker.endPage +1 }">Next</a>
			</li>
			</c:if>

		</ul>
	</div>
	<!--  end Pagination -->
</div>

<form id='actionForm' action="/notice/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
	<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
</form>


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
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
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

						$("#regBtn").on("click", function() {

							self.location = "/notice/register";

						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on("click", function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']").val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move").on("click",function(e) {

											e.preventDefault();
											actionForm.append("<input type='hidden' name='nno' value='"+ $(this).attr("href")+ "'>");
											actionForm.attr("action", "/notice/get");
											actionForm.submit();
										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on("click",function(e) {

									if (!searchForm.find("option:selected").val()) {
										alert("검색 종류를 선택하세요");
										return false;
									}

									if (!searchForm.find("input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']").val("1");
									e.preventDefault();

									searchForm.submit();

								});
					});
</script>




<%-- <%@include file="../includes/footer.jsp"%> --%>
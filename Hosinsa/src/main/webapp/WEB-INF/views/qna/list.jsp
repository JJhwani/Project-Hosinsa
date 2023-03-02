<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="contentWrap qnaWrap">
	<h2 class="bigTitle">Q&amp;A</h2>

	<button id='regBtn' type="button" class="btn black">문의하기</button>

	<table class="table4 qna">
		<thead>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="qna">
			<tr>
				<td><c:out value="${qna.qno}" /></td>				
				<td><c:out value="${qna.category }" /></td>				
				<td>
				<a class='move' href='<c:out value="${qna.qno}"/>'>
				<c:out value="${qna.title}" /> 
				<b>[ <c:out value="${qna.replyCnt}" /> ]</b></a></td>
				<td class="id"><c:out value="${qna.id}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.regdate}" /></td>
			</tr>
		</c:forEach>
	</table>
	
	<div class='row'>
		<div class="col-lg-12">
			<!-- 검색 처리 -->
			<form id='searchForm' action="/qna/list" method='get' class="align_center">
				<select name='type'>
<%-- 					<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>-검색 종류 선택-</option> --%>
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
				<button class='btn btn-default'>검색</button>
			</form>
		</div>
	</div>

<!-- 페이지 처리 -->
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

<form id='actionForm' action="/qna/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
	<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
</form>


<!-- Modal  추가 -->
<div class="modal fade hidden" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="modalCloseBtn">Close</button>
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

						var modal = $("#myModal");
						checkModal(result);

						//뒤로가기 문제
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

							modal.removeClass("hidden");
							$("body").addClass("fix");

							
						}
						
						//문의하기 버튼 처리
						$("#regBtn").on("click", function() {
							if("${member}"==""){
								alert("로그인 후 작성 가능합니다.");
								return false;
							}

							self.location = "/qna/register";

						}); 
						
						//페이지 번호 클릭시 처리
						
						var actionForm = $("#actionForm");

						$(".paginate_button a").on("click", function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']").val($(this).attr("href"));
									actionForm.submit();
								});

						//게시물의 제목 클릭시 이동
						$(".move").on("click",function(e) {						
							var id=$(this).parent().siblings(".id").text();
							var myId="${member.id}";
							if(id==myId||"${member.grade}" == "S"){
								e.preventDefault();
								actionForm.append("<input type='hidden' name='qno' value='"+ $(this).attr("href")+ "'>");
								actionForm.attr("action", "/qna/get");
								actionForm.submit();
							}else{
								alert("자신이 작성한 글만 볼 수 있습니다.")
							}
						});

						//검색 버튼 이벤트 처리
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
						
						//모달 닫기
						$("#modalCloseBtn").on("click",function(){
							modal.addClass("hidden");
							$("body").removeClass("fix");
						})
					});
</script>




<%@include file="../includes/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>list</h1>

<div>
	<table>
	  <tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>등록일자</th>
	  </tr>
	  
	  <c:forEach items="${list }" var = "review">
	  	<tr>                 
	  		<td><c:out value="${review.bno }"/></td>
	  		<td>${review.title }</td>
	  		<td><c:out value="${review.content }"/></td>
	  		<td><c:out value="${review.nickname }"/></td>
	  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.uploadDate }"/></td>
	  	</tr>
	  </c:forEach>
		
	</table>
	
	<!-- 게시판 목록에서 검색하기 -->
	<div>
		<form id="searchForm" action="/review/list" method="get">
			<select name="type">
			  <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>선택하세요</option>
			  <option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }"/>>제목</option>
			  <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected': ''}"/>>내용</option>
			  <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected': ''}"/>>닉네임</option>
			  <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected': ''}"/>>제목 ● 내용</option>
			  <option value="TN" <c:out value="${pageMaker.cri.type eq 'TN'? 'selected': ''}"/>>제목 ● 닉네임</option>
			  <option value="TCN" <c:out value="${pageMaker.cri.type eq 'TNC'? 'selected': ''}"/>>제목 ● 내용 ● 닉네임</option>
			</select>
			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<button class="btn btn-default">Search</button>
		</form>
	</div>	
	
	
	<!-- 페이징 시작 -->
	<div class="pull-right">
	<ul class="pagination">
	  
	  <c:if test="${pageMaker.prev}">
		  <li class="paginate_button previous" ><a href="${pageMaker.startPage-1 }">Privious</a></li>
	  </c:if>
	  
	  <c:forEach var="num" begin="${pageMaker.startPage }" 
	  					end="${pageMaker.endPage }">
		 
		  <li class="paginate_button ${pageMaker.cri.pageNum == num? "active":"" }" ><a href="${num}">${num}</a></li>
	  </c:forEach>
	  
	  <c:if test="${pageMaker.next}">
		  <li class="paginate_button next" ><a href="${pageMaker.endPage+1 }">Next</a></li>
	  </c:if>
	</ul>
	</div>
	<!-- 페이징 끝 -->
	
	<!-- 실제 페이지 클릭시 이동액션폼 -->
	<div>
	<form id="actionForm" action="/review/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" >
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }" >
		<input type="hidden" name="type" value="${pageMaker.cri.type }" >
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" >
		
	</form>
	</div>
	
	<!-- register버튼 -->
	<div>
		<button id='regBtn' type="button" class="btn btn-xs pull-right">리뷰쓰기</button>	
	</div>
	<!-- register버튼 끝 -->

</div>




<!-- 모달모달모달모달모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
  	 		 <div class="modal-header">
  				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
	  		 </div>
	  
			  <div class="modal-body">처리 완료</div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
				
			 </div>
    	</div> <!-- modal-content -->
 	</div> <!-- modal-dialog -->
</div> <!-- 모달 끝 -->



<script type="text/javascript">

	$(document).ready(function(){
		
		var result = '${result}'
	
			checkModal(result);
			
			history.replaceState({},null,null); //히스토리를 쌓으면서 모달창을 보여줄 필요X
	
		function checkModal(result) {

			if(result ==='' || history.state) {
				return;
			}
	
			if (parseInt(result) > 0) {
				$(".modal-body").html("상품평" + parseInt(result) + "이 등록되었습니다.");
			}
	
			$("#myModal").show();
			
			}
		
			$("#regBtn").on("click", function() {
				self.location = "/review/register";
		});
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){
			
			e.preventDefault();

			console.log("click");

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();

		});
		
		$(".move").on("click", function(e){

			e.preventDefault();

			actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href")+"'>");
			actionForm.find("input[name='bno']").remove(); 
			actionForm.attr("action","/review/get");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");

		$("#searchForm button").on("click", function(e) {

			if(!searchForm.find("option:selected").val()) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if(!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();

			searchForm.submit();
		}); 

	});


</script>

<%@include file="../includes/footer.jsp" %>

</body>
</html>
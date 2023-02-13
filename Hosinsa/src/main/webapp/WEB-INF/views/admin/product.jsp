<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="contentWrap">
	<h2 class="bigTitle">관리자 상품 관리 페이지 <a class="register" href="/admin/register">상품 등록</a></h2>
	<ul class="category_menu horizental tab10">
		<li><a class="category" href="상의">상의</a></li>
		<li><a class="category" href="아우터">아우터</a></li>
		<li><a class="category" href="바지">바지</a></li>
		<li><a class="category" href="원피스">원피스</a></li>
		<li><a class="category" href="스커트">스커트</a></li>
		<li><a class="category" href="가방">가방</a></li>
		<li><a class="category" href="신발">신발</a></li>
		<li><a class="category" href="시계">시계</a></li>
		<li><a class="category" href="모자">모자</a></li>
		<li><a class="category" href="액세서리">액세서리</a></li>
	</ul>
	<table class="adminList table1">
		<thead>
			<tr>
				<th>품번</th>
				<th>사진</th>
				<th>품명</th>
				<th>브랜드</th>
				<th>카테고리</th>
				<th>가격</th>
				<th>재고</th>
				<th>조회수</th>				
				<th>등록일자</th>
				<th>수정일자</th>
				<th>상품관리</th>
			</tr>
		</thead>
		<c:forEach var="product" items="${product }">
			<tr>
				<td class="pronum">${product.pronum }</td>
				<td><img src="${product.proimg }"></td>
				<td>${product.proname }</td>
				<td>${product.brand }</td>
				<td>${product.category }</td>
				<td>${product.price }</td>
				<td>${product.stock }</td>
				<td>${product.proview }</td>				
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.regdate }"></fmt:formatDate></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.update_date }"></fmt:formatDate></td>
				<td><button class="modify">수정</button><button class="delete">삭제</button></td>		
			</tr>
		</c:forEach>
	</table>
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
	<form class="paging" action="/admin/product" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="category" value="${category}">
	</form>	
	<form class="selectCategory" action="/admin/category" method="get">
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="category" value="${category}">
	</form>
	<form class="productForm" action="/admin/modify" method="get">
		<input type="hidden" name="pronum" value="">
	</form>
	<!-- 페이지 처리 끝 -->
</div>

<script type="text/javascript">
$( document ).ready(function() {
	var paging = $(".paging");
	var selectCategory = $(".selectCategory");
	var productForm = $(".productForm");

	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		paging.find("input[name='pageNum']").val($(this).attr("href"));
		if(selectCategory.find("input[name='category']").val()){
			paging.attr('action','/admin/category');
		}else{
			paging.attr('action','/admin/product');
		}
		paging.submit();
	});
	
	$(".category").on("click",function(e){
		e.preventDefault();
		selectCategory.find("input[name='category']").val($(this).attr("href"));
		selectCategory.submit();
	});
	
	$(".adminList button").on("click",function(e){
		var tempNum = $(this).parent().siblings(".pronum").text();
		productForm.find("input[name='pronum']").val(tempNum);
		
		if($(this).attr("class")=="modify"){
			productForm.attr("action","/admin/modify");
		}else if($(this).attr("class")=="delete"){
			if(confirm("제품번호 "+tempNum+" : 정말로 삭제하시겠습니까?")){
				productForm.attr("action","/admin/delete");
			}else{
				return false;
			}
		}		
		productForm.submit();
	})	
	
	if("${modify}"==="success"){
		alert("수정 요청이 성공적으로 처리되었습니다.");
	}
	if("${remove}"==="success"){
		alert("제품 삭제가 성공적으로 처리되었습니다.");
	}
});



</script>

<%@ include file="../includes/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<div class="mainWrap">
	
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
	
	<ul class="sorting">
		<li><a class="sort ${sort == 'best' ? 'on':''}" href="best">인기순</a></li>
		<li><a class="sort ${sort == 'new' ? 'on':''}" href="new">신상품순</a></li>
		<li><a class="sort ${sort == 'lowPrice' ? 'on':''}" href="lowPrice">낮은가격순</a></li>
		<li><a class="sort ${sort == 'highPrice' ? 'on':''}" href="highPrice">높은가격순</a></li>
		<li><a class="sort ${sort == 'review' ? 'on':''}" href="review">후기순</a></li>
	</ul>
	
	<div class="mainList">
		<section class="productList">
			<c:forEach var="viewList" items="${viewList}">
	 			<div class="list_box">
	 				<a href="/product/${viewList.pronum }">
						<div class="list_img">
							<img src="${viewList.proimg}">
						</div>
						<div class="article_info">
							<p class="pbrand">${viewList.brand}</p>
							<p class="pname">${viewList.proname}</p>
							<p class="price">${viewList.price}</p>
							<p class="view"><i class="fa-solid fa-eye"></i> ${viewList.proview}</p>
						</div>
					</a>
				</div>
	 		</c:forEach>
		</section>
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
	<form class="selectCategory" action="/category/sorting" method="get">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="sort" value="${sort}">
	</form>
	<form class="sorting" action="/search/sorting" method="get">
		<input type="hidden" name="sort" value="${sort}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>	
	<form class="paging" action="/search/sorting" method="get">
		<input type="hidden" name="sort" value="${sort}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>	
	<!-- 페이지 처리 끝 -->

	<div class="notice">
		<h4 class="title">공지사항</h4>
		<ul>
			<li><a>공지사항 1</a></li>
			<li><a>공지사항 2</a></li>
			<li><a>공지사항 3</a></li>
		</ul>
		<a>전체보기</a>
	</div>
	
	<div class="cs">
		<a>고객센터</a>
		<a>QnA</a>
		<a>1:1 문의</a>
	</div>
	
	<div class="event">
		<h4 class="title">이벤트</h4>
		<ul>
			<li><a>이벤트 1</a></li>
			<li><a>이벤트 2</a></li>
			<li><a>이벤트 3</a></li>
		</ul>
		<a>전체보기</a>
	</div>
	
	<div class="recent">
		<ul>
			<c:forEach var="recentView" items="${recentView}">
				<li><a><img src="${recentView.proimg}"></a></li>
			</c:forEach>			
		</ul>
		<a>TOP</a>
	</div>
</div>
<script src="../../../resources/js/main.js"></script>

<%@ include file="includes/footer.jsp" %>
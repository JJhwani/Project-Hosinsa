<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<div class="mainWrap">
	<div class="mainBanner">
		<ul class="bannerView">
			<li>
				<a href="#"><img src="../../resources/images/event1.jpg"></a>
			</li>
			<li>
				<a href="#"><img src="../../resources/images/event2.jpg"></a>
			</li>
			<li>
				<a href="#"><img src="../../resources/images/event3.jpg"></a>
			</li>
			<li>
				<a href="#"><img src="../../resources/images/event4.jpg"></a>
			</li>
			<li>
				<a href="#"><img src="../../resources/images/event5.jpg"></a>
			</li>
		</ul>
		<div class="deem"></div>
		<div class="arrow">
			<button class="left"><i class="fa-solid fa-chevron-left"></i></button>
			<button class="right"><i class="fa-solid fa-chevron-right"></i></button>
		</div>
	</div>
	
	<ul class="category_menu">
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
	
	
	<div class="bestWrap">
		<h3 class="title">BEST</h3>
		<p class="subTitle">이시간 가장 핫한 상품만 모아모아</p>
		<section class="bestList">
			<c:forEach var="bestList" items="${bestList}">
	 			<div class="list_box">
	 				<a href="/product/${bestList.pronum }">
						<div class="list_img">
							<img src="${bestList.proimg}">
						</div>
						<div class="article_info">
							<p class="pbrand">${bestList.brand}</p>
							<p class="pname">${bestList.proname}</p>
							<p class="price">${bestList.price}</p>
							<p class="view">view ${bestList.proview}</p>
						</div>
					</a>
				</div>
		 	</c:forEach>
		</section>
	</div>
	
	
	<div class="newWrap">
		<h3 class="title">NEW</h3>
		<p class="subTitle">따끈따끈 신상품</p>
		<section class="newList">
			<c:forEach var="newList" items="${newList}">
	 			<div class="list_box">
	 				<a href="/product/${newList.pronum }">
						<div class="list_img">
							<img src="${newList.proimg}">
						</div>
						<div class="article_info">
							<p class="pbrand">${newList.brand}</p>
							<p class="pname">${newList.proname}</p>
							<p class="price">${newList.price}</p>
							<p class="view">view ${newList.proview}</p>
						</div>
					</a>
				</div>
		 	</c:forEach>
		</section>
	</div>
	
	<ul class="sorting">
		<li class="on"><a>인기순</a></li>
		<li><a>신상품순</a></li>
		<li><a>낮은가격순</a></li>
		<li><a>높은가격순</a></li>
		<li><a>후기순</a></li>
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
							<p class="view">view ${viewList.proview}</p>
						</div>
					</a>
				</div>
				<div class="article_info">
					<p class="pbrand">${newList.brand}</p>
					<p class="pname">${newList.proname}</p>
					<p class="price">${newList.price}</p>
					<p class="view">view ${newList.proview}</p>
				</div>
			</div>
	 	</c:forEach>
	</section>
</div>

<ul class="sorting">
	<li><a>인기순</a></li>
	<li><a>신상품순</a></li>
	<li><a>낮은가격순</a></li>
	<li><a>높은가격순</a></li>
	<li><a>후기순</a></li>
</ul>
<div class="mainList">
	<section class="productList">
		<c:forEach var="viewList" items="${viewList}">
 			<div class="list_box">
				<div class="list_img">
					<img src="${viewList.proimg}">
				</div>
				<div class="article_info">
					<p class="pbrand">${viewList.brand}</p>
					<p class="pname">${viewList.proname}</p>
					<p class="price">${viewList.price}</p>
					<p class="view">view ${viewList.proview}</p>
				</div>
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
<form class="selectCategory" action="/category" method="get">
	<input type="hidden" name="category" value="">
</form>
<form class="paging" action="/category" method="get">
	<input type="text" name="category" value="${category}">
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
		<li><a>최근본상품1</a></li>
		<li><a>최근본상품2</a></li>
		<li><a>최근본상품3</a></li>
		<li><a>최근본상품4</a></li>
	</ul>
	<a>TOP</a>
</div>

<script src="../../../resources/js/main.js"></script>

<%@ include file="includes/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<div class="mainWrap">
	<div class="mainBanner">
		<ul class="bannerView">
			<c:forEach var="eventList" items="${eventList}">
	 			<li>
					<a href="${eventList.event_no}"><img src="${eventList.event_img}"></a>
				</li>
		 	</c:forEach>
		</ul>
		<div class="deem"></div>
		<div class="arrow">
			<button class="left"><i class="fa-solid fa-chevron-left"></i></button>
			<button class="right"><i class="fa-solid fa-chevron-right"></i></button>
		</div>
	</div>	
	
	<ul class="category_menu">
		<li><a class="category" href="인기">인기</a></li>
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
							<p class="view"><i class="fa-solid fa-eye"></i> ${bestList.proview}</p>
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
							<p class="view"><i class="fa-solid fa-eye"></i> ${newList.proview}</p>
						</div>
					</a>
				</div>
		 	</c:forEach>
		</section>
	</div>
	
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
	<form class="selectCategory" action="/main/sorting" method="get">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="sort" value="${sort}">
	</form>
	<form class="sorting" action="/main/sorting" method="get">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="sort" value="${sort}">
	</form>	
	<form class="paging" action="/main/sorting" method="get">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="sort" value="${sort}">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>	
	<!-- 페이지 처리 끝 -->

	<div class="notice">
		<form class="noticeBoard" action="/board/notice/list" method="post">
			<h4 class="title">공지사항</h4>
			<ul>
				<c:forEach var="notice" items="${notice}">
					<li><a href="${notice.nno}">${notice.title}</a></li>
				</c:forEach>
			</ul>
			<a href="">전체보기</a>
		</form>
	</div>
	
	<div class="cs">
		<h4 class="title">고객센터</h4>
		<a href="/qna/list">QnA</a>
		<a class="kakaoQnA">1:1 문의</a>
	</div>
	
	<div class="event">
		<form class="eventBoard" action="/board/event/list" method="post">
			<h4 class="title">이벤트</h4>
			<ul>
				<c:forEach var="event" items="${event}">
					<li><a href="${event.event_no}">${event.title}</a></li>
				</c:forEach>
			</ul>
			<a href="">전체보기</a>
		</form>
	</div>
	
	<div class="recent">
		<ul>
			<c:forEach var="recentView" items="${recentView}">
				<li><a href="/product/${recentView.pronum}"><img src="${recentView.proimg}"></a></li>
			</c:forEach>			
		</ul>
		<a href="javascript:window.scrollTo({top:0,behavior: 'smooth'})">TOP</a>
	</div>
</div>

<script src="../../../resources/js/main.js"></script>

<script>
$(document).ready(function(){
	$(".kakaoQnA").on("click",function(){
		$("#kakao-talk-channel-chat-button a img").trigger("click");
	})
});

</script>

<%@ include file="includes/footer.jsp" %>
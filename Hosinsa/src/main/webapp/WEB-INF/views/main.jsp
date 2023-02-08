<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

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
		<button class="left">&lt;</button>
		<button class="right">&gt;</button>
	</div>
</div>

<ul class="category">
	<li><a class="category" href="${product.category}">상의</a></li>
	<li><a>아우터</a></li>
	<li><a>바지</a></li>
	<li><a>원피스</a></li>
	<li><a>스커트</a></li>
	<li><a>가방</a></li>
	<li><a>신발</a></li>
	<li><a>시계</a></li>
	<li><a>모자</a></li>
	<li><a>액세서리</a></li>
</ul>

<h3 class="title">BEST</h3>
<p class="subTitle">이시간 가장 핫한 상품만 모아모아</p>
<div class="bestWrap">
	<section class="bestList">
		<c:forEach var="bestList" items="${bestList}">
 			<div class="list_box">
				<div class="list_img">
					<img src="${bestList.proimg}">
				</div>
				<div class="article_info">
					<p class="pbrand">${bestList.brand}</p>
					<p class="pname">${bestList.proname}</p>
					<p class="price">${bestList.price}</p>
					<p class="view">view ${bestList.proview}</p>
				</div>
			</div>
	 	</c:forEach>
	</section>
</div>

<h3 class="title">NEW</h3>
<p class="subTitle">따끈따끈 신상품</p>
<div class="newWrap">
	<section class="newList">
		<c:forEach var="newList" items="${newList}">
 			<div class="list_box">
				<div class="list_img">
					<img src="${newList.proimg}">
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
<ul class="pagination">
	<li><a>1</a></li>
	<li><a>2</a></li>
	<li><a>3</a></li>
</ul>

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
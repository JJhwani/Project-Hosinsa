<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

<div class="contentWrap">
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
	<h2 class="productName">${product.proname}</h2>
	<div class="imgWrap">
		<img src="${product.proimg}">
<<<<<<< Updated upstream
	</div>
	<h4 class="miniTitle">Product Info <i>제품정보</i></h4>
	<table class="infoTable">			
		<tr>
			<th> 카테고리 </th> <td> ${product.category} </td>
		</tr>
		<tr>
			<th> 품번 </th> <td>${product.pronum}</td>
		</tr>
		<tr>
			<th> 브랜드 </th> <td>${product.brand}</td>
		</tr>
		<c:if test="${loginUser.grade eq 'S'}">
			<tr>
				<th > 재고 </th> <td> ${product.stock} </td>
			</tr>	
		</c:if>		
	</table>
	<h4 class="miniTitle">Price Info <i>가격정보</i></h4>
	<table class="infoTable">	
		<tr>
			<th> 가격 (비회원) </th> <td> ${product.price} </td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${member.grade eq 'C'}">
					<th> 가격 (브론즈) </th><td>  <fmt:parseNumber integerOnly= "true" value="${product.price*0.98}"/></td>
				</c:when>
				<c:when test="${member.grade eq 'B'}">
					<th> 가격 (실버) </th><td> <fmt:parseNumber integerOnly= "true" value="${product.price*0.97}"/> </td>
				</c:when>
				<c:when test="${member.grade eq 'A'}">
					<th> 가격 (골드) </th><td> <fmt:parseNumber integerOnly= "true" value="${product.price*0.96}"/> </td>
				</c:when>
			</c:choose>
		</tr>
	</table>
	<div class="btnWrap">
		<c:if test="${member.grade eq 'S'}">
			<button class="btn modify">제품 수정</button>
			<button class="btn delete">제품 삭제</button>
		</c:if>		
		
		<input type="number" name="quantity" class="cart_quan" min="1" value="1">
		<button type="button" name="cart" class="cart_in">addToCart</button>
		
		<button class="btn list">뒤로</button>
=======
>>>>>>> Stashed changes
	</div>
	<h4 class="miniTitle"><b>Product Info</b> 제품정보</h4>
	<table>			
		<tr>
			<th> 카테고리 </th> <td> ${product.category} </td>
		</tr>
		<tr>
			<th> 품번 </th> <td>${product.pronum}</td>
		</tr>
		<tr>
			<th> 브랜드 </th> <td>${product.brand}</td>
		</tr>
		<c:if test="${loginUser.grade eq 'S'}">
			<tr>
				<th > 재고 </th> <td> ${product.stock} </td>
			</tr>	
		</c:if>		
	</table>
	<h4 class="miniTitle"><b>Price Info</b> 가격 정보</h4>
	<table>	
		<tr>
			<th> 가격(비회원) </th> <td> ${product.price} </td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${loginUser.grade eq 'C'}">
					<th> 가격(브론즈) </th><td> ${product.price}*0.98</td>
				</c:when>
				<c:when test="${loginUser.grade eq 'B'}">
					<th> 가격(실버) </th><td> ${product.price}*0.97 </td>
				</c:when>
				<c:when test="${loginUser.grade eq 'A'}">
					<th> 가격(골드) </th><td> ${product.price}*0.96 </td>
				</c:when>
			</c:choose>
		</tr>
	</table>
	<c:if test="${loginUser.grade eq 'S'}">
		<button class="btn modify">제품 수정</button>
		<button class="btn delete">제품 삭제</button>
	</c:if>		
	<input type="number" name="quantity" min="1" value="1">
	<button type="button" name="cart">addToCart</button>
	
	<button class="btn list">뒤로</button>
	
	<form action="" method="get">
		<input type="hidden" name="pronum" value="${product.pronum}">
		<input type="hidden" name="quantity" value="">
	</form>
			
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
	
	<form action="" method="get">
		<input type="hidden" name="pronum" value="${product.proimg}">
		<input type="hidden" name="quantity" value="">
	</form>
			
</div>
	
<div class="recent">
	<ul>
		<c:forEach var="recentView" items="${recentView}">
			<li><a><img src="${recentView.proimg}"></a></li>
		</c:forEach>			
	</ul>
	<a>TOP</a>
</div>
	
<%@ include file="includes/footer.jsp" %>
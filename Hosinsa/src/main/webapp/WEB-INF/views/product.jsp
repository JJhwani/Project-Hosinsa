<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

<div id="wrap" align="center">
		<h2>제품 상세보기</h2>
		<table border="1">
			
			<tr>
				<td colspan="2" rowspan="3">
					<c:choose>
						<c:when test="${empty product.proimg}">
							<img src="hosinsa\images\noimage.gif">
						</c:when>
						<c:otherwise>
							<img src="${product.proimg}">
						</c:otherwise>
					</c:choose>
				</td>
				<th> 카테고리 </th> <td> ${product.category} </td>
			</tr>
			<tr>
				<th> 품번 </th> <td>${product.pronum}</td>
			</tr>
			<tr>
				<th> 브랜드 </th> <td>${product.brand}</td>
			</tr>
			
			<tr>
				<th> 가격 </th> <td> ${product.price} </td>
			</tr>
			<tr>
				<th > 이름 </th> <td> ${product.proname} </td>
				<th > 재고 </th> <td> ${product.stock} </td>
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
	<div class="detailView">
		${product.detail }
	</div>
	<div class="review hidden">
		은혜언니가 작업한 리뷰 영역입니다.<br>은혜언니가 작업한 리뷰 영역입니다.<br>은혜언니가 작업한 리뷰 영역입니다.<br>은혜언니가 작업한 리뷰 영역입니다.<br>은혜언니가 작업한 리뷰 영역입니다.<br>
	</div>
</div>
   
<div class="recent">
	<ul>
		<c:forEach var="recentView" items="${recentView}">
			<li><a href="/product/${recentView.pronum}"><img src="${recentView.proimg}"></a></li>
		</c:forEach>         
	</ul>
	<a href="javascript:window.scrollTo({top:0,behavior: 'smooth'})">TOP</a>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		
		$(".tab_info").on("click",function(){
			$(".detailView").removeClass("hidden");
			$(".review").addClass("hidden");
		});
		
		$(".tab_review").on("click",function(){
			$(".review").removeClass("hidden");
			$(".detailView").addClass("hidden");
		});
		
		var productForm = $(".productForm");
		
		$(".modify").on("click",function(){
			productForm.attr("action","/admin/modify").submit();
		});
		
		$(".delete").on("click",function(){
			if(confirm("제품번호 "+${product.pronum}+" : 정말로 삭제하시겠습니까?")){
				productForm.attr("action","/admin/delete").submit();
			}else{
				return false;
			}			
		});
		
	})
</script>

<script src="../../../resources/js/main.js"></script>
<%@ include file="includes/footer.jsp" %>
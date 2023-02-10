<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="contentWrap">
	<form action="/admin/modify" method="post">
		<h2 class="productName">제품명 : <input type="text" name="proname"></h2>
		<div class="imgWrap">
			<img name="proimg" src="${product.proimg}">
		</div>
		<h4 class="miniTitle">Product Info <i>제품정보</i></h4>
		<table class="infoTable">			
			<tr>
				<th> 카테고리 </th> 
				<td> 
					<select name="category">
						<option value="상의">상의</option>
						<option value="아우터">아우터</option>
						<option value="바지">바지</option>
						<option value="원피스">원피스</option>
						<option value="스커트">스커트</option>
						<option value="가방">가방</option>
						<option value="신발">신발</option>
						<option value="시계">시계</option>
						<option value="모자">모자</option>
						<option value="액세서리">액세서리</option>
					</select> 
				</td>
			</tr>
			<tr>
				<th> 품번 </th> <td><input type="text" name="pronum"></td>
			</tr>
			<tr>
				<th> 브랜드 </th> <td><input type="text" name="brand"></td>
			</tr>
			<tr>
				<th> 재고 </th> <td><input type="number" name="stock"></td>
			</tr>
		</table>
		<h4 class="miniTitle">Price Info <i>가격정보</i></h4>
		<table class="infoTable">	
			<tr>
				<th> 가격 (비회원) </th> <td><input type="number" name="price"></td>
			</tr>		
		</table>		
		<h4 class="miniTitle">상세정보</h4>
		<textarea class="inputDetail" name="detail" cols="70" rows="16"></textarea>
		<div class="btnWrap right">
			<button class="btn modify">제품 수정</button>
			<button class="btn delete">제품 삭제</button>
			<button class="btn list">뒤로</button>
		</div>	
	</form>
</div>


<script type="text/javascript">
	
$(document).ready(function(){
	$(".btn.list").on("click",function(e){		
		e.preventDefault();
		history.go(-1);
	})
});
</script>
	
<%@ include file="../includes/footer.jsp" %>
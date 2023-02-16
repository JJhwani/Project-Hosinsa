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
	<form class="selectCategory" action="/category/sorting" method="get">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="sort" value="${sort}">
	</form>
	
	<h2 class="productName">${product.proname}</h2>
	<div class="imgWrap">
		<img src="${product.proimg}">
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
		
		<button class="btn list" onclick="javascript:history.go(-1);">뒤로</button>
	</div>	
	<form class="productForm" action="" method="get">
		<input type="hidden" name="pronum" value="${product.pronum}">
		<input type="hidden" name="quantity" value="">
	</form>
	
	
	<div class="tabWrap tab2">
		<button class="tab tab_info">Info</button>
		<button class="tab tab_review">Review</button>
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
	<a>TOP</a>
</div>

	<!-- 카카오톡 공유하기 -->
	<div>
	<a id="kakaotalk-sharing-btn" href="javascript:;">
	  <img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
	    alt="카카오톡 공유 보내기 버튼" />
	</a>
	</div>
	<!-- 카카오톡 공유하기 -->
	
	<!-- 찜하기 -->
		<div class = "likes">
			<button type="button" class="fa-solid fa-heart" id="likes"> 찜</button>
		</div>
	
	<!-- 찜하기 -->


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

<!-- 카카오톡 공유하기 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('7bd2d13525d6c910e9ea9b4979c6439b'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<script>
Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: '${product.proname}',
      description: '',
      imageUrl:
    	  'https://www.venturesquare.net/wp-content/uploads/2021/02/%EB%AC%B4%EC%8B%A0%EC%82%AC_%EC%82%AC%EC%A7%84%EC%9E%90%EB%A3%8C-%EB%AC%B4%EC%8B%A0%EC%82%AC-CI-%EB%A1%9C%EA%B3%A0.jpg',
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        mobileWebUrl: 'http://localhost:8081/product/${product.pronum}',
        webUrl: 'http://localhost:8081/product/${product.pronum}',
      },
    },
    social: {
      likeCount: 286, //찜
      commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'http://localhost:8081/product/${product.pronum}',
          webUrl: 'http://localhost:8081/product/${product.pronum}',
        },
      },
      {
        title: '앱으로 보기',
        link: {
          mobileWebUrl: 'http://localhost:8081/product/${product.pronum}',
          webUrl: 'http://localhost:8081/product/${product.pronum}',
        },
      },
    ],
  });
</script>



<script src="../../../resources/js/main.js"></script>
<%@ include file="includes/footer.jsp" %>
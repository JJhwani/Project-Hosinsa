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
	<!-- 게시판 목록에서 검색하기 -->
	
		<!-- <form id="searchForm" action="/review/list" method="get">
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
		</form> -->
		
		<div  class="reviewArea">
			
		</div>
		<!-- 페이징 시작 -->
		
		<form action="/review/remove" method="post" class="reviewForm">
			<input type="hidden" value="" name="bno">
			<input type="hidden" value="${product.pronum }" name="pronum">
		</form>
			
		<ul class="pagination">
		  
		  <c:if test="${pageMaker.prev}">
			  <li class="paginate_button previous" ><a href="${pageMaker.startPage-1 }">Privious</a></li>
		  </c:if>
		  
		  <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">			 
			  <li class="paginate_button ${pageMaker.cri.pageNum == num? "active":"" }" ><a href="${num}">${num}</a></li>
		  </c:forEach>
		  
		  <c:if test="${pageMaker.next}">
			  <li class="paginate_button next" ><a href="${pageMaker.endPage+1 }">Next</a></li>
		  </c:if>
		</ul>
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
	</div><!-- //review -->
</div><!-- //contentWrap -->

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
		
		var reviewArea = $(".reviewArea");
		var searchForm = $("#searchForm");
		
		
		$(".tab_review").on("click",function(){
			$(".review").removeClass("hidden");
			$(".detailView").addClass("hidden");
			
			
			$.ajax({
				type:'get',
				url:'/review/list',
				data:{ 'pronum' : ${product.pronum} },
				dataType:'json',
				async : false,
				success:function(list){						
					
					var str="";
					
					if(list.length==0){
						//리뷰가 없을 경우
						searchForm.addClass("hidden");
						str+="<p class='no_review'>아직 리뷰가 없습니다.<br>첫 리뷰의 주인공이 되어 보세요!</p>"
						
					}else{
						for(var i=0, len=list.length; i<len ; i++){
							
							var time = new Date(list[i].uploadDate);
							
							str += "<div class='reviewWrap'><div class='topper'><img class='proimg' src='../../resources/images/upload.jpg'><span class='bno'>"+list[i].bno+"</span><b>"+list[i].nickname+"</b>";
							if("${member.grade}"=="S"){
								str+="<button class='review_delete'>삭제</button>"
							}							
							str += "<i>"+formatDate(time)+"</i></div>";
							str += "<p class='reviewTitle'>" + list[i].title + "</p>";
							str += "<p class='content'>" + list[i].content + "</p></div>";
						}
					}
					reviewArea.html(str);
				}
			});
		});
		
		//날짜 포맷 변경 함수
		function formatDate(date) {
		    
		    var d = new Date(date),
		    
		    month = '' + (d.getMonth() + 1) , 
		    day = '' + d.getDate(), 
		    year = d.getFullYear();
		    
		    if (month.length < 2) month = '0' + month; 
		    if (day.length < 2) day = '0' + day; 
		    
		    return [year, month, day].join('-');
		    
	    }
		
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
		
		
		var reviewForm = $(".reviewForm");
		
		$(document).on("click",".review_delete",function(e){
			var bno =$(this).siblings(".bno").text();
			if(confirm("정말로 삭제하시겠습니까?")){
				reviewForm.find("input[name=bno]").val(bno);
				reviewForm.submit();
			}else{
				return false;
			}		
			
		})
		
	})
</script>

<script src="../../../resources/js/main.js"></script>
<%@ include file="includes/footer.jsp" %>
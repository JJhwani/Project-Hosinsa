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
		<input type="number" class="cart_quan" min="1" value="1">
		<button type="button" name="cart" class="cart_in">addToCart</button>
		
		<button class="btn list" onclick="javascript:history.go(-1);">뒤로</button>
	</div>	
	<form class="productForm" action="/cart/cartIn" method="post">
		<input type="hidden" name="pronum" value="${product.pronum}">
		<input type="hidden" name="quantity" value="">
		<input type="hidden" name="id" value="${member.id }">
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
			<button type="button" class="fa-solid fa-heart" id="likesBtn"> 찜</button>
		</div>
	
	<!-- 찜하기 -->


<script type="text/javascript">
	$(document).ready(function(){
				
		var productForm = $(".productForm");
		
		//카트담기
		$(".cart_in").on("click",function(){
			if("${member}"==""){
				alert("로그인이 필요한 서비스입니다.");
				self.location="/member/login";
				return false;
			}
			//기존 카트에 같은 상품이 있는지 중복체크
			productForm.find("input[name='quantity']").val($(".cart_quan").val());
			productForm.attr({"action":"/cart/checkCart","method":"post"}).submit();			
		});
		
		//체크 후
		if("${check}"=="success"&&"${duplicate}"=="0"){
			//중복이 없는 경우
			productForm.find("input[name='quantity']").val(${quantity});
			productForm.attr({"action":"/cart/cartIn","method":"post"}).submit();
		}else if("${check}"=="success"&&"${duplicate}"!="0"){
			//중복이 존재하는 경우
			if(confirm("해당 상품이 장바구니에 이미 존재합니다. 더 담으시겠습니까?")){
				productForm.find("input[name='quantity']").val(${quantity});
				productForm.attr({"action":"/cart/cartUpdate","method":"post"}).submit();
			}else{
				return false;
			}		
		}
		
		
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
							
							str += "<div class='reviewWrap' data-bno='"+list[i].bno+"'><div class='topper'><img class='proimg' src='../../resources/images/upload.jpg'><span class='bno'>"+list[i].bno+"</span><b>"+list[i].nickname+"</b>";
							if("${member.grade}"=="S"){
								str+="<button class='review_delete'>삭제</button>"
							}							
							str += "<i>"+formatDate(time)+"</i></div>";
							str += "<p class='reviewTitle'>" + list[i].title + "</p>";
							str += "<p class='content'>" + list[i].content + "</p>";

							str += "<p class='reReplyWrap'><button class='reReply'> 댓글 "+list[i].reReply +"개</button>";
							if("${member}"!=""){
								str+="<button class='reReply_register'>댓글 쓰기</button>";
							}
							str += "</p></div>";
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
		
		
		//댓글 삭제
		$(".modify").on("click",function(){
			productForm.attr("action","/admin/modify").attr("method","get").submit();
		});
		
		$(".delete").on("click",function(){
			if(confirm("제품번호 "+${product.pronum}+" : 정말로 삭제하시겠습니까?")){				
				productForm.attr("action","/admin/delete").attr("method","get").submit();
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
		
		//대댓글 표시
		$(document).on("click",".reReply",function(e){
			var replyNum = $(this).parent().siblings(".topper").find(".bno").text();
			var reviewWrap = $(this).parent(".reReplyWrap");
			var button = $(this);
			$(this).attr("disabled","disabled");		
			$.ajax({
				type:'get',
				url:'/replies/'+replyNum,
				dataType:'json',
				success:function(list){	
					var str="";
					for(var i=0, len=list.length; i<len ; i++){
						
						var time = new Date(list[i].replyDate);
						str += "<div class='reviewWrap2'><div class='topper'><img class='proimg' src='../../resources/images/upload.jpg'><span class='bno'>"+list[i].rno+"</span><b>"+list[i].replyer+"</b>";
						if(list[i].id == "${member.id}"){
							str+= "<button class='reReply_delete'>삭제</button>";
						}
						str += "<i>"+formatDate(time)+"</i></div>";
						str += "<p class='content'>" + list[i].reply + "</p></div>";
					}					
					reviewWrap.append(str);
					button.html("댓글 "+list.length+"개");
				}
			})
			
		})//대댓글 표시 끝
		
		var modal = $("#myModal");
		var closeBtn = $("#modalCloseBtn");
		
		var replyNum = 0;
		
		closeBtn.on("click",function(){
			modal.find("input").val("");
			modal.addClass("hidden");
			$("body").removeClass("fix");
		})
		
		//대댓글 작성
		$(document).on("click",".reReply_register",function(e){
			modal.removeClass("hidden");
			$("body").addClass("fix");
			
			replyNum = $(this).parent().siblings(".topper").find(".bno").text();			
		});		
		
		$("#modalRegBtn").on("click",function(){
			if ($("input[name='reply']").val()==""){
				alert("댓글 내용을 입력하세요");
				$("input[name='reply']").focus();
				return false;
			}
			
			var reviewreply = {
					reply : $("input[name='reply']").val(),
					replyer : "${member.nickname}",
					bno : replyNum,
					id : "${member.id}"
			};
			replyService.add(reviewreply, function(result) {
				
				alert("댓글이 등록되었습니다.");
				
				var selectDiv = $(".reviewWrap[data-bno="+replyNum+"]");
				selectDiv.find(".reviewWrap2").remove();
				
				selectDiv.find(".reReply").removeAttr("disabled").trigger("click").attr("disabled","disabled");
				
				modal.find("input").val("");
				modal.addClass("hidden");
				
			});
		})
		
		//대댓글 삭제
		$(document).on("click",".reReply_delete",function(e){
			var rno = $(this).siblings(".bno").text();
			var selectDiv = $(this).parents(".reReplyWrap")
			
			
			if(confirm("댓글을 삭제하시겠습니까?")){
				replyService.remove(rno,function(){
					alert("삭제되었습니다.");
					selectDiv.find(".reviewWrap2").remove();
					selectDiv.find(".reReply").removeAttr("disabled").trigger("click").attr("disabled","disabled");
				});
			}else{
				return false;
			}
		})
			
		if("${cartIn}"=="success"){
			if(confirm("장바구니에 상품이 담겼습니다. 지금 확인하시겠습니까?")){
				location.href="/cart/list";
			}else{
				return false;
			}
		}
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

<script>

//상품상세페이지 찜하기
/*$(document).ready (function() {

	$("#likesBtn").click(function(event) {
       
		event.preventDefault();
	
	if("${member.id}" == "") {  //찜하기 전 회원 여부 체크
	  if(confirm("로그인회원만 사용가능합니다.")) {
		location.href="/member/login"; //이동페이지는 컨트롤러로 넘긴다
	}else{ 
		location.reload();
	}
	}else{
		var id = "${member.id}"; //아이디값
		var pronum = "${product.pronum}"; //프로넘

		console.log("m_id" + id);
		console.log("product.pronum" + pronum);

		var form = {
			id : id,
			pronum : pronum

		};
		
		console.log(form);
	
	$.ajax ({
		type : 'POST',
		url : '/likes/new',
		data : JSON.stringify(form),
		contentType : "application/json; charset=utf-8",
		success : function(result) {
			if(result == "success") {
				console.log("찜성공!");
			  if(confirm("해당 상품을 찜했습니다. 마이페이지로 이동하시겠습니까?"))
			  location.href="/member/myPage";
			}else{
				location.reload(); 
				
				
			}
		 	}
	  		})
			}
		})  
 	   });*/
</script>
	
<script>
	$(document).ready (function() {

	$("#likesBtn").click(function(e) {
		
		

		var id = "${member.id}"; //아이디값
		var pronum = "${product.pronum}"; //프로넘
		var form = {
				id : id,
				pronum : pronum
			};
		console.log(form);
	$.ajax ({
		type : 'POST',
		url : '/likes/lno',
		data :  JSON.stringify(form),
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		success : function(result) {	
			alert(result);
		if (result == 0) { 
			alert("진행");
			// 0일 때 안겹침
		}else{
			if(confirm("이미 찜이 된 상품입니다. 마이페이지로 이동하시겠습니까?")) {
				location.href="/member/myPage";
			}else{
				return false;
			}
		};
			 
		}
		});	
	});
});
</script>
 
 
 
 
  <!--//if문으로 조건에 따라서 나눠지게 설계하기. ajax는 활용하면서..
  css로 검정하트 색 변환 가능.. 찜하기 / 삭제 두개만 진행 -->
  


<script src="../../../resources/js/main.js"></script>
<%@ include file="includes/footer.jsp" %>
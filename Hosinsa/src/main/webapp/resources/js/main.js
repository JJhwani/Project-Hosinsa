$(document).ready(function(){      

	$(".arrow button").on("click",function(){
		if($(this).attr("class")=="left"){
			$(".bannerView li:eq(4)").prependTo($(".bannerView"));
		}
		if($(this).attr("class")=="right"){
			$(".bannerView li:eq(0)").appendTo($(".bannerView"));
		}
	});
	
	//메인배너 4초마다 자동 슬라이드 기능- 마우스오버시 멈춤, 마우스 치우면 재실행
	
	const slide = function(){
		$(".arrow .right").trigger("click");
	}
	
	let timeBanner = setInterval(slide,4000);
	
	$(".bannerView li").on({
		mouseover:function(){
			clearInterval(timeBanner);
		},
		mouseleave:function(){
			timeBanner = setInterval(slide,4000)
		}
	});
 
	var selectCategory = $(".selectCategory");
	var paging = $(".paging");
	var sorting = $(".sorting");
 
	
	//카테고리 클릭 -> 해당 카테고리 LIST 출력
	$(".category").on("click",function(e){
		e.preventDefault();
		selectCategory.find("input[name='category']").val($(this).attr("href"));
		selectCategory.find("input[name='sort']").attr("value", "");
		selectCategory.submit();
	});
	
	//소팅 클릭
	$(".sort").on("click", function(e) {
		e.preventDefault();
		sorting.find("input[name='sort']").val($(this).attr("href"));
		sorting.submit();
	});
	
	//페이징처리
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		paging.find("input[name='pageNum']").val($(this).attr("href"));
		paging.submit();
	});
	
	//검색창
	$(".search button").on("click", function(e){
		if(!search.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}		
		search.find("input[name='pageNum']").val("1");
		e.preventDefault();
		search.submit();
	});

 });
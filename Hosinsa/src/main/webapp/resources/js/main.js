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
	})

	var selectCategory = $(".selectCategory");
	var paging = $(".paging");
	var sorting = $(".sorting");
	var search = $(".search");
	var notice  = $(".notice");
	var cs = $(".cs");
	var event = $(".event");
	var noticeBoard = $(".noticeBoard");
	var csBoard = $(".csBoard");
	var eventBoard = $(".eventBoard");

	//카테고리 클릭 -> 해당 카테고리 LIST 출력
	$(".category").on("click",function(e){
		e.preventDefault();
		selectCategory.find("input[name='category']").val($(this).attr("href"));
		//selectCategory.attr("action", "/category");
		selectCategory.submit();
	});

	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		paging.find("input[name='pageNum']").val($(this).attr("href"));
		paging.submit();
	});

	// 이벤트 게시판으로 이동
	$(".eventBoard a").on("click", function(e) {
		e.preventDefault();
		eventBoard.attr("action","/board/event/list");
		eventBoard.submit();
	});

	$(".event ul a").on("click", function(e) {
		e.preventDefault();
		eventBoard.append("<input type='hidden' name='event_no' value='"+$(this).attr("href")+"'>");
		eventBoard.attr("action", "/board/event/read");
		eventBoard.submit();
	});


 });

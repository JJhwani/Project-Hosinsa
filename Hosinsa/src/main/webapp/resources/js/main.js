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
	
});
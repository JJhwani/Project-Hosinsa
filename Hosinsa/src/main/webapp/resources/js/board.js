$(document).ready(function(){      
	
	var paging = $(".paging");

	// 개별 이벤트 페이지로 이동
	$(".move").on("click", function(e){
		e.preventDefault();
		paging.find("input[name='event_no']").remove();
		paging.append("<input type='hidden' name='event_no' value='"+$(this).attr("href")+"'>");
		paging.attr("action", "/board/event/read");
		paging.submit();
	});

	//페이징처리
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		paging.find("input[name='pageNum']").val($(this).attr("href"));
		paging.submit();
	});
	
	// 이벤트 수정 페이지로 이동
	$("button[data-oper='modify']").on("click",function(e){
		paging.attr("action","/board/event/modify").submit();
	});
	
	// 이벤트 리스트 페이지로 이동
	$("button[data-oper='list']").on("click",function(e){
		paging.find("input[name='event_no']").remove();
		paging.attr("action","/board/event/list");
		paging.submit();
	})


 });
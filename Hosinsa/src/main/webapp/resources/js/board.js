$(document).ready(function(){      
	
	var paging = $(".paging");
	var eventForm = $(".eventForm")

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

	$("input[name='event_img']").val($(".event_img").attr("src"));
	
	$(".event_img").on("click",function(e){
		$(".event_imgFile").click();
	})
	
	//업로드 이미지 미리보기
	$(".event_imgFile").change(function() {
        readURL(this);
    });
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('.event_img').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
	
	$(".btn.list").on("click",function(e){		
		e.preventDefault();
		history.go(-1);
	})

	$(".adminList button").on("click",function(e){
		var tempNum = $(this).parent().siblings(".pronum").text();
		eventForm.find("input[name='pronum']").val(tempNum);
		
		if($(this).attr("class")=="modify"){
			eventForm.attr("action","/board/event/modify");
		}else if($(this).attr("class")=="delete"){
			if(confirm("제품번호 "+tempNum+" : 정말로 삭제하시겠습니까?")){
				eventForm.attr("action","/board/event/remove");
			}else{
				return false;
			}
		}		
		productForm.submit();
	})	

	if("${modify}"==="success"){
		alert("수정 요청이 성공적으로 처리되었습니다.");
	}
	if("${remove}"==="success"){
		alert("제품 삭제가 성공적으로 처리되었습니다.");
	}

 });
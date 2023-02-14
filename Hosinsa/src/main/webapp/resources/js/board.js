$(document).ready(function(){      
	
	var paging = $(".paging");
	var eventForm = $(".eventForm")
	var eventModify = $(".eventModify")

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

	// 이벤트 등록 페이지로 이동
	$(".register").on("click", function(e) {
		e.preventDefault();
		$(".register").attr("href", "/board/event/register");
		$(".register").submit();
	});
	
	// 이벤트 수정 페이지로 이동
	$(".eventRead .modify").on("click",function(e){
		eventForm.attr("method","get")
		eventForm.attr("action","/board/event/modify").submit();
	});
	
	// 이벤트 리스트 페이지로 이동
	$(".eventRead .list").on("click",function(e){
		eventForm.find("input[name='event_no']").remove();
		eventForm.attr("action","/board/event/list");
		eventForm.submit();
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
	


	// 이벤트 수정 페이지에서 이벤트 리드 페이지로 가기
	$(".btn.list").on("click",function(e){		
		e.preventDefault();
		history.go(-1);
	})

	// 이벤트 수정 페이지에서 이벤트 삭제 페이지로 가기
	$(".btn.remove").on("click",function(e){		
		e.preventDefault();
		eventModify.attr("action","/board/event/remove");
		eventModify.submit();
	})



	//이벤트 수정 유효성 체크
//	$(".btn.modify").on("click",function(e){		
//		e.preventDefault();
//		if($("input[name=title]").val("")){
//			alert("제목을 입력해 주세요.");
//			return false;
//		}
//		else if($("input[name=subtext]").val("")){
//			alert("소제목을 입력해 주세요.");
//         return false;
//		}
//		else if($("input[name=start_date]").val("")){
//			alert("시작날짜를 입력해 주세요.");
//			return false;
//		}
//		else if($("input[name=end_date]").val("")){
//			alert("종료날짜를 입력해 주세요.");
//			return false;
//		}
//		else if($("input[name=content]").val("")){
//			alert("상세정보를 입력해 주세요.");
//			return false;
//		}
//	})


 });
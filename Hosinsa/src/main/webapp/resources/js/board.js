$(document).ready(function(){      
	
	var paging = $(".paging");
	var eventForm = $(".eventForm");
	var eventRegister = $(".eventRegister");
	var eventModify = $(".eventModify");
	var search = $(".search");
	var noticeRead = $(".noticeRead")
	var noticeModify = $(".noticeModify")


	//페이징처리
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		paging.find("input[name='pageNum']").val($(this).attr("href"));
		paging.submit();
	});

	// 이벤트 리스트 페이지에서 개별 이벤트 페이지로 이동
	$(".event_box .move").on("click", function(e){
		e.preventDefault();
		paging.find("input[name='event_no']").remove();
		paging.append("<input type='hidden' name='event_no' value='"+$(this).attr("href")+"'>");
		paging.attr("action", "/board/event/read");
		paging.submit();
	});

	// 개별 이벤트 페이지에서 이벤트 수정 페이지로 이동
	$(".eventRead .btn.modify").on("click",function(e){
		eventForm.attr("method","get")
		eventForm.attr("action","/board/event/modify").submit();
	});
	
	// 개별 이벤트 페이지에서 이벤트 리스트 페이지로 이동
	$(".eventRead .btn.list").on("click",function(e){
		eventForm.find("input[name='event_no']").remove();
		eventForm.attr("action","/board/event/list");
		eventForm.submit();
	})

	// 이벤트 등록폼에서 이벤트 등록 페이지로 이동
	$(".eventRegister .btn.register").on("click",function(e){
		eventRegister.attr("action","/board/event/register").submit();
	});
	
	// 이벤트 등록 페이지에서 이벤트 리스트 페이지로 이동
	$(".eventRegister .btn.list").on("click",function(e){
		eventRegister.attr("action","/board/event/list");
		eventRegister.submit();
	})

	// 이벤트 등록 유효성 체크
	$(".eventRegister .btn.register").on("click",function(e){		
		e.preventDefault();
		if($("input[name=event_pw]").val() == ""){
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		else if($("input[name=event_pw]").val().length < 4){
			alert("비밀번호는 4자 이상 10자 이내로 입력해주세요.");
			return false;
		}
		else if($("input[name=event_pw]").val().length > 10){
			alert("비밀번호는 4자 이상 10자 이내로 입력해주세요.");
			return false;
		}
		else if($("input[name=title]").val() == ""){
			alert("제목을 입력해 주세요.");
			return false;
		}
		else if($("input[name=subtext]").val() == ""){
			alert("소제목을 입력해 주세요.");
         return false;
		}
		else if($("input[name=start_date]").val() == ""){
			alert("시작날짜를 입력해 주세요.");
			return false;
		}
		else if($("input[name=end_date]").val() == ""){
			alert("종료날짜를 입력해 주세요.");
			return false;
		}
		else if($(".inputDetail").val() == ""){
			alert("상세정보를 입력해 주세요.");
			return false;
		}
	})

	// 이벤트 수정 페이지에서 이벤트 리드 페이지로 가기
	$(".eventModify .btn.list").on("click",function(e){		
		e.preventDefault();
		history.go(-1);
	})

	// 이벤트 수정 페이지에서 이벤트 삭제 페이지로 가기
	$(".eventModify .btn.remove").on("click",function(e){		
		e.preventDefault();
		eventModify.append("<input type='hidden' name='event_no' value='"
			+eventModify.find("input[name=event_no]").val()+"'>");
		eventModify.attr("action","/board/event/remove");
		eventModify.submit();
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

	// 공지사항 게시판에서 개별 공지사항 페이지로 이동
	$(".Notice .move").on("click", function(e){
		e.preventDefault();
		paging.find("input[name='nno']").remove();
		paging.append("<input type='hidden' name='nno' value='"+$(this).attr("href")+"'>");
		paging.attr("action", "/board/notice/read");
		paging.submit();
	});

	// 공지사항 게시판에서 검색버튼 클릭시
	$(".search button").on("click", function(e){
		if(!search.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}		
		search.find("input[name='pageNum']").val("1");
		search.find("input[name='amount']").val("28");
		e.preventDefault();
		search.submit();
	});

	// 개별 공지사항 페이지에서 공지사항 수정 페이지로 이동
	$(".noticeRead .btn.modify").on("click",function(e){
		noticeRead.attr("method","get")
		noticeRead.attr("action","/board/notice/modify");
		noticeRead.submit();
	});
	
	// 개별 공지사항 페이지에서 공지사항 게시판으로 이동
	$(".noticeRead .btn.list").on("click",function(e){
		noticeRead.find("input[name='event_no']").remove();
		noticeRead.attr("action","/board/notice/list");
		noticeRead.submit();
	})


	// 공지사항 수정 페이지에서 공지사항 게시판으로 가기
	$(".noticeModify .btn.list").on("click",function(e){		
		e.preventDefault();
		noticeModify.attr("action","/board/notice/list");
		noticeModify.attr("method","post");
		noticeModify.submit();
	})

	// 공지사항 수정 페이지에서 공지사항 삭제 페이지로 가기
	$(".noticeModify .btn.remove").on("click",function(e){		
		e.preventDefault();
		noticeModify.append("<input type='hidden' name='nno' value='"
			+noticeModify.find("input[name=nno]").val()+"'>");
		noticeModify.attr("action","/board/notice/remove");
		noticeModify.submit();
	})
 });
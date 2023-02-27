<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<%@include file="../includes/header.jsp"%>

<div class="container">
	<h2>문의사항 조회</h2>

	<div class="form-group">
		<label>번호</label> 
		<input class="form-control" name='qno'
			value='<c:out value="${qna.qno }"/>' readonly="readonly">
	</div>

	<div class="form-group">
		<label>카테고리</label> <input class="form-control" name='category'
			value='<c:out value="${qna.category }"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>제목</label> <input class="form-control" name='title'
			value='<c:out value="${qna.title }"/>' readonly="readonly">
	</div>

	<div class="form-group">
		<label>내용</label>
		<textarea class="form-control" rows="10" name='content'
			readonly="readonly"><c:out value="${qna.content}" /></textarea>
	</div>

	<div class="form-group">
		<label>작성자</label> <input class="form-control" name='id'
			value='<c:out value="${qna.id }"/>' readonly="readonly">
	</div>

<div class="form-group">
 <label>첨부파일</label>
	 <img src="${qna.photo1}">
	 <img src="${qna.photo2}">
	 <img src="${qna.photo3}">
	</div>
	
		<button data-oper='list' class="btn btn-default"
			onclick="location.href='/qna/list'">목록</button>
		<button data-oper='modify' class="btn"
			onclick="location.href='/qna/modify?qno=<c:out value="${qna.qno}"/>'">수정
		</button>

<!-- 검색 처리 -->
	<form id='operForm' action="/qna/modify" method="get">
		<input type='hidden' id='qno' name='qno' value='<c:out value="${qna.qno}"/>'> 
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> 
		<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	</form>

</div>

<!-- 댓글 처리-->
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">
            <i class="fa-regular fa-comment-dots"></i> 답변
            <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>답변 작성하기</button>
         </div>


      </div>

      <!-- /.panel-heading -->
      <div class="panel-body">

         <ul class="chat">
         </ul>

      </div>
      <!-- /.panel .chat-panel -->
     
      <div class="panel-footer"></div>
      
   </div>
</div>
<!-- ./ end row -->

<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">답변 작성창</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>답변 내용</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>작성자</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2023-02-17 13:13'>
              </div>
      
            </div>
<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
<script type="text/javascript" src="/resources/js/reply.js"></script>


<script>



$(document).ready(function () {
  
  var qnoValue = '<c:out value="${qna.qno}"/>';
  var replyUL = $(".chat");
  
    showList(1);
    
    function showList(page){
    	
     	console.log("show list " + page);
        
        replyService.getList({qno:qnoValue,page: page|| 1 }, function(replyCnt, list) {
          
        console.log("replyCnt: "+ replyCnt );
        console.log("list: " + list);
        console.log(list);
        
        if(page == -1){
          pageNum = Math.ceil(replyCnt/10.0);
          showList(pageNum);
          return;
        } 
          
         var str="";
         
         if(list == null || list.length == 0){
           return;
         }         

          for (var i = 0, len = list.length || 0; i < len; i++) {
              //첨부파일 나오게 수정
           	  str += "<p class='qnaphoto'>";
				//"'onerror='this.remove ? this.remove() : this.removeNode()'/>" -> 사진이 없을 경우 엑박이 안나옴
				str += "<img src='"+list[i].photo1 + "'onerror='this.remove ? this.remove() : this.removeNode()'/>";
				str += "<img src='"+list[i].photo2 + "'onerror='this.remove ? this.remove() : this.removeNode()'/>";
				str += "<img src='"+list[i].photo3 + "'onerror='this.remove ? this.remove() : this.removeNode()'/>";
				str += "</p>";
				
             str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
             str +="  <div><div class='header'><strong class='primary-font'>["
          	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
             str +="    <small class='pull-right text-muted'>"
                 +replyService.displayTime(list[i].replyDate)+"</small></div>";
             str +="    <p>"+list[i].reply+"</p></div></li>";
             
           }
         replyUL.html(str);
         
         showReplyPage(replyCnt);

     
       });//end function
         
     }//end showList
     
     
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    //댓글 페이지 번호 출력
    function showReplyPage(replyCnt){
      
       var endNum = Math.ceil(pageNum / 10.0) * 10;  
       var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
               
      if(endNum * 10 >= replyCnt){
         endNum = Math.ceil(replyCnt/10.0);
      }
               
      if(endNum * 10 < replyCnt){
         next = true;
      }
               
      var str = "<ul class='pagination pull-right'>";
               
      if(prev){
         str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
               
      for(var i = startNum ; i <= endNum; i++){
                 
         var active = pageNum == i? "active":"";
                    
         str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
         str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
               
      str += "</ul></div>";
               
      console.log(str);
               
      replyPageFooter.html(str);
   }
   
    //페이지 번호 클릭시 새로운 댓글 가져오기
    replyPageFooter.on("click","li a", function(e){
        e.preventDefault();
        console.log("page click");
        
        var targetPageNum = $(this).attr("href");
        
        console.log("targetPageNum: " + targetPageNum);
        
        pageNum = targetPageNum;
        
       showList(pageNum);
   }); 
    
  //댓글 추가시 버튼 이벤트 처리
    var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
     $("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
    
    $("#addReplyBtn").on("click", function(e){
      
      modal.find("input").val("");
      modalInputReplyDate.closest("div").hide();
      modal.find("button[id !='modalCloseBtn']").hide();
      
      modalRegisterBtn.show();
      
      $(".modal").modal("show");
      
    });
    

    modalRegisterBtn.on("click",function(e){
      
      var reply = {
            reply: modalInputReply.val(),
            replyer:modalInputReplyer.val(),
            qno:qnoValue
          };
      replyService.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");
        modal.modal("hide");
        
      showList(-1); 
        
      });
      
    });
    

    //댓글 조회 클릭 이벤트 처리 
      $(".chat").on("click", "li", function(e){
        
        var rno = $(this).data("rno");
        
        replyService.get(rno, function(reply){
        
          modalInputReply.val(reply.reply);
          modalInputReplyer.val(reply.replyer);
          modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
          .attr("readonly","readonly");
          modal.data("rno", reply.rno);
          
          modal.find("button[id !='modalCloseBtn']").hide();
          modalModBtn.show();
          modalRemoveBtn.show();
          
          $(".modal").modal("show");
              
        });
      });
    
    //댓글 수정후 댓글 목록 갱신
     modalModBtn.on("click", function(e){
      
      var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
      
      replyService.update(reply, function(result){
            
        alert(result);
        modal.modal("hide");
        showList(pageNum); //현재 보고 있는 댓글 페이지 번호 호출
        
      });
      
    });

    //댓글 삭제후 댓글 목록 갱신
    modalRemoveBtn.on("click", function (e){
    	  
  	  var rno = modal.data("rno");
  	  
  	  replyService.remove(rno, function(result){
  	        
  	      alert(result);
  	      modal.modal("hide");
  	      showList(pageNum);
  	      
  	  });
  	  
  	}); 
  	
});   

</script>

<script type="text/javascript">
   $(document).ready(function() {
      console.log(replyService);
   });
</script> 

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/qna/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#qno").remove();
			operForm.attr("action", "/qna/list")
			operForm.submit();

		});
	});
</script>


     
<%@include file="../includes/footer.jsp"%>
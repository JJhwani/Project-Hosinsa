<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
   
<%@include file="../includes/header.jsp" %>

<h1>get</h1>

		<div class="form-group">
			<label>Bno</label><input class="form-control" name='bno' value="${review.bno}" readonly>
		</div>
		
		<div class="form-group">
			<label>Title</label><input class="form-control" name='bno' value="${review.title}" readonly>
		</div>
		
		<div class="form-group">
			<label>Text area</label><textarea class="form-control" rows="5" name='content' readonly> ${review.content} </textarea>
		</div>
		
		<div class="form-group">
			<label>Nickname</label><input class="form-control" name='nickname' value="${review.nickname}" readonly>
		</div>
		
		
		<button data-oper='modify' class="btn btn-default" 
					onclick="location.href='/review/modify?bno=${review.bno }'">modify</button>
		<button data-oper='list' class="btn btn-info" 
					onclick="location.href='/review/list'">List</button>
			
		
			
		<form action='operForm' action="/review/modify" method="get">
			<input type='hidden' id='bno' name='bno' value="${review.bno }">
			<input type='hidden' name='pageNum' value="${cri.pageNum }">
			<input type='hidden' name='amount' value="${cri.amount }">
			<input type='hidden' name='keyword' value="${cri.keyword }">
			<input type='hidden' name='type' value="${cri.type }">
		</form>
	
		
	
		<!-- 댓글 처리 -->
		<div>
			<ul class="chat">
			  <li class="left clearfix" data-rno='12'>
			   <div class="header">
				<strong class="primary-font">user00</strong>
				<small class="pull-rigth text-muted">2023-01-13</small>
			   </div>
				<p>댓글댓글<p>
			 </li>
			</ul>
		</div>
		<!-- 댓글 처리 종료 -->
		
		
		<!-- 새로운 댓글등록 버튼 -->
		<div class="panel-heading">
		  <i class="fa fa-comments fa-fw"></i>Reply
			<div>
				<button id ="addReplyBtn" class="btn btn-primary btn-xs pull-rigth">새로운 댓글 등록</button>
			</div>
		</div>
		<!-- 새로운 댓글등록 버튼종료 -->
		
		<!-- Modal -->
		  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  	<div class="modal-dialog">
		  	  <div class="modal-content">
		  		<div class="modal-header">
		  		  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		  		  <h4 class="modal-title" id="myModalLabel">ReplyModal</h4>
		  		</div>
		  		<div class="modal-body">
		  		  
		  		  <div class="form-group">
		  		  <label>Reply</label>
		  		  <input class="form-control" name="reply" value="New Reply">
		  		  </div>
		  		  
		  		  <div class="form-group">
		  		  <label>Replyer</label>
		  		  <input class="form-control" name="replyer" value="Replyer">
		  		  </div>
		  		  
		  		  <div class="form-group">
		  		  <label>Reply Date</label>
		  		  <input class="form-control" name="replyDate" value="">
		  		  </div>
		  		
		  		</div>
		  		
		  		<div class="modal-footer">
		  			<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
		  			<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
		  			<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		  		</div>	
		  	  </div>
		  	</div> 		  
		  </div>
			<!-- Modal 끝 -->
		
<script type="text/javascript" src="/resources/js/reviewreply.js"></script>
<script>

$(document).ready(function() {
	
	var bnoValue = '<c:out value="${review.bno}"/>';
	var replyUL = $(".chat");
	
		showList(1);
		
		function showList(page) {
			
			reviewreplyService.getList(
					{bno: bnovalue, page: page|| 1}, function(list) {
			
				var str="";
				if(list == null || list.length ==0){
					replyUL.html("");
				
					return ;
				}
				
				for(var i=0, len=list.length || 0; i<len ; i++){
					str += "<li class='left clearfix' data-rno='"+list[i].rno+" '>";
					str += "<div>";
					str += "<div class='header'>";
					str += "<strong class='primary-font'>" + list[i].replyer + "</strong>";
					str += "<small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate)  + "</small>";
					str += "</div>";
					str += "<p>"+ list[i].reply +"</p>";
					str += "</div></li>";
				}

				replyUL.html(str);
				
				});
			} //end showList
		});		
			
				
			//댓글 모달처리
			var modal = $(".modal");
			var modalInputReply = modal.find("input[name='reply']");
			var modalInputReplyer = modal.find("input[name='replyer']")
			var mpdalInputReplyerDate = modal.find("input[name='replyDate']");
			
			var modalMoBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");
			
			$("addReplyBtn").on("click", function(e){
				
				modal.find("input").val("");
				modalInputReplyDate.closest("div").hide();
				modal.find("button[id !='modalCloseBtn']").hide();
				
				modalRegisterBtn.show();
				
				$(".modal").show();
				
			});
			
			//새로운 댓글추가
			
			modalRegisterBtn.on("click", function(e){
			
					var reply = {
							reply : modalInputReply.val(),
							replyer : modalInputReplyer.val(),
							bno : bnoValue
					};
				reviewreplyService.add(reply, function(result) {
					
					alert(result);
					
					modal.find("input").val("");
					modal.modal("hide");
				});
			});

			//댓글 클릭 이벤트 처리
			$(".chat").on("click","li",function(e) {
				
				var rno = $(this).data("rno");
				
				reviewreplyService.get(rno,function(reply){
					
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer);
					modalInputReplyDate.val(reviewreplyService.displayTime (reply.replyDate)).attr("readonly","readonly");
					modal.data("rno",reply.rno);
					
					modal.find("button[id !='modalCloseBtn']").hide();
					modalModBtn.show();
					modalRemoveBtn.show();
					
					$(".modal").show();
					
				});
			});
			
			//댓글 수정
			modalModBtn.on("click", function(e){
				
				var reply = {rno : modal.data("rno"),reply:modalInputReply.val()};
				
				reviewreplyService.update(reply,function(result){
					
					alert(result);
					modal.modal("hide");
					showList(1);
					
				
				});
			});
			
			//댓글 삭제
			modalRemoveBtn.on("click", function(e){
				
				var rno = modal.data("rno");
				
				reviewreplyService.remove(rno,function(result){
					
					alert(result);
					modal.modal("hide");
					showList(1);
				});
			});
	
</script>


<script>
	$(document).ready(function(){
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action", "/review/modify").submit();
		});
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#bno").remove();
			operForm.attr("action", "/review/list");
			operForm.submit();
		});
		
		
	});
</script> 

<%@include file="../includes/footer.jsp" %>
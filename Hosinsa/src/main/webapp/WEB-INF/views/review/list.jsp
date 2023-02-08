<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>list</h1>

<div>
	<table>
	  <tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일자</th>
	  </tr>
	  
	  <c:forEach items="${list }" var = "review">
	  	<tr>
	  		<td><c:out value="${review.bno }"/></td>
	  		<td><a href='/review/get?bno=${review.bno }'></a></td>
	  		<td><c:out value="${review.title }"/></td>
	  		<td><c:out value="${review.nickname }"/></td>
	  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.uploadDate }"/></td>
	  	</tr>
	  </c:forEach>
		
	</table>
	
	
	<!-- register버튼 -->
	<div>
		<button id='regBtn' type="button" class="btn btn-xs pull-right">리뷰쓰기</button>	
	</div>
	<!-- register버튼 끝 -->
	
	
	
</div>




<!-- 모달모달모달모달모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
  	 		 <div class="modal-header">
  				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
	  		 </div>
	  
			  <div class="modal-body">처리 완료</div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
				
			 </div>
    	</div> <!-- modal-content -->
 	</div> <!-- modal-dialog -->
</div> <!-- 모달 끝 -->



<script type="text/javascript">
	$(document).ready(function(){
	var result = '${result}'

	checkModal(result);
	
	history.replaceState({},null,null); //히스토리를 쌓으면서 모달창을 보여줄 필요X

	function checkModal(result) {

		if(result ==='' || history.state) {
			return;
		}

		if (parseInt(result) > 0) {
			$(".modal-body").html("상품평" + parseInt(result) + "이 등록되었습니다.");
		}

		$("#myModal").show();
		
		}
	
		$("#regBtn").on("click", function() {
			self.location = "/review/register";
		});

	});



</script>



<%@include file="../includes/footer.jsp" %>

</body>
</html>
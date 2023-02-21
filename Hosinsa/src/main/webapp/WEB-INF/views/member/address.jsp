<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<div class="">


</div>

<script src="../../../resources/js/board.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${register}"==="success"){
		alert("주소 등록이 성공적으로 처리되었습니다.");
	}
	if("${modify}"==="success"){
		alert("주소 수정이 성공적으로 처리되었습니다.");
	}
	if("${remove}"==="success"){
		alert("주소 삭제가 성공적으로 처리되었습니다.");
	}
});
</script>

<%@ include file="../includes/footer.jsp" %>
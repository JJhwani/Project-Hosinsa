<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="../../../resources/css/HosinsaLogin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>  
<body>
<br><br>
    <div class="slider">
        <div class="login">
            <form id="loginForm" method="post" action="/login">
            <input type="hidden" name="grade" value="${member.grade}">
                <div class="login_box">
                	<div>
                    	<span style="text-align: center;">ID</span>
                    	<input type="text" name="id" id="id">
                    </div>
                    <br><br>
                    <div>
                    	<span style="text-align: center;">PASSWORD</span>
                    	<input id="pw" type="password" name="pw">
                    </div>
                    <br><br>
                    <c:if test="${result == 0}">
                    	<div class="login_warn">ID 또는 비밀번호를 잘못 입력하였습니다.</div>
                    </c:if>
                    <div>
                    	<input type="button" value="LOG IN" class="input_login" id="loginBtn">
                    	<br><br>
                    	<button id="JoinBtn" type="button">JOIN MEMBER</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <footer></footer>
</body>

<script type="text/javascript">
$(document).ready(function() {
	$("#JoinBtn").on("click", function() {
		self.location = "/member/join";
	});
	
	$(".input_login").click(function(){
		$("#loginForm").attr("action", "/member/login");
        $("#loginForm").submit();
	});
	
});
</script>
</html>

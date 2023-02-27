<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" href="../../../resources/css/HosinsaLogin.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 네아로 SDK -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<body>
	<br>
	<br>
	<div class="slider">
		<div class="login">
			<form id="loginForm" method="post" action="/login">
				<p class="welcome">* WELCOME TO MY HOSINSA *</p>
				<input type="hidden" name="grade" value="${member.grade}">
				<div class="login_box">
					<div>
						<span style="text-align: center;">ID</span> <input type="text"
							name="id" id="id">
					</div>
				
					<div>
						<span style="text-align: center;">PASSWORD</span> <input id="pw"
							type="password" name="pw">
					</div>
					
					<c:if test="${result == 0}">
						<div class="login_warn">ID 또는 비밀번호를 잘못 입력하였습니다.</div>
					</c:if>
					<div>
						<input type="button" value="LOG IN" class="input_login black"
							id="loginBtn">
						<button id="JoinBtn" type="button">JOIN MEMBER</button>
					</div>
					<div align="center">
						<a id="kakao-login-btn"	href="/member/kakaologin_page">
							<i class="fa-solid fa-comment"></i> 카카오톡 로그인<!-- <img src="../../../resources/images/kakao_login_medium_narrow.png"
							width="222" alt="카카오 로그인 버튼" /> -->
						</a>
					</div>
				</div>
			</form>
		</div>
	</div>

	<footer></footer>
</body>

<!-- 카카오 로그인 -->

<script type="text/javascript">
	$(document).ready(function() {
		$("#JoinBtn").on("click", function() {
			self.location = "/member/join";
		});

		$(".input_login").click(function() {
			$("#loginForm").attr("action", "/member/login");
			$("#loginForm").submit();
		});
	});
</script>
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "fdRP3NakqhfzrLjSpibY",
  			// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
			callbackUrl: "http://localhost:8081/member/naverLogin",
  			// 본인의 callBack url로 수정하세요.
			isPopup: true,
			loginButton: {color: "green", type: 3, height: 60}
  			// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
		}
	);
	naverLogin.init();
</script>
</html>

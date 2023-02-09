<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
<br><br>
    <div class="join-table">
    	<form id="joinForm" action="/member/join" method="post" accept-charset="utf-8">
    	<input type="hidden" name="grade" value="C">
<!--     	<input type="hidden" name="profilimg" value="cccccc">
    	<input type="hidden" name="introducer" value="member">
 -->    		<table>
    			<tr>
    				<th>아이디 * </th>
    				<td>
    					<input type="text" name="id" id="id"> &nbsp; (영문소문자/숫자, 5~16자) &nbsp;
    					<input type="button" value="중복확인" id="idCheckBtn" onclick="idCheck()">
    				</td>
    			</tr>
    			<tr>
    				<th>비밀번호 * </th>
    				<td>
    					<input type="password" name="pw" id="pw"> &nbsp; (영문/숫자 조합, 10자~16자)
    				</td>
    			</tr>
    			<tr>
    				<th>비밀번호확인 * </th>
    				<td><input type="password" name="pw_check" id="pw_check"></td>
    			</tr>
    			<tr>
    				<th>이름 * </th>
    				<td><input type="text" name="name" id="name"></td>
    			</tr>
    			<tr>
					<th>성 별 * </th>
					<td>
						<label><input type="radio" name="gender" value="남자" required>남자</label>
						<label><input type="radio" name="gender" value="여자" required>여자</label>
					</td>
				</tr>
				<tr>
					<th>생년월일 * </th>
					<td>
						<input type="date" name="birthday" max="2030-12-31"	min="1950-01-01" required
							oninvalid="this.setCustomValidity('생일을 입력해주세요.')"
							oninput="this.setCustomvalidity('')">
					</td>
				</tr>
    			<tr>
    				<th>이메일 * </th>
    				<td><input type="text" name="email"></td>
    			</tr>
    			<tr>
    				<th>휴대전화 * </th>
    				<td>
    					<input type="text" name="phone1" id="phone1">
    					<input type="text" name="phone2" id="phone2">
    					<input type="text" name="phone3" id="phone3">
    				</td>
    			</tr>
    			<%-- <tr>
    				<th>휴대전화 * </th>
    				<td>
    					<select name="phone_first">
    						<option>선택</option>
    						<c:forTokens var="phone" items="010,011,016,017,018,019" delims=",">
									<option>${phone}</option>
							</c:forTokens>
    					</select> - 
    					<input type="text" name="phone_center" size="3"> - 
						<input type="text" name="phone_last" size="3">    					
    				</td>
    			</tr> --%>
    			<tr>
    				<th>닉네임 * </th>
    				<td>
    					<input type="text" name="nickname">
    					<input type="button" value="중복확인" id="nicknameCheckBtn">
    				</td>
    			</tr>
    			<tr>
    				<th>추천인&nbsp;&nbsp;</th>
    				<td>
    					<input type="text" name="introducer">
    					<input type="button" value="중복확인" id="introCheckBtn">
    				</td>
    			</tr>
    		</table>
    		<br><br>
    		<div>
    			<button type="submit" id="joinBtn">JOIN MEMBER</button>
    			<button type="submit" date-oper="close">CLOSE</button>
    		</div>
    	</form>
    </div>
</body>
<!-- 스크립트 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#joinBtn").click(function(){
			/* $("#joinForm").attr("action", "/member/join");
			$("#joinForm").submit(); */
			
			if($("#id").val() == ""){
			    alert("아이디를 입력해주세요.");
			    $("#id").focus();
			    return false;
			}
			if($("#id").val().length < 5){
			    alert("아이디는 5~16자로 입력해주세요.");
			    $("#id").focus();
			    return false;
			}
			if($("#id").val().length > 16){
			    alert("아이디는 5~16자로 입력해주세요.");
			    $("#id").focus();
			    return false;
			}
			if($("#pw").val() == ""){
			    alert("비밀번호를 입력해주세요.");
			    $("#pw").focus();
			    return false;
			}
			/* if($("#pw").val().length < 10){
			    alert("비밀번호는 10~16자로 입력해주세요.");
			    $("#pw").focus();
			    return false;
			}
			if($("#pw").val().length > 16){
			    alert("비밀번호는 10~16자로 입력해주세요.");
			    $("#pw").focus();
			    return false;
			} */
			if($("#pw").val() != $("#pw_check").val()){
			    alert("비밀번호가 일치하지 않습니다.");
			    $("#pw_check").focus();
			    return false;
			}
			if($("#name").val() == ""){
			    alert("이름을 입력해주세요.");
			    $("#name").focus();
			    return false;
			}
			if($("#email").val() == ""){
			    alert("이메일을 입력해주세요.");
			    $("#email").focus();
			    return false;
			}
			if($("#phone").val() == ""){
			    alert("이메일을 입력해주세요.");
			    $("#phone").focus();
			    return false;
			}
			if($("#nickname").val() == ""){
			    alert("닉네임을 입력해주세요.");
			    $("#phone").focus();
			    return false;
			}
		});
		
	});
</script>
</html>
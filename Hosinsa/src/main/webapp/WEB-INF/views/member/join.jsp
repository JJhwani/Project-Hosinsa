<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
<br><br>
    <div class="join-table">
    	<form role="form" action="/member/join" method="post" accept-charset="utf-8">
    	<input type="hidden" name="grade" value="C">
<!--     	<input type="hidden" name="profilimg" value="cccccc">
    	<input type="hidden" name="introducer" value="member">
 -->    		<table>
    			<tr>
    				<th>아이디 * </th>
    				<td><input type="text" name="id"></td>
    			</tr>
    			<tr>
    				<th>비밀번호 * </th>
    				<td><input type="password" name="pw"></td>
    			</tr>
    			<tr>
    				<th>비밀번호확인 * </th>
    				<td><input type="password" name="pw_check"></td>
    			</tr>
    			<tr>
    				<th>이름 * </th>
    				<td><input type="text" name="name"></td>
    			</tr>
    			<tr>
					<th>성 별 * </th>
					<td>
						<label><input type="radio" name="gender" value="남자">남자</label>
						<label><input type="radio" name="gender" value="여자">여자</label>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="birthday" max="2030-12-31"	min="1950-01-01" required>
					</td>
				</tr>
    			<tr>
    				<th>이메일 * </th>
    				<td><input type="text" name="email"></td>
    			</tr>
    			<tr>
    				<th>휴대전화 * </th>
    				<td><input type="text" name="phone"></td>
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
    				<th>닉네임&nbsp;&nbsp;</th>
    				<td><input type="text" name="nickname"></td>
    			</tr>
    			<tr>
    				<th>추천인&nbsp;&nbsp;</th>
    				<td><input type="text" name="introducer"></td>
    			</tr>
    		</table>
    		<br><br>
    		<button type="submit">JOIN MEMBER</button>
    		<button type="submit" date-oper="close">CLOSE</button>
    	</form>
    </div>
</body>
<!-- 스크립트 -->
<script type="text/javascript">
	/* $(document).ready(function(){
		var formObj = $("form");
		
		$('button').on("click", function(e) {
			e.prevenDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if (operation === 'join') {
				
			}
		})
	} */
</script>
</html>
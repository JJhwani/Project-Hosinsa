<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<!-- <style type="text/css">
	.id_input_re1 { color : green; display : none; }
	.1d_input_re2 { color : red; display : none; }
</style> -->

<div class="contentWrap">
	<form id="joinForm" action="/member/join" method="post"	accept-charset="utf-8">
		<input type="hidden" name="grade" value="C">
		<input type="hidden" name="point" value="">	
		<!--    <input type="hidden" name="profilimg" value="cccccc">
   	<input type="hidden" name="introducer" value="member"> -->
		<table class="table array_center table3">
			<tr>
				<th>아이디 *</th>
				<td>
					<input type="text" name="id" id="id" placeholder="영문소문자/숫자, 5~16자">
					<input type="button" id="idCheckBtn" value="중복체크"> 
				</td>
			</tr>
			<tr>
				<th></th>
				<td><span id="idCheckSpan"></span></td>
			</tr>
			<tr>
				<th>비밀번호 *</th>
				<td><input type="password" name="pw" id="pw" placeholder="영문/숫자 조합, 10자~16자"></td>
			</tr>
			<tr>
				<th>비밀번호확인 *</th>
				<td><input type="password" name="pw_check" id="pw_check"></td>
			</tr>
			<tr>
				<th>이름 *</th>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<th>성 별 *</th>
				<td>
					<label><input type="radio" name="gender" value="남자" required="required"> 남자</label>
				    <label><input type="radio" name="gender" value="여자" required="required"> 여자</label>
				</td>
			</tr>
			<tr>
				<th>생년월일 *</th>
				<td><input type="date" name="birthday" max="2030-12-31"	min="1950-01-01" 
						value="<fmt:formatDate pattern='yyyy-MM-dd' value=''/>" required="required"></td>
			</tr>
			<tr>
				<th>이메일 *</th>
				<td><input type="text" name="email" id="email"></td>
			</tr>
			<tr>
				<th>휴대전화 *</th>
				<td><input type="text" name="phone" id="phone"></td>
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
				<th>닉네임 *</th>
				<td>
					<input type="text" name="nickname" id="nickname" placeholder="한글/영문소문자 2~14자">
					<input type="button" id="nickCheckBtn" value="중복체크"> 
				</td>
			</tr>
			<tr>
				<th></th>
				<td><span id="nickCheckSpan"></span></td>
			</tr>
			<tr>
				<th>추천인</th>
				<td>
					<input type="text" name="introducer" id="introducer">
					<input type="button" id="introCheckBtn" value="추천인 확인">
				</td>
			</tr>
			<tr>
				<th></th>
				<td><span id="introCheckSpan"></span></td>
			</tr>
		</table>
		<div class="array_center align_center">
			<button type="submit" id="joinBtn" class="black">JOIN MEMBER</button>
			<button type="button" id="closeBtn">CLOSE</button>
		</div>
	</form>
</div>
<!-- 스크립트 -->
<script src="../../../../resources/js/memberJoin.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#closeBtn").on("click", function() {
		self.location = "/";
	});
	
});
</script>
<%@ include file="../includes/footer.jsp"%>
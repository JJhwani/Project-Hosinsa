<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/HosinsaLogin.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
	<header>
        <h1 style="text-align: center;">Hosinsa</h1>
    </header>
    
    <div class="join-table">
    	<form action="" method="post">
    		<table>
    			<tr>
    				<th>아이디 * </th>
    				<td><input type="text"></td>
    			</tr>
    			<tr>
    				<th>비밀번호 * </th>
    				<td><input type="password"></td>
    			</tr>
    			<tr>
    				<th>비밀번호확인 * </th>
    				<td><input type="password"></td>
    			</tr>
    			<tr>
    				<th>이름 * </th>
    				<td><input type="text"></td>
    			</tr>
    			<tr>
    				<th>휴대전화 * </th>
    				<td>
    					<select>
    						<option>선택</option>
    						<c:forTokens var="phone" items="010,011,016,017,018,019" delims=",">
									<option>${phone}</option>
							</c:forTokens>
    					</select> - 
    					<input type="text" class="join-input"> - 
						<input type="text" class="join-input">    					
    				</td>
    			</tr>
    			<tr>
    				<th>이메일 * </th>
    				<td><input type="text"></td>
    			</tr>
    			<tr>
    				<th>닉네임&nbsp;&nbsp;</th>
    				<td><input type="text"></td>
    			</tr>
    			<tr>
    				<th>추천인&nbsp;&nbsp;</th>
    				<td><input type="text"></td>
    			</tr>
    		</table>
    		<br><br>
    		<div class="joinBtn2">
    			<input type="submit" value="JOIN MEMBER">
    			<input type="button" value="CLOSE">
    		</div>	
    	</form>
    </div>
</body>
</html>
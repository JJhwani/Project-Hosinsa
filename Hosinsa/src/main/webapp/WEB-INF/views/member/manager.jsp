<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>Manager Page</h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="member">
				<tr>
					<td>
						<a href="<c:url value='/member/get?id=${member.id}'/>">
							<c:out value="${member.id}" />
						</a>
					</td>
					<td><c:out value="${member.name}" /></td>
					<td><c:out value="${member.nickname}" /></td>
					<c:choose>
						<c:when test="${member.grade eq 'C' }">
							<td>LV.1 브론즈</td>
						</c:when>
						<c:when test="${member.grade eq 'B' }">
							<td>LV.2 실버</td>
						</c:when>
						<c:when test="${member.grade eq 'A' }">
							<td>LV.3 골드</td>
						</c:when>
						<c:otherwise>
							<td>LV.4 운영자</td>
			 			</c:otherwise>
					</c:choose>
					<td><c:out value="${member.point}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
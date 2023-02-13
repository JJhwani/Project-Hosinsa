<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOSINSA</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../../resources/css/hosinsa.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>
<body>
<div class="headerWrap">
	<div class="header">
		<h1 class="logo"><a href="<c:url value='/'/>">HOSINSA</a></h1>
		<form class="search" action="/search/sorting" method="get">
			<input type="hidden" name="sort" value="best">
			<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
		</form>
		<ul class="menu">
			<c:if test="${empty member}">
				<li><a>회원가입</a></li>
			</c:if>
			<li class="user_grade">
				<c:choose>
					<c:when test="${empty member}">
						<a href="<c:url value='/member/login'/>">로그인</a>
					</c:when>
					<c:otherwise>
						<c:choose>
			 				<c:when test="${member.grade eq 'C'}">
			 					LV.1 브론즈 &nbsp;${member.name}님
			 				</c:when>
			 				<c:when test="${member.grade eq 'B'}">
			 					LV.2 실버 &nbsp;${member.name}님
			 				</c:when>
			 				<c:when test="${member.grade eq 'A'}">
			 					LV.3 골드 &nbsp;${member.name}님
			 				</c:when>
			 				<c:otherwise>
			 					LV.4 운영자 &nbsp;${member.name}님
			 				</c:otherwise>
	 					</c:choose>
	 				</c:otherwise>
				</c:choose>
			</li>
			<c:if test="${not empty member}">
				<li><a>마이페이지</a></li>
			</c:if>
			<li><a><i class="fa-solid fa-basket-shopping"></i> 장바구니</a></li>
			<c:if test="${member.grade eq 'S'}">
				<li><a href="/admin/product">상품관리</a></li>
				<li><a href="/admin/member">회원관리</a></li>
			</c:if>
			<c:if test="${not empty member}">
				<li><a>로그아웃</a></li>
			</c:if>
		</ul>
	</div>
</div>
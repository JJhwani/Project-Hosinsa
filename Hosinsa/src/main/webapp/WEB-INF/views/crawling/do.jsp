<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크롤링</title>
</head>
<body>
	<h1>크롤링</h1>
	<div class="panel-body">
		<table width="100%" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>CATEGORY</th>
					<th>PRONAME</th>
					<th>PROIMG</th>
					<th>BRAND</th>
					<th>PRONUM</th>
					<th>PRICE</th>
					<th>STOCK</th>
					<th>PROVIEW</th>
					<!-- <th>DETAIL</th> -->
					<th>REGDATE</th>
					<th>UPDATE_DATE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.category}</td>
						<td>${item.proname}</td>
						<td>${item.proimg}</td>
						<td>${item.brand}</td>
						<td>${item.pronum}</td>
						<td>${item.price}</td>
						<td>${item.stock}</td>
						<td>${item.proview}</td>
						<!-- <td>${item.detail}</td> -->
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.regdate}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.update_date}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
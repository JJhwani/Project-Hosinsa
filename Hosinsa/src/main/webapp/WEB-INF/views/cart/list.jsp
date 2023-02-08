<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row">
	<div class="col-lg-12">
		<h2 class="page-header">장바구니</h2>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<table width="80%">
					<thead>
						<tr>
							<th>주문 번호</th>
							<th>제품 번호</th>
							<th>제품 이름</th>
							<th>아이디</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
                                
                         <c:forEach items="${list}" var="cart">
                          <tr class="odd gradeX">
                              <td>${cart.cartnum}</td>
                              <td>${cart.pronum}</td>
                              <td>${cart.proname}</td>
                              <td>${cart.id}</td>
                              <td>${cart.price}</td>
                          </tr>
                         </c:forEach>
                         
                                </tbody>
				</table>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>

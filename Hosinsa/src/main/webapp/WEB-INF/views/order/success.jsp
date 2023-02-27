<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>


<script type="text/javascript">
	//alert("주문이 완료되었습니다. 이용해주셔서 감사합니다.");
	opener.document.getElementById("input").value="success";
	opener.document.getElementById("orderForm").submit();
	self.close();
</script>
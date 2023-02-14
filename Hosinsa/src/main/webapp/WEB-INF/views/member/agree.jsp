<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Agree Page</h1>
	<div class="checkbox_group">
		<div class="checkbox">
  			<input type="checkbox" id="check_all" >
  			<label for="check_all">개인정보 처리방침, 서비스 이용약관, 위치정보 이용약관,<br> 
  								   이벤트 등 프로모션 알림 메일 수신에 모두 동의합니다.</label>
  		</div>
  		<br>
  		<div class="checkbox">
  			<input type="checkbox" id="check_1" class="normal" >
  			<label for="check_1">개인정보 처리방침 동의 &nbsp;<span style="color: red;">(필수)</span></label>
  			<div>
  				<textarea rows="5" cols="40">여러분을 환영합니다. HOSINSA 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 HOSINSA 서비스의 이용과 관련하여 HOSINSA 서비스를 제공하는 HOSINSA 주식회사(이하 ‘HOSINSA’)와 이를 이용하는 HOSINSA 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 HOSINSA 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>
  			</div>
  		</div>
  		
  		<div class="checkbox">
  			<input type="checkbox" id="check_2" class="normal" >
  			<label for="check_2">서비스 이용약관 동의 &nbsp;<span style="color: red;">(필수)</span></label>
  			<div>
  				<textarea rows="5" cols="40">
  				
  				</textarea>
  			</div>
  		</div>
  		
  		<div class="checkbox">
  			<input type="checkbox" id="check_3" class="normal" >
  			<label for="check_3">위치정보 이용약관 동의 &nbsp;<span>(선택)</span></label>
  		</div>
  		
  		<div class="checkbox">
  			<input type="checkbox" id="check_4" class="normal" >
  			<label for="check_4">이벤트 등 프로모션 알림 메일 수신 &nbsp;<span>(선택)</span></label>
  		</div>
  		
  		<div class="checkBtn">
  			<input type="button" value="취소">
  			<input type="button" value="동의">
  		</div>
  		
	</div>
</body>

<script type="text/javascript">
//체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
});

//체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;
    
    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });
    
    $("#check_all").prop("checked", is_checked);
});

</script>
</html>
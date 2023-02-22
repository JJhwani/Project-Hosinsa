$(document).ready(function(){      
	
	var paging = $(".paging.board");
	var order_form = $(".order_form");
	var address_shipping = $(".address_shipping")


	//페이징처리
	$(".board_paginate_button a").on("click", function(e) {
		e.preventDefault();
		paging.find("input[name='b_pageNum']").val($(this).attr("href"));
		paging.submit();
	});

	
	
	// 오더 페이지에서 배송지 클릭시 클릭시
	function check(){
		var address_no = $(this).siblings("input[name='address_no']").val();
		var recipient = $(this).siblings("input[name='recipient']").val();
		var shipping = $(this).siblings("input[name='shipping']").val();
		var phone = $(this).siblings("input[name='phone']").val();
		var tel = $(this).siblings("input[name='tel']").val();
		var zipcode = $(this).siblings("input[name='zipcode']").val();
		var address = $(this).siblings("input[name='address']").val();
		var basic = $(this).siblings("input[name='basic']").val();
		
//		$(".address_info1 li").find("input[name='address_no']").val(address_no);
//		$(".address_info1 li").find("input[name='recipient']").val(recipient);
//		$(".address_info1 li").find("input[name='shipping']").val(shipping);
//		$(".address_info1 li").find("input[name='phone']").val(phone);
//		$(".address_info1 li").find("input[name='tel']").val(tel);
//		$(".address_info2 li").find("input[name='zipcode']").val(zipcode);
//		$(".address_info2 li").find("input[name='address']").val(address);
//		$(".address_info2 li").find("input[name='basic']").val(basic);
		
		$(".address_info1 li").find(".recipient").text(recipient);
		$(".address_info1 li").find(".phone").text(phone);
		$(".address_info1 li").find(".tel").text(tel);
		$(".address_info2 li").find(".address").text("("+zipcode+")"+address);

	}
	$(".address_shipping .check").on("change", check);


	// 오더 페이지에서 배송지 등록 버튼 클릭시
	$(".address_shipping .address_register").on("click", function(e) {
		e.preventDefault();
		order_form.attr("action", "/order/address/registerForm");
		order_form.attr("method", "get");
		order_form.submit();
	});

	// 오더 페이지에서 배송지 변경 버튼 클릭시
	$(".address_shipping .address_modify").on("click", function(e) {
		e.preventDefault();
		order_form.attr("action", "/order/address/modify");
		order_form.attr("method", "get");
		order_form.submit();
	});
	
	function addressPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("order/addressAPI.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
	 }
	 
	 function addressCallBack(roadFullAddr,zipNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.address_registerForm.zipcode.value = zipNo;
		document.address_registerForm.address.value = roadFullAddr;
	 }


});

$(document).ready(function(){      
	
	var paging = $(".paging.board");
	var order_form = $(".order_form");
	var address_shipping = $(".address_shipping");
	var popupForm = $(".popupForm");
	var address_Form = $(".address_Form");
	var address_registerForm = $(".address_registerForm");
	var address_searchForm = $(".address_searchForm");

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
	$(".address_shipping label").on("click", check);


	// 오더 페이지에서 배송지 등록 버튼 클릭시
	$(".address_shipping .address_register").on("click", function(e) {
		e.preventDefault();
		registerPopup();

	});

	// 오더 페이지에서 배송지 변경 버튼 클릭시
	$(".address_shipping .address_modify").on("click", function(e) {
		e.preventDefault();
		listPopup();
	});
	

	// 배송지 목록 팝업
	function listPopup(){
		var popOption = "width=500px, height=950px";
		var userid = $(".shippingInfo .popupForm").find("input[id=userid]").val();
		window.open("/order/address/listForm?id="+userid,"list", popOption);

		popupForm.action="/order/address/listForm?id="+userid;
		popupForm.target="pop";
		popupForm.submit();
	}

	// 신규 배송지 등록 팝업
	function registerPopup(){
		var popOption = "width=600px, height=650px";
		var userid = $(".shippingInfo .popupForm").find("input[id=userid]").val();
		window.open("/order/address/registerForm","register", popOption);
		
		popupForm.action="/order/address/registerForm?id="+userid;
		popupForm.target="pop";
		popupForm.submit();
	}




	// 배송지 목록 페이지에서 신규 배송지 등록 버튼 클릭시
	$(".addressWrap .btn.addRegister").on("click", function(e) {
		e.preventDefault();
		var popOption = "width=600px, height=650px";
		var userid =address_Form.find("input[id=userid]").val();
		window.open("/order/address/registerForm","register", popOption);
		
		address_Form.find(".address_no").remove();
		address_Form.find(".id").remove();
		address_Form.find(".basic").remove();
		address_Form.action="/order/address/registerForm?id="+userid;
		address_Form.target="pop";		
		address_Form.submit();
	});


	// 배송지 등록 페이지에서 등록 버튼 클릭시
	$(".address_registerForm .btn.register").on("click", function(e) {
		e.preventDefault();
		var tel = address_registerForm.find("input[name='phone']").val();
		var address = address_registerForm.find("input[name='address1']").val()+
					" "+address_registerForm.find("input[name='address2']").val();
		var userid = address_registerForm.find("input[name='userid']").val();
		console.log(userid);
		address_registerForm.find("input[name='id']").val(userid);
		address_registerForm.find("input[name='address']").val(address);

		if($("input[name='basicCheck']:checkbox").is(":checked")){
			address_registerForm.find("input[name='basic']").val("O");
		}
		else {
			address_registerForm.find("input[name='basic']").val("X");
		}

		if($("input[name='telCheck']:checkbox").is(":checked")){
			address_registerForm.find("input[name='teltel']").attr("name", "tel");
			address_registerForm.find("input[name='tel']").val(tel);
		}

		address_registerForm.submit();
		self.close();
	});

});

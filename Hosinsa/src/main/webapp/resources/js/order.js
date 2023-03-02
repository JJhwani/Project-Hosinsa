$(document).ready(function(){      
	
	var paging = $(".paging.board");
	var order_form = $(".order_form");
	var address_shipping = $(".address_shipping");
	var popupForm = $(".popupForm");
	var address_Form = $(".address_Form");
	var address_registerForm = $(".address_registerForm");
	var address_modifyForm = $(".address_modifyForm");

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
		window.open("/order/address/registerForm?id="+userid,"register", popOption);
		
		popupForm.action="/order/address/registerForm?id="+userid;
		popupForm.target="register";
		popupForm.submit();
	}

	// 배송지 목록 페이지에서 신규 배송지 등록 버튼 클릭시
	$(".addressWrap .btn.addRegister").on("click", function(e) {
		e.preventDefault();
		var popOption = "width=600px, height=650px";
		var userid =address_Form.find("input[id=userid]").val();
		window.open("/order/address/registerForm?id="+userid,"register", popOption);
		
		address_Form.find(".address_no").remove();
		address_Form.find(".id").remove();
		address_Form.find(".basic").remove();
		address_Form.action="/order/address/registerForm?id="+userid;
		address_Form.target="pop";
		address_Form.submit();
	});

	// 배송지 목록 페이지에서 수정 버튼 클릭시
	$(".address_Form .btn.addModify").on("click", function(e) {
		e.preventDefault();
		var popOption = "width=600px, height=650px";
		var userid =address_Form.find("input[id=userid]").val();
		var address_no = $(this).siblings("input[name=address_no]").val();
		window.open("/order/address/modifyForm?id="+userid+"&address_no="+address_no,"modify", popOption);

		address_Form.find(".address_no").remove();
		address_Form.find(".id").remove();
		address_Form.find(".basic").remove();
		address_Form.action = "/order/address/modifyForm?id="+userid+"&address_no="+address_no;
		address_Form.target="pop";
		address_Form.submit();
	});

	// 배송지 수정 페이지에서 취소 버튼 클릭시
	$(".address_modifyForm .btn.cancle").on("click", function(e) {
		e.preventDefault();
		self.close();

	});

	// 배송지 수정 페이지에서 수정완료 버튼 클릭시
	$(".address_modifyForm .btn.modify").on("click", function(e) {
		e.preventDefault();

		var tel = address_modifyForm.find("input[name='phone']").val();
		var userid = address_modifyForm.find("input[name='userid']").val();
		
		address_registerForm.find("input[name='id']").val(userid);
		
		if($("input[name='telCheck']:checkbox").is(":checked")){
			address_modifyForm.find("input[name='teltel']").attr("name", "tel");
			address_modifyForm.find("input[name='tel']").val(tel);
		}

		if($("input[name='basicCheck']:checkbox").is(":checked")){
			address_modifyForm.find("input[name='basic']").val("O");
		}
		else {
			address_modifyForm.find("input[name='basic']").val("X");
		}
		
		var recipient = address_modifyForm.find("input[name='recipient']").val();
		var shipping = address_modifyForm.find("input[name='shipping']").val();
		var phone = address_modifyForm.find("input[name='phone']").val();
		var teltel = address_modifyForm.find("input[name='tel']").val();
		var zipcode = address_modifyForm.find("input[name='zipcode']").val();
		var address1 = address_modifyForm.find("input[name='address1']").val();
		var address2 = address_modifyForm.find("input[name='address2']").val();
		var basic = address_modifyForm.find("input[name='basic']").val();

		if($("input[name='basicCheck']:checkbox").is(":checked")){
			$.ajax({
				url : "/order/address/modifyBasic",
				data : {"id":userid,"recipient":recipient,"shipping":shipping,
						"phone":phone,"tel":teltel,"zipcode":zipcode,"address1":address1,
						"address2":address2,"basic":basic},
				success : function(data){
					alert("주소 수정이 성공적으로 처리되었습니다.");					
				}
			});
			opener.location.reload();
			window.open("","_self","").close();
		}
		else {
			$.ajax({
				url : "/order/address/modify",
				data : {"id":userid,"recipient":recipient,"shipping":shipping,
						"phone":phone,"tel":teltel,"zipcode":zipcode,"address1":address1,
						"address2":address2,"basic":basic},
				success : function(data){
					alert("주소 수정이 성공적으로 처리되었습니다.");
				}
			});
			opener.location.reload();
			window.open("","_self","").close();
		}

	});

	// 배송지 목록 페이지에서 삭제 버튼 클릭시
	$(".address_Form .btn.addRemove").on("click", function(e) {
		e.preventDefault();
		var address_no = $(".address_Form").find("input[class=address_no]").val();

		address_Form.find(".id").remove();
		address_Form.find(".basic").remove();
		address_Form.attr("action","/order/address/remove?address_no="+address_no);
		address_Form.submit();
	});


	// 배송지 등록 페이지에서 돌아가기 버튼 클릭시
	$(".address_registerForm .btn.back").on("click", function(e) {
		e.preventDefault();
		address_registerForm.attr("action", "/order/address/list");
		address_registerForm.submit();
		//self.close();		
	});

	// 배송지 등록 페이지에서 등록 버튼 클릭시
	$(".address_registerForm .btn.register").on("click", function(e) {
		e.preventDefault();
		var tel = address_registerForm.find("input[name='phone']").val();
		var userid = address_registerForm.find("input[name='userid']").val();
		
		address_registerForm.find("input[name='id']").val(userid);
		
		if($("input[name='telCheck']:checkbox").is(":checked")){
			address_registerForm.find("input[name='teltel']").attr("name", "tel");
			address_registerForm.find("input[name='tel']").val(tel);
		}

		if($("input[name='basicCheck']:checkbox").is(":checked")){
			address_registerForm.find("input[name='basic']").val("O");
		}
		else {
			address_registerForm.find("input[name='basic']").val("X");
		}
		
		if($("input[name='basicCheck']:checkbox").is(":checked")){
			//document.address_registerFormBasic.target = "frame";
			address_registerFormBasic.submit();
			//window.parent.location.reload();
			//window.open("","_self","").close();
			

		if($("input[name='basicCheck']:checkbox").is(":checked")){
			$.ajax({
				url : "/order/address/registerWithBasic",
				data : {"id":userid,"recipient":recipient,"shipping":shipping,
						"phone":phone,"tel":teltel,"zipcode":zipcode,"address1":address1,
						"address2":address2,"basic":basic},
				success : function(data){
					alert("주소 등록이 성공적으로 처리되었습니다.");					
				}
			});
			opener.location.reload();
			window.open("","_self","").close();
		}
		else {
			address_registerForm.submit();
			//document.address_registerForm.target = "frame";
			//window.parent.location.reload();
			//window.open("","_self","").close();
			

		}

		
		
	});

});

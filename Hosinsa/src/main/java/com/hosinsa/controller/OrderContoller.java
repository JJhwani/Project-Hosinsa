package com.hosinsa.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.OrderVO;
import com.hosinsa.domain.BoardCriteria;
import com.hosinsa.domain.BoardPageDTO;
import com.hosinsa.domain.MemberAddressVO;
import com.hosinsa.service.MemberAddressService;
import com.hosinsa.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@SessionAttributes("member")
@AllArgsConstructor
public class OrderContoller {

	@Autowired
	private OrderService service;

	@Autowired
	MemberAddressService addService;

	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/order_form")
	public String order(HttpSession session, @RequestParam("valueArr") List<Integer> valueArr,
			MemberAddressVO address, Long address_no, Model model, @ModelAttribute("member") MemberVO member, String id, BoardCriteria cri) {
		log.info("order________________");
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+address_no);
		log.info("--------------------------------"+valueArr);
		
		model.addAttribute("order",service.getOrder(valueArr));
		model.addAttribute("valueArr", valueArr);
		
		if(address_no == null) {
			int total = addService.getTotalCountAddress(address);
			model.addAttribute("total", total);
			model.addAttribute("address", addService.getListBasic(address));
			model.addAttribute("shipping", addService.getListOrder(address));
		}
		else {
			int total = addService.getTotalCountAddress(address);
			model.addAttribute("total", total);
			model.addAttribute("address", addService.getListBasic(address));
			model.addAttribute("shipping", addService.getListOrder(address));
			model.addAttribute("choice", addService.read(address));
		}
		

		return "/order/order_form";
	}
	
	
	@GetMapping("/success")
	public void success() {
				
	}
	
	// 주문 취소시 화면 전환
	@GetMapping("/cancel")
	public void cancelPage() {
		
	}

	// 주문 실패시 화면 전환
	@GetMapping("/fail")
	public void failPage() {
		
	}

	// 주문 처리
	@PostMapping("/complete")
	public void complete(@RequestParam("cartnum") List<Integer> cartnum, OrderVO vo, Model model) {
		
		model.addAttribute("order", service.getOrder(cartnum));
		
		vo.setOrdernum((System.currentTimeMillis()));
		service.getOrderIn(vo, cartnum);
		
		
		for (Integer i : cartnum) {
			log.info(i + "포문 돌아가는 중");
			service.getProduct_del(i);
		}
		service.getOrder_del(cartnum);
		
	}
	
	@GetMapping("/complete")
	public void complete() {
		
	}
	
	// 카카오페이 결제
	@RequestMapping("/kakaopay")
	@ResponseBody
	public String kakaopay(Integer total) {
		log.info("kakaopay________________");
		
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection link = (HttpURLConnection) address.openConnection();

			link.setRequestMethod("POST");
			link.setRequestProperty("Authorization", "KakaoAK 444e366896f7551ad428cb42a1ec6511");
			link.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			link.setDoOutput(true);

			String parm = "cid=TC0ONETIME&partner_order_id=partner_order_id"
					+ "&partner_user_id=partner_user_id&item_name=호신사"
					+ "&quantity=1&total_amount="+total+"&vat_amount=200&tax_free_amount=0"
					+ "&approval_url=http://localhost:8081/order/success"
					+ "&fail_url=http://localhost:8081/order/fail"
					+ "&cancel_url=http://localhost:8081/order/cancel";
			
			OutputStream os = link.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
			dos.writeBytes(parm);
			dos.close();

			int result = link.getResponseCode();

			InputStream is;
			if (result == 200) {
				is = link.getInputStream();
			} else {
				is = link.getErrorStream();
			}
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			return br.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST }, value = "/address/listForm")
	//@GetMapping("/address/listForm")
	public String addressListForm(HttpSession session, MemberAddressVO address, String id,@RequestParam("valueArr") List<Integer> valueArr, Model model) {
		log.info("====================================="+valueArr);
		model.addAttribute("order",service.getOrder(valueArr));
		model.addAttribute("valueArr", valueArr);
		model.addAttribute("id",id);
		int total = addService.getTotalCountAddress(address);
		model.addAttribute("addList", addService.getListWithPaging(address));
		model.addAttribute("pageMaker_b", new BoardPageDTO(address, total));
		return "/order/address";
	}

	//@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/address/list")
	@GetMapping("/address/list")
	public String addressList(HttpSession session, MemberAddressVO address,  String id,@RequestParam("valueArr") List<Integer> valueArr, Model model) {
		model.addAttribute("order",service.getOrder(valueArr));
		model.addAttribute("valueArr", valueArr);
		model.addAttribute("id",id);
		int total = addService.getTotalCountAddress(address);
		model.addAttribute("addList", addService.getListWithPaging(address));
		model.addAttribute("pageMaker_b", new BoardPageDTO(address, total));
		
		return "/order/address";
	}
	
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/address/registerForm")
	public String addressRegisterForm(HttpSession session, MemberAddressVO address, String id, Model model) {
		model.addAttribute("id",id);
		return "/order/addressRegister";
	}
	
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/address/registerWithBasic")
	public String addressregisterWithBasic(HttpSession session, MemberAddressVO address, String id, Model model) {
		addService.modifyBasic(address);
		model.addAttribute("id",id);
		if(addService.registerSelectKey(address)) {
			model.addAttribute("register","success");
		}
		
		int total = addService.getTotalCountAddress(address);
		model.addAttribute("addList", addService.getListWithPaging(address));
		model.addAttribute("pageMaker_b", new BoardPageDTO(address, total));
		
		return	"/order/address";
	}
	
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/address/register")
	public String addressRegister(HttpSession session, MemberAddressVO address, String id, Model model) {
		model.addAttribute("id",id);
		if(addService.registerSelectKey(address)) {
			model.addAttribute("register","success");
		}
		
		int total = addService.getTotalCountAddress(address);
		model.addAttribute("addList", addService.getListWithPaging(address));
		model.addAttribute("pageMaker_b", new BoardPageDTO(address, total));
		
		return	"/order/address";
	}


	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/address/modifyForm")
	public String addressModifyForm(HttpSession session, MemberAddressVO address, String id, Long address_no, Model model) {
		model.addAttribute("id",id);
		model.addAttribute("address_no",address_no);
		model.addAttribute("address",addService.read(address));
		
		return "/order/addressModify";
	}
	
	// 기본배송지 수정
	@PostMapping("/address/modifyBasic")
	public String addressModifyBasic(HttpSession session, MemberAddressVO address, String id, Long address_no, Model model) {
		model.addAttribute("id",id);
		addService.modifyBasic(address);
		if(addService.modify(address)) {
			model.addAttribute("modify","success");
		}
		
		int total = addService.getTotalCountAddress(address);
		model.addAttribute("addList", addService.getListWithPaging(address));
		model.addAttribute("pageMaker_b", new BoardPageDTO(address, total));
		
		return "/order/address";
	}
	
	// 기본배송지 수정X
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/address/modify")
	public String addressModify(HttpSession session, MemberAddressVO address, String id, Long address_no, Model model) {
		model.addAttribute("id",id);
		if(addService.modify(address)) {
			model.addAttribute("modify","success");
		}
		
		int total = addService.getTotalCountAddress(address);
		model.addAttribute("addList", addService.getListWithPaging(address));
		model.addAttribute("pageMaker_b", new BoardPageDTO(address, total));
		
		return "/order/address";
	}
	
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/address/remove")
	public String addressRemove(HttpSession session, MemberAddressVO address, Long address_no, String id, Model model) {
		model.addAttribute("id",id);
		if(addService.remove(address_no)) {
			model.addAttribute("remove", "success");
		}
		
		int total = addService.getTotalCountAddress(address);
		model.addAttribute("addList", addService.getListWithPaging(address));
		model.addAttribute("pageMaker_b", new BoardPageDTO(address, total));
		
		return "/order/address";
	}
	
	@ResponseBody
	@RequestMapping("/address/getList")
	public List<MemberAddressVO> refreshAddressList(Model model,MemberAddressVO address){
		return addService.getListOrder(address);
	}
}

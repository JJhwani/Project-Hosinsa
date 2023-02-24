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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hosinsa.domain.MemberVO;
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
	
	@PostMapping("/order_form")
	public String order(HttpSession session, @RequestParam("valueArr") List<Integer> valueArr,
		Model model, @ModelAttribute("member") MemberVO member) {
		log.info("order________________"); 
		log.info(valueArr); 
		
		model.addAttribute("order",service.getOrder(valueArr));
		
		return "/order/order_form";
	}
	
	@GetMapping("/order_form")
	public void orderPage(Model model) {
		
	}
	
	@PostMapping("/complete")
	public String complete() {
		log.info("complete________________");
//		39log.info(valueArr); 
		
//		model.addAttribute("complete",service.getOrder(valueArr));
		
		return "/order/complete";
	}
	
	@GetMapping("/complete")
	public void completePage(Model model) {
		
	}
	
	// 주문 취소시 화면 전환
	@GetMapping("/cancel")
	public void cancelPage() {
		
	}

	// 주문 실패시 화면 전환
	@GetMapping("/fail")
	public void failPage() {
		
	}
	
	
	// 카카오페이 결제
	@RequestMapping("/kakaopay")
	@ResponseBody
	public String kakaopay(Integer total) {
		log.info("kakaopay________________");
		log.info(total);
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
					+ "&approval_url=http://localhost:8081/order/complete"
					+ "&fail_url=http://localhost:8081/order/fail"
					+ "&cancel_url=http://localhost:8081/order/cancel";
			
			OutputStream os = link.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
			dos.writeBytes(parm);
			dos.close();
			
			int result = link.getResponseCode();
			
			InputStream is;
			if(result == 200) {
				is = link.getInputStream();
			}else {
				is = link.getErrorStream();
			}
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			return br.readLine();
		}catch (MalformedURLException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	
	
}
package com.hosinsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.service.CartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*")
@SessionAttributes("member")
@AllArgsConstructor
public class CartContoller {

	@Autowired
	private CartService service;

	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)
	public void favicon(HttpServletRequest request, HttpServletResponse reponse) {
		try {
			reponse.sendRedirect("/resources/favicon.ico");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("member") MemberVO vo) {
		
		String id = vo.getId();
		log.info("list.............2");
		model.addAttribute("list", service.getList(id));

	}

	@PostMapping(value = "/deleteCart")
	public String deleteCart(HttpSession session,
			@RequestParam(value = "valueArr[]", required = false) List<String> chArr) {
		log.info("delete Cart =============");

		long cartNum = 0;
		log.info(chArr);


		for(String i : chArr) { 
			log.info("포문까지 들어옴");
			cartNum = Integer.parseInt(i);
			service.deleteCart(cartNum); 
		} 
		log.info("포문 빠져나감");

		return "redirect:/cart/list";
	}

	@GetMapping("/order")
	public void order(Model model, @ModelAttribute("member") MemberVO vo) {
		
		String id = vo.getId();
		log.info("list.............2");
		model.addAttribute("list", service.getList(id));

	}
}
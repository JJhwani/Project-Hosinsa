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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.CartVO;
import com.hosinsa.domain.MemberAddressVO;
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


	
	@ResponseBody
	@PostMapping(value = "/deleteCart")
	public void deleteCart(HttpSession session,
			@RequestParam(value = "valueArr[]") List<String> chArr ,RedirectAttributes rttr) {
		log.info("delete Cart =============");

		long cartNum = 0;
		log.info(chArr);

		for (String i : chArr) {
			cartNum = Integer.parseInt(i);
			service.deleteCart(cartNum);
		}
	}

	@ResponseBody
	@GetMapping("/order") 
	public String order(String cartnum, HttpSession session,
	Model model, @ModelAttribute("member") MemberVO member) {
		
	log.info("order~~~~~~~~~~~~~~"); 
	log.info(cartnum);
	
	return "cart/order";
	}
	
	@PostMapping("/cartIn")
	public String cartIn(CartVO vo,RedirectAttributes rttr) {
		service.cartIn(vo);
		rttr.addFlashAttribute("cartIn","success");	
		rttr.addAttribute("pronum",vo.getPronum());
		return "redirect:/product/{pronum}";
	}
	
	@ResponseBody
	@PostMapping("/checkCart")
	public int checkCart(CartVO vo,Model model) {
		
	}
}
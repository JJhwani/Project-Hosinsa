package com.hosinsa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService memberService;
	
	// 로그인
	@GetMapping("/login")
	public void login() {
		log.info("login/get====");
	}
	
	@PostMapping("/login")
	public String logPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {
		log.info("loginPOST===");
		log.info("loginPOST : " + member);
		
		HttpSession session = request.getSession();
		MemberVO vo = memberService.memberLogin(member); 
		
		if (vo == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		} else {
			session.setAttribute("member", vo);
			return "redirect:/";
		}
		
	} // 로그인
	
	// 로그아웃
	@GetMapping("/logout")
	public String logoutGet(HttpServletRequest request) {
		log.info("logout====");
		HttpSession session = request.getSession();
		session.invalidate();
        
        return "redirect:/";     
	}
	
	@GetMapping("/manager")
	public void list(Model model) {
		log.info("list----");
		model.addAttribute("list", memberService.getList());
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("id") String id, Model model) {
		log.info("/member/get");
		model.addAttribute("member", memberService.get(id));
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		log.info("modify : " + member);
		
		if (memberService.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		} 
		return "redirect:/member/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {
		log.info("remove----" + id);
		
		if (memberService.remove(id)) {
			rttr.addFlashAttribute("result", "seccess");
		}
		return "redirect:/member/list";
	}
	
	@GetMapping("/join")
	public void join() {
		log.info("join====");
	}
	
	@PostMapping("/join")
	public String joinPOST(MemberVO member, RedirectAttributes rttr) {
		log.info("joinPOST====" + member);
		memberService.join(member);
		rttr.addFlashAttribute("result", member.getId());
		return "redirect:/";
	}
}

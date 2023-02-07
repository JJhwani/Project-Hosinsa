package com.hosinsa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/hosinsa/*")
@AllArgsConstructor
public class MemberController {

	private MemberService memberService;
	
	@GetMapping("/member/list")
	public void list(Model model) {
		log.info("list----");
		model.addAttribute("list", memberService.getList());
	}
	
	@GetMapping("/member/get")
	public void get(@RequestParam("id") String id, Model model) {
		log.info("/member/get");
		model.addAttribute("member", memberService.get(id));
	}
	
	@PostMapping("/member/modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		log.info("modify : " + member);
		
		if (memberService.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		} 
		return "redirect:/hosinsa/member/list";
	}
}

package com.hosinsa.controller;

import java.util.ArrayList;
import java.util.List;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@SessionAttributes("member")
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService memberService;

	@GetMapping("/agree")
	public void agreeGET() {
		log.info("Agree====>");
	}

	// 로그인
	@GetMapping("/login")
	public void login() {
		log.info("login/get====");
	}

	@PostMapping("/login")
	public String logPOST(MemberVO member, RedirectAttributes rttr, Model model) throws Exception {
		log.info("loginPOST===");
		log.info("loginPOST : " + member);

		MemberVO vo = memberService.memberLogin(member);

		if (vo == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		} else {
			model.addAttribute("member", vo);
			return "redirect:/";
		} 
		
		
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logoutGet(SessionStatus session) {
		log.info("logout====");
		session.setComplete();

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

	@GetMapping("/modify")
	public void modifyGET(@ModelAttribute("member") MemberVO vo, Model model) {
		log.info("modofyGET====");
		model.addAttribute("member", vo);
	}

	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr, Model model) {
		log.info("modify : " + member);
		model.addAttribute("member", member);
		
		if (memberService.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/myPage";
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
	}

	@PostMapping("/join")
	public String join(MemberVO member, RedirectAttributes rttr) {
		log.info("join----" + member);
		memberService.join(member);
		rttr.addFlashAttribute("result", member.getId());
		return "redirect:/member/login";
	}

	// 아이디 중복체크
	@PostMapping("/memberIdChk")
	@ResponseBody // join.jsp로 메서드의 결과 반환
	public String memberIdChkPOST(String memberId) {
		log.info("memberIdChk====");
		int result = memberService.idCheck(memberId);

		log.info("결과값 = " + result);
		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	// 닉네임 중복체크
	@PostMapping("/memberNickChk")
	@ResponseBody
	public String memberNicknamePOST(String memberNickname) {
		log.info("memberNickChk====");

		int result = memberService.nickCheck(memberNickname);
		log.info("결과값 : " + result);
		if (result != 0) {
			return "fail"; // 중복 닉네임이 존재
		} else {
			return "success"; // 중복 닉네임 x
		}
	}

	// 추천인 확인
	@PostMapping("/memberIntroChk")
	@ResponseBody
	public String memberIntroducerPOST(String memberIntroducer) {
		log.info("memberIntroChk");

		int result = memberService.introCheck(memberIntroducer);
		log.info("결과값 : " + result);
		if (result != 0) {
			return "success"; // 추천인 있음
		} else {
			return "fail"; // 추천인 없음 X
		}
	}

	@GetMapping("/myPage")
	public void myPage(@RequestParam("id") String id, Model model) {
		model.addAttribute("member", memberService.get(id));
	}
}
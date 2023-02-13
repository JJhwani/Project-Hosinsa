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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.PageDTO;
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
	
	// 회원 관리 리스트(관리자 전용)
	@GetMapping("/manager")
	public void list(Criteria cri, Model model) {
		log.info("list---- : " + cri);
		model.addAttribute("list", memberService.getList(cri));
		
		int total = memberService.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/managerGet")
	public void managerGet(@RequestParam("id") String id, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/member/managerGet====");
		model.addAttribute("member", memberService.get(id));
	}
	
	@PostMapping("/managerModify")
	public String modifyPOST(MemberVO member, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modifyPOST : " + member);
		
		if (memberService.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		} 
		 
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		 
		
		return "redirect:/member/manager";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {
		log.info("remove----" + id);
		
		if (memberService.remove(id)) {
			rttr.addFlashAttribute("result", "seccess");
		}
		return "redirect:/member/manager";
	}
	
	// 회원가입
	@GetMapping("/join")
	public void join() {
		log.info("join====");
	}
	// 회원가입
	@PostMapping("/join")
	public String joinPOST(MemberVO member, RedirectAttributes rttr) {
		log.info("joinPOST====" + member);
		memberService.join(member);
		rttr.addFlashAttribute("result", member.getId());
		return "redirect:/";
	}
	// 아이디 중복체크
	@PostMapping("/memberIdChk")
	@ResponseBody // join.jsp로 메서드의 결과 반환
	public String memberIdChkPOST(String memberId) {
		log.info("memberIdChk====");
		int result = memberService.idCheck(memberId);
		
		log.info("결과값 = " + result);
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
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
			return "fail";	// 중복 닉네임이 존재
		} else {
			return "success";	// 중복 닉네임 x
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
			return "fail";	// 추천인 없음 X
		}
	}
}

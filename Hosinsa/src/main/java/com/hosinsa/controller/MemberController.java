package com.hosinsa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.hosinsa.service.KakaoService;
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
	private KakaoService kakaoService;

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
	public void myPage(@ModelAttribute("member") MemberVO vo, Model model) {
		model.addAttribute("member", vo);
	}

	@GetMapping("/modify")
	public void modifyGET(@ModelAttribute("member") MemberVO vo, Model model) {
		log.info("modofyGET====");
		model.addAttribute("member", vo);
	}

	@PostMapping("/modify")
	public String modifyPOST(MemberVO member, RedirectAttributes rttr, Model model) {
		log.info("modify : " + member);
		model.addAttribute("member", member);

		if (memberService.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/myPage";
	}

	@GetMapping("/remove")
	public void removeGET(@ModelAttribute("member") MemberVO vo, Model model) {
		log.info("removeGET====>");
		model.addAttribute("member", vo);
	}

	@PostMapping("/remove")
	public String removePOST(@ModelAttribute("member")MemberVO vo, SessionStatus session, RedirectAttributes rttr, Model model) {
		log.info("removePOST====>");
		int result = memberService.remove(vo);
		if(result != 0) {
			rttr.addFlashAttribute("result", "success");
			session.setComplete();
			return "redirect:/";
		} else {
			model.addAttribute("msg", result);
			return "/member/myPage";
		}
	}
	
	// 카카오 로그인
	@GetMapping("/kakaologin_page")
	public String kakaoLogin_page(@RequestParam(value = "code", required = false) String code) {
		StringBuffer loginUrl = new StringBuffer();
        loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
        loginUrl.append("a8bea3904686bd773a43da6230b82b92"); 
        loginUrl.append("&redirect_uri=");
        loginUrl.append("http://localhost:8081/member/kakaologin"); 
        loginUrl.append("&response_type=code");
        
        return "redirect:"+loginUrl.toString();
	}
	
	@GetMapping("/kakaologin")
	public String redirectKakao(MemberVO member, @RequestParam String code, Model model) {
		log.info("code : " + code);
		
		// 접속 토큰 GET
		String kakaoToken = kakaoService.getAccessToken(code);
		log.info("안나오는거야? " + kakaoToken);
		
		// 접속자 정보 GET
		Map<String,Object> result = kakaoService.getUserInfo(kakaoToken);
		log.info(result.get("nickname"));
		log.info(result.get("profile_image"));
		
		member.setName((String)result.get("nickname"));
		member.setProfilimg((String)result.get("profile_image"));
		
		model.addAttribute("member", member);
		
		return "redirect:/";
	}
}
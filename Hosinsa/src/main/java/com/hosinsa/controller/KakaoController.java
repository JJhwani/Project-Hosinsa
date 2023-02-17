package com.hosinsa.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.service.MemberService;
import com.hosinsa.service.kakaoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@SessionAttributes("member")
@AllArgsConstructor
public class KakaoController {
	
	private kakaoService kakaoService;
	
	private MemberService memberService;
	
	 @RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
	 public String redirectKakao (@ModelAttribute("member") MemberVO vo, @RequestParam String code ) {
		 log.info("code : " + code);
		 
		 // 접속토큰 get
	     String kakaoToken = kakaoService.getReturnAccessToken(code);
	     
	     // 접속자 정보 get
	     Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
	     log.info("result:: " + result);
	     String snsId = (String) result.get("id");
	     String userName = (String) result.get("nickname");
	     String email = (String) result.get("email");
	     String userpw = snsId;
	     
	     MemberVO memberVO = new MemberVO();
	     
	     return "";
	 }
	
}

package org.ezen.controller;

import org.ezen.domain.NoticeVO;
import org.ezen.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@AllArgsConstructor
@Log4j
public class NoticeController {

	@Autowired
	private NoticeService service;

	@GetMapping("/list") // 목록
	public void list(Model model) { // 게시글의 목록을 전달해야 하므로 Model 지정
		model.addAttribute("list", service.getList());
//			model.addAttribute("pageMaker", new PageDTO(cri, 123)); // 현재페이지, 페이지당 화면상 보여지는 레코드 수, 전체카운트
	}

	@GetMapping("/register") // 등록, 입력페이지를 보여주는 역할
	public void reregister() {
	}

	@PostMapping("/register") // 등록
	public String register(NoticeVO vo, RedirectAttributes rttr) { // 등록 작업이 끝난 후 다시 목록 화면으로 이동할 때 새롭게 등록된 게시물의 번호를 같이
																	// 전달하기 위해 RedirectAttributes 사용
		log.info("register: " + vo);
		service.register(vo);
		rttr.addFlashAttribute("result", vo.getNno()); // 일회성으로 데이터 전달
		return "redirect:/notice/list"; // prg방식
	}

	@GetMapping({ "/get", "/modify" }) // 조회
	public void get(@RequestParam("nno") Long nno, Model model) {
		model.addAttribute("notice", service.get(nno));
	}

	@PostMapping("/modify") // 수정
	public String modify(NoticeVO vo, RedirectAttributes rttr) {
		log.info("/modify......");

		if (service.modify(vo)) { // 수정 여부를 boolean으로 처리하므로 성공한 경우에만 RedirectAttributes에 추가
			rttr.addAttribute("result", "success");
		}
		return "redirect:/notice/list";
	}

	@PostMapping("/remove") // 삭제는 반드시 POST방식
	public String remove(@RequestParam("nno") Long nno, RedirectAttributes rttr) { // 삭제 후 페이지의 이동이 필요하므로
																					// RedirectAttributes를 파라미터로 사용
		log.info("/remove......");

		if (service.remove(nno)) { // 성공하면 이 작업
			rttr.addAttribute("result", "success");
		}
		return "redirect:/notice/list"; // 삭제 처리 후 다시 목록 페이지로 이동
	}
}

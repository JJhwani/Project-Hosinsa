package com.hosinsa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.NoticeVO;
import com.hosinsa.domain.PageDTO;
import com.hosinsa.service.NoticeService;

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
	public void list(Criteria cri, Model model) { 
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/register") // 등록, 입력페이지를 보여주는 역할
	public void reregister() {
	}

	@PostMapping("/register") // 등록
	public String register(NoticeVO vo, RedirectAttributes rttr) {

		log.info("register: " + vo);
		service.register(vo);
		rttr.addFlashAttribute("result", vo.getNno());
		return "redirect:/notice/list";
	}

	@GetMapping({ "/get", "/modify" }) // 조회
	public void get(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("notice", service.get(nno));
	}

	@PostMapping("/modify") // 수정
	public String modify(NoticeVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("/modify......");

		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/notice/list";
	}

	@PostMapping("/remove") // 삭제
	public String remove(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		log.info("/remove......");

		if (service.remove(nno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/notice/list";
	}
}

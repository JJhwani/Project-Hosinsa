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
import com.hosinsa.domain.PageDTO;
import com.hosinsa.domain.QnaVO;
import com.hosinsa.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@AllArgsConstructor
@Log4j
public class QnaController {

	@Autowired
	private QnaService service;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list" + cri);
		model.addAttribute("list",service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/register") 
	public void register() {
	}

	@PostMapping("/register") 
	public String register(QnaVO qna, RedirectAttributes rttr) {

		log.info("register: " + qna);
		service.register(qna);
		rttr.addFlashAttribute("result", qna.getQno());
		return "redirect:/qna/list";
	}

	@GetMapping({ "/get", "/modify" }) 
	public void get(@RequestParam("qno") Long qno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("qna", service.get(qno));
	}

	@PostMapping("/modify")
	public String modify(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:"+ qna);

		if (service.modify(qna)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/qna/list";
	}
		
	@PostMapping("/remove") 
	public String remove(@RequestParam("qno") Long qno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {	 
		log.info("remove......"+ qno);

		if (service.remove(qno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/qna/list";
	}
}

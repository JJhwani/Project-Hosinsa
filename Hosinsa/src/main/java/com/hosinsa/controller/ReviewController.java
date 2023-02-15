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

import com.hosinsa.domain.ReviewCriteria;
import com.hosinsa.domain.ReviewPageDTO;
import com.hosinsa.domain.ReviewVO;
import com.hosinsa.service.ReviewService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@GetMapping("/list")
	public void list(ReviewCriteria cri, Model model) {
		
		log.info("list" + cri);
		
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		
		log.info("total" + total);
		
		model.addAttribute("pageMaker", new ReviewPageDTO(cri, total));
	}
	

	@PostMapping("/register")
	public String register(ReviewVO vo, RedirectAttributes rttr) {
		
		log.info("등록=========>" + vo);
		service.regiseter(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		
		return "redirect:/review/list";
		
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") ReviewCriteria cri, Model model) {
		
		log.info("bno값을 좀 더 명시적으로 처리하는 RequestParam을 사용한다");
		
		model.addAttribute("review", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(ReviewVO vo, @ModelAttribute("cri") ReviewCriteria cri, RedirectAttributes rttr) {
		log.info("수정============>" + vo);
		
		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		
		return "redirect:/review/list";
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") ReviewCriteria cri, RedirectAttributes rttr) {
		
		log.info("삭제삭제=========>" + bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/review/list";
	}
	
	
	@GetMapping("/register")
	public void register() {
		
		
	}
	
}
	




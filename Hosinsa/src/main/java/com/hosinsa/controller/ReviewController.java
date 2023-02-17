package com.hosinsa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.ReviewCriteria;
import com.hosinsa.domain.ReviewPageDTO;
import com.hosinsa.domain.ReviewVO;
import com.hosinsa.service.ReviewService;
import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes("member")
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	@Autowired
	private ReviewService service;
		
	@ResponseBody
	@GetMapping("/list")
	public List<ReviewVO> list(ReviewCriteria cri,Integer pronum,Model model) {
				
		model.addAttribute("list", service.getList(pronum,cri));

		int total = service.getTotal(cri);
		
		model.addAttribute("pageMaker", new ReviewPageDTO(cri, total));
		
		return service.getList(pronum,cri);
	}
	

	@PostMapping("/register")
	public String register(ReviewVO vo, RedirectAttributes rttr) {
		
		service.regiseter(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		
		return "redirect:/review/list";
		
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") ReviewCriteria cri, Model model) {
		
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
	public String remove(@RequestParam("bno") Long bno, @RequestParam("pronum") int pronum, @ModelAttribute("cri") ReviewCriteria cri, RedirectAttributes rttr) {
		
		log.info("삭제삭제=========>" + bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pronum",pronum);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		//rttr.addAttribute("type", cri.getType());
		//rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/product/{pronum}";
	}
	
	
	@GetMapping("/register")
	public void register(@RequestParam("pronum") int pronum,@RequestParam("ordernum") int ordernum,@ModelAttribute("member") MemberVO vo, Model model) {
		
		model.addAttribute("product",service.getProduct(pronum));
		model.addAttribute("ordernum",ordernum);
		model.addAttribute("member",vo);
		
	}
	
}
	




package com.hosinsa.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hosinsa.domain.BoardEventVO;
import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.PageDTO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.service.BoardService;
import com.hosinsa.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@Autowired
	MainService service;
	
	@Autowired
	BoardService boardService;

	@GetMapping("/")
	public String main(@ModelAttribute("recentView")List<ProductVO> recentView, ProductVO vo, String sort, BoardEventVO bevo, Model model) {
		model.addAttribute("viewList", service.getListProview(vo));
		model.addAttribute("bestList", service.getListBest());
		model.addAttribute("newList", service.getListNew());
		model.addAttribute("category", "인기");
		model.addAttribute("sort", "best");
		model.addAttribute("event", boardService.getListMainEvent(bevo));

		int total = service.getTotalCountView(vo);
		model.addAttribute("pageMaker", new PageDTO(vo, total));	

		int total = service.getTotalCountView(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "main";
	}
	
	@GetMapping(value="/main/sorting")
	public String mainPage(String sort, String category, ProductVO vo, BoardEventVO bevo, Model model) throws UnsupportedEncodingException {
		int total = 0;
		if(category.equals("인기")) {
			model.addAttribute("viewList", service.getListProview(cri));
			model.addAttribute("bestList", service.getListBest());
			model.addAttribute("newList", service.getListNew());
			
			switch(sort) {
				case "best" : model.addAttribute("viewList", service.getSortBestMain(vo));
						break;
				case "new" : model.addAttribute("viewList", service.getSortNewMain(vo));
						break;
				case "lowPrice" : model.addAttribute("viewList", service.getSortLowPriceMain(vo));
						break;
				case "highPrice" : model.addAttribute("viewList", service.getSortHighPriceMain(vo));
						break;
				case "review" : model.addAttribute("viewList", service.getSortReviewMain(vo));
						break;
				case "" : model.addAttribute("viewList", service.getSortBestMain(vo));
						break;
			}
			
			total = service.getTotalCountView(vo);
			
			model.addAttribute("category", category);
			model.addAttribute("sort", sort);
			model.addAttribute("event", boardService.getListMainEvent(bevo));
			model.addAttribute("pageMaker", new PageDTO(vo, total));
			return "main";
		}
		else {
			model.addAttribute("viewList", service.getListCategory(cri));
			model.addAttribute("bestList", service.getListBest());
			model.addAttribute("newList", service.getListNew());
			total = service.getTotalCount(cri);
		}
		
		log.info("--------------------------------------dasdfaSDf"+category);
		log.info("--------------------------------------dasdfaSDf"+cri);
		model.addAttribute("category", category);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "main";
}



}

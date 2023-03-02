package com.hosinsa.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.SessionAttributes;

import com.hosinsa.domain.BoardEventVO;
import com.hosinsa.domain.BoardNoticeVO;
import com.hosinsa.domain.PageDTO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.service.BoardService;
import com.hosinsa.service.MainService;

@Controller
@SessionAttributes({"recentView"})
public class MainController {

	@Autowired
	MainService service;
	
	@Autowired
	BoardService boardService;
	
	@ModelAttribute("recentView")
	public List<ProductVO> setEmptyRecentView() {
	    return new ArrayList<ProductVO>();
	}
	
	@GetMapping("/")
	public String main(@ModelAttribute("recentView")List<ProductVO> recentView, ProductVO vo, String sort, BoardEventVO bevo, BoardNoticeVO bnvo, Model model) {
		model.addAttribute("viewList", service.getListProview(vo));
		model.addAttribute("bestList", service.getListBest());
		model.addAttribute("newList", service.getListNew());
		model.addAttribute("category", "인기");
		model.addAttribute("sort", "best");
		model.addAttribute("eventList", boardService.getEventList(bevo));
		model.addAttribute("event", boardService.getListMainEvent(bevo));
		model.addAttribute("notice", boardService.getListMainNotice(bnvo));

		int total = service.getTotalCountView(vo);
		model.addAttribute("pageMaker", new PageDTO(vo, total));

		return "main";
	}
	
	@GetMapping(value="/main/sorting")
	public String mainPage(String sort, String category, ProductVO vo, BoardEventVO bevo, BoardNoticeVO bnvo, Model model) throws UnsupportedEncodingException {
		int total = 0;
		if(category.equals("인기")) {
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
			model.addAttribute("eventList", boardService.getEventList(bevo));
			model.addAttribute("event", boardService.getListMainEvent(bevo));
			model.addAttribute("notice", boardService.getListMainNotice(bnvo));
			model.addAttribute("pageMaker", new PageDTO(vo, total));
			return "main";
		}
		total = service.getTotalCount(vo);
		//model.addAttribute("category", category);
		category = URLEncoder.encode(category, "UTF-8");
		model.addAttribute("sort", sort);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		
		
		return "redirect:/category/sorting?category="+category;
	}
	
	@GetMapping(value="/category/sorting")
	public String categoryPageSorting(String sort, String category, ProductVO vo, Model model) {
		int total = 0;
		model.addAttribute("bestList", service.getListBestCategory(vo));
		
		switch(sort) {
			case "best" : model.addAttribute("viewList", service.getSortBest(vo));
				break;
			case "new" : model.addAttribute("viewList", service.getSortNew(vo));
				break;
			case "lowPrice" : model.addAttribute("viewList", service.getSortLowPrice(vo));
				break;
			case "highPrice" : model.addAttribute("viewList", service.getSortHighPrice(vo));
				break;
			case "review" : model.addAttribute("viewList", service.getSortReview(vo));
				break;
			case "" : model.addAttribute("viewList", service.getSortBest(vo));
				break;
		}
		
		total = service.getTotalCount(vo);

		model.addAttribute("category", category);
		model.addAttribute("sort", sort);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		
		return "category";
	}
	
	//@PostMapping(value="/searchProduct")
	@GetMapping(value="/search/sorting")
	public String searchProduct(String sort, String keyword, ProductVO vo, Model model) {
		int total = 0;
		switch(sort) {
			case "best" : model.addAttribute("viewList", service.getSortBestSearch(vo));
				break;
			case "new" : model.addAttribute("viewList", service.getSortNewSearch(vo));
				break;
			case "lowPrice" : model.addAttribute("viewList", service.getSortLowPriceSearch(vo));
				break;
			case "highPrice" : model.addAttribute("viewList", service.getSortHighPriceSearch(vo));
				break;
			case "review" : model.addAttribute("viewList", service.getSortReviewSearch(vo));
				break;
			case "" : model.addAttribute("viewList", service.getSortBestSearch(vo));
				break;
		}

		total = service.getTotalCountSearch(vo);
		
		model.addAttribute("sort", sort);
		model.addAttribute("pageMaker", new PageDTO(vo, total));	
		
		return "search";
	}
	
	@GetMapping("/product/{pronum}")
	public String get(@PathVariable int pronum,@ModelAttribute("recentView")List<ProductVO> recentView, Model model) {		
		
		//조회수 up+1
		service.updateView(pronum);		
		model.addAttribute("product", service.getProductByPronum(pronum));	
		
		//최근 본 상품 기능
		//pronum을 받아 최근 본 최근 본 상품으로 추가
		ProductVO current = service.getProductByPronum(pronum);
		//중복제거
		int index = 0;
		for(ProductVO item : recentView){
			if(item.getPronum()==current.getPronum()) {
				recentView.remove(index);
				break;
			}
			index++;
	    }
		recentView.add(current);
				
		//최근 4개 자르기
		if(recentView.size()>4) {
			recentView = recentView.subList(1,5);
		}
		//세션에 저장
		model.addAttribute("recentView",recentView);	
				
		return "product";		
	}
	
}

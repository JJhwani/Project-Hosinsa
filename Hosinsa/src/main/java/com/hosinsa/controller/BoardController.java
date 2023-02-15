package com.hosinsa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.PageDTO;
import com.hosinsa.service.BoardService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	// 이벤트 게시판
	@PostMapping("/event/list")
	public String eventList(Criteria cri, Model model) {
		
		int total = service.getTotalEvent(cri);
		Date today = new Date();
		
		model.addAttribute("event", service.getListEvent(cri));
		model.addAttribute("today", today);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/board/event";
	}
	
	@PostMapping("/event/read")
	public String eventRead(@RequestParam("event_no") Long event_no, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info(event_no);
		model.addAttribute("event", service.readEvent(event_no));
		
		return "/board/eventRead";
	}
	
}

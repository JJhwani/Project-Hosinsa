package com.hosinsa.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.BoardEventVO;
import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.PageDTO;
import com.hosinsa.domain.ProductVO;
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
	
	// 개별 이벤트 
	@PostMapping("/event/read")
	public String eventRead(@RequestParam("event_no") Long event_no, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info(event_no);
		model.addAttribute("event", service.readEvent(event_no));
		
		return "/board/eventRead";
	}
	
	// 이벤트 추가
	@PostMapping("/register")
	public String eventResister(BoardEventVO bevo, Criteria cri, MultipartFile uploadFile, Model model) {
		//==========================배포 전 경로 Works3로 수정해 주세요.
		String uploadFolder = "C:\\Works3\\Project-Hosinsa\\Hosinsa\\src\\main\\webapp\\resources\\images\\eventBanner\\";
		String fileName = uploadFile.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
		
		try {
			uploadFile.transferTo(saveFile);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		bevo.setEvent_img("../../resources/images/eventBanner/"+fileName);
		
		if(service.registerEvent(bevo)) {
			model.addAttribute("register","success");
		}
		
		int total = service.getTotalEvent(cri);
		Date today = new Date();
		
		model.addAttribute("event", service.getListEvent(cri));
		model.addAttribute("today", today);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/board/event";
	}
	
	@GetMapping("/event/modify")
	public String eventModifyForm(Model model,Long event_no) {
		model.addAttribute("event",service.readEvent(event_no));
		
		return "/board/eventModify";
	}
	
	// 이벤트 수정
	@PostMapping("/event/modify")
	public String eventModify(BoardEventVO bevo, Criteria cri,  MultipartFile uploadFile, Model model) throws IOException{
		//==========================배포 전 경로 Works3로 수정해 주세요.
		String uploadFolder = "C:\\Works3\\Project-Hosinsa\\Hosinsa\\src\\main\\webapp\\resources\\images\\eventBanner\\";
		String fileName = uploadFile.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
				
		try {
			uploadFile.transferTo(saveFile);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		bevo.setEvent_img("../../resources/images/eventBanner/"+fileName);
		
		if(service.modifyEvent(bevo)) {
			model.addAttribute("modify","success");
		}
		
		int total = service.getTotalEvent(cri);
		Date today = new Date();
		
		model.addAttribute("event", service.getListEvent(cri));
		model.addAttribute("today", today);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
				
		return "/board/event";
	}
	
	// 이벤트 삭제
	@PostMapping("/remove")
	public String eventRemove(@RequestParam("event_no") Long event_no, Criteria cri, RedirectAttributes rttr) {
		log.info("remove ===> ");
		if(service.removeEvent(event_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/event/list"+cri.getListLink();
	}
	
}

package com.hosinsa.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.BoardEventVO;
import com.hosinsa.domain.BoardNoticeVO;
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
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/event/list")
	public String eventList(Criteria cri, Model model) {
		
		int total = service.getTotalEvent(cri);
		Date today = new Date();
		
		model.addAttribute("event", service.getListEvent(cri));
		model.addAttribute("today", today);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/board/event";
	}
	
	// 이벤트 상세페이지
	@PostMapping("/event/read")
	public String eventRead(@RequestParam("event_no") Long event_no, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("event", service.readEvent(event_no));
		
		return "/board/eventRead";
	}
	
	// 이벤트 추가 폼
	@GetMapping("/event/register")
	public String eventRegisterForm() {
		return "/board/eventRegister";
	}
	
	// 이벤트 추가
	@PostMapping("/event/register")
	public String eventRegister(BoardEventVO bevo, Criteria cri, MultipartFile uploadFile, Model model) {
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
	// 이벤트 수정 폼
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
		
		log.info("========================="+fileName);
		
		if(fileName.equals("")) {
			fileName = bevo.getEvent_img().substring(bevo.getEvent_img().lastIndexOf("/")+1);
		}
		
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
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/event/remove")
	public String eventRemove(@RequestParam("event_no") Long event_no, Criteria cri, RedirectAttributes rttr) {
		if(service.removeEvent(event_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/event/list";
	}
	
	// 공지사항 게시판
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/notice/list")
	public String noticeList(Criteria cri, Model model) {
		
		int total = service.getTotalNotice(cri);		
		model.addAttribute("notice", service.getListNotice(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/board/notice";
	}
	
	// 공지사항 상세페이지
	@PostMapping("/notice/read")
	public String noticeRead(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("notice", service.readNotice(nno));
		service.readCountNotice(nno);
		
		return "/board/noticeRead";
	}
	
	// 공지사항 추가 폼
	@GetMapping("/notice/register")
	public String noticeRegisterForm() {
		return "/board/noticeRegister";
	}
	
	// 공지사항 추가
	@PostMapping("/notice/register")
	public String noticeRegister(BoardNoticeVO bnvo, Criteria cri, Model model) {
		
		if(service.registerNotice(bnvo)) {
			model.addAttribute("register","success");
		}
		
		int total = service.getTotalNotice(cri);
		model.addAttribute("notice", service.getListNotice(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/board/notice";
	}
	
	// 공지사항 수정 폼
	@GetMapping("/notice/modify")
	public String noticeModifyForm(Model model,Long nno) {
		model.addAttribute("notice",service.readNotice(nno));
		
		return "/board/noticeModify";
	}
	
	// 공지사항 수정
	@PostMapping("/notice/modify")
	public String noticeModify(BoardNoticeVO bnvo, Criteria cri, Model model) {

		if(service.modifyNotice(bnvo)) {
			model.addAttribute("modify","success");
		}
		
		int total = service.getTotalNotice(cri);
		model.addAttribute("notice", service.getListNotice(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
				
		return "/board/notice";
	}
	
	// 공지사항 삭제
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/notice/remove")
	public String noticeRemove(@RequestParam("nno") Long nno, Criteria cri, RedirectAttributes rttr) {
		if(service.removeNotice(nno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/notice/list";
	}
	
	// 공지사항 검색
	@GetMapping("/notice/search")
	public String searchProduct(String keyword, BoardNoticeVO bnvo, Criteria cri, Model model) {
		
		int total = service.getTotalCountSearch(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/board/notice";
	}
	
}

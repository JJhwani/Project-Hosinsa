package com.hosinsa.controller;

import java.io.File;

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
	public String register(QnaVO qna, RedirectAttributes rttr, MultipartFile[] photoUpload, Model model) {

		 String uploadFolder = // "C:\\Works3\\Project-Hosinsa\\Hosinsa\\src\\main\\webapp\\resources\\photoUpload"
				 "C:\\Works3\\Project\\Project-Hosinsa\\Project-Hosinsa\\Hosinsa\\src\\main\\webapp\\resources\\photoUpload"; //호신사 프로젝트로 경로 수정 예정
		
		int index = 1;
		qna.setPhoto1("");
		qna.setPhoto2("");
		qna.setPhoto3("");
		
		for (MultipartFile multipartFile : photoUpload) {
			
			log.info("===============");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize()); 
		

			File saveFile = new File(uploadFolder,qna.getId()+multipartFile.getOriginalFilename());
				
			if(index==1) {
				qna.setPhoto1("../../resources/photoUpload/"+qna.getId()+multipartFile.getOriginalFilename());
			}else if(index==2){
				qna.setPhoto2("../../resources/photoUpload/"+qna.getId()+multipartFile.getOriginalFilename());
			}else if(index==3) {
				qna.setPhoto3 ("../../resources/photoUpload/"+qna.getId()+multipartFile.getOriginalFilename());
			}
			index++;
		
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}//end catch
		
		}
		
		
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
	public String modify(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, MultipartFile[] photoUpload, Model model) {
		 String uploadFolder = // "C:\\Works3\\Project-Hosinsa\\Hosinsa\\src\\main\\webapp\\resources\\photoUpload"
				 "C:\\Works3\\Project\\Project-Hosinsa\\Project-Hosinsa\\Hosinsa\\src\\main\\webapp\\resources\\photoUpload"; //호신사 프로젝트로 경로 수정 예정
	
		 int index = 1;
		 qna.setPhoto1("");
		 qna.setPhoto2("");
		 qna.setPhoto3("");
			
			for (MultipartFile multipartFile : photoUpload) {
				
				log.info("===============");
				log.info("Upload File Name: " + multipartFile.getOriginalFilename());
				log.info("Upload File Size: " + multipartFile.getSize()); 
			

				File saveFile = new File(uploadFolder,qna.getId()+multipartFile.getOriginalFilename());
					
				if(index==1) {
					qna.setPhoto1("../../resources/photoUpload/"+qna.getId()+multipartFile.getOriginalFilename());
				}else if(index==2){
					qna.setPhoto2("../../resources/photoUpload/"+qna.getId()+multipartFile.getOriginalFilename());
				}else if(index==3) {
					qna.setPhoto3 ("../../resources/photoUpload/"+qna.getId()+multipartFile.getOriginalFilename());
				}
				index++;
			
				try {
					multipartFile.transferTo(saveFile);
				} catch (Exception e) {
					log.error(e.getMessage());
				}//end catch
			
			}

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

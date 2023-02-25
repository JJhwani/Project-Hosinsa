package com.hosinsa.controller;

import java.io.Console;
import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.PreReviewVO;
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
	
	@Transactional
	@PostMapping("/register")
	public String register(ReviewVO review, PreReviewVO pre, RedirectAttributes rttr, MultipartFile[] photoUpload, Model model ) {
		
		String uploadFolder = "C:\\Works3\\Project-Hosinsa\\Hosinsa\\src\\main\\webapp\\resources\\photoUpload";//호신사 프로젝트로 경로 수정 예정
		
		int index = 1;
		
		review.setPhoto1("");
		review.setPhoto2("");
		review.setPhoto3("");
		
		
		for (MultipartFile multipartFile : photoUpload) {
			
			if(multipartFile.getOriginalFilename()=="") continue;
			if(multipartFile.isEmpty()) continue;
			
			log.info("===============");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize()); 
		

			File saveFile = new File(uploadFolder,review.getId()+multipartFile.getOriginalFilename());

			if(index==1) {
				review.setPhoto1("../../resources/photoUpload/"+review.getId()+multipartFile.getOriginalFilename());
			}else if(index==2){
				review.setPhoto2("../../resources/photoUpload/"+review.getId()+multipartFile.getOriginalFilename());
			}else if(index==3) {
				review.setPhoto3 ("../../resources/photoUpload/"+review.getId()+multipartFile.getOriginalFilename());
			}
			index++;
		
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}//end catch
		
		}
		
		
		service.regiseter(review);
		service.deletePre(pre);
		rttr.addFlashAttribute("review", "success");
		
		
		return "redirect:/member/myPage";

	}
	
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") ReviewCriteria cri, Model model) {
		model.addAttribute("product",service.getProduct(service.get(bno).getPronum()));
		model.addAttribute("review", service.get(bno));
	}
	
	
	@PostMapping("/modify")
	public String modify(ReviewVO vo, @ModelAttribute("cri") ReviewCriteria cri, RedirectAttributes rttr, MultipartFile[] photoUpload, Model model) {
		
		 String uploadFolder = "C:\\Works3\\Project-Hosinsa\\Hosinsa\\src\\main\\webapp\\resources\\photoUpload"; //호신사 프로젝트로 경로 수정 예정
		 		 
		 int index = 1;
		//업로드된 파일이 없을 경우 첨부 파일을 비우지 않고 기존 파일을 그대로 업로드
		if((photoUpload[0].getSize()!=0)) {
			vo.setPhoto1("");
			vo.setPhoto2("");
			vo.setPhoto3("");
		}
			
		for (MultipartFile multipartFile : photoUpload) {
			
			if(multipartFile.getOriginalFilename()=="") continue;
			if(multipartFile.isEmpty()) continue;
			
			log.info("===============");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize()); 
		

			File saveFile = new File(uploadFolder,vo.getId()+multipartFile.getOriginalFilename());
				
			if(index==1) {
				vo.setPhoto1("../../resources/photoUpload/"+vo.getId()+multipartFile.getOriginalFilename());
			}else if(index==2){
				vo.setPhoto2("../../resources/photoUpload/"+vo.getId()+multipartFile.getOriginalFilename());
			}else if(index==3) {
				vo.setPhoto3 ("../../resources/photoUpload/"+vo.getId()+multipartFile.getOriginalFilename());
			}
			index++;
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}//end catch
		
		}
		
		
		if (service.modify(vo)) {
			rttr.addFlashAttribute("modify", "success");
		}
		
		return "redirect:/member/myPage";
	}
	
	
	@RequestMapping(value="/remove", method= {RequestMethod.GET,RequestMethod.POST})
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("remove", "success");
		}
		
		return "redirect:/member/myPage";
	}
	
	
	@GetMapping("/register")
	public void register(@RequestParam("pronum") int pronum,@RequestParam("ordernum") int ordernum,@ModelAttribute("member") MemberVO vo, Model model) {
		
		model.addAttribute("product",service.getProduct(pronum));
		model.addAttribute("ordernum",ordernum);
		model.addAttribute("member",vo);
		
	}
}
	




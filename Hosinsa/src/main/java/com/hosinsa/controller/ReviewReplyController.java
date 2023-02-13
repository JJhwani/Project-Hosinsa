package com.hosinsa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hosinsa.domain.ReviewCriteria;
import com.hosinsa.domain.ReviewReplyPageDTO;
import com.hosinsa.domain.ReviewReplyVO;
import com.hosinsa.service.ReviewReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReviewReplyController {
	
	@Autowired
	private ReviewReplyService service;
	
	
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReviewReplyVO vo) {
		
		log.info("ReviewReplyVO" + vo);
		
		int insertCount = service.register(vo);
		
		log.info("insertCount===========>" + insertCount);
		
		return insertCount == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

						
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, 
			value = "/{rno}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify (
			@RequestBody ReviewReplyVO vo,
			@PathVariable("rno") Long rno) {
			
		vo.setRno(rno);
		
		log.info("rno==============" + rno);
		log.info("modify===========" + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
		
		@GetMapping(value = "/pages/{bno}/{page}",
				produces= {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_VALUE })
		public ResponseEntity<ReviewReplyPageDTO> getList(@PathVariable("page") 
		int page, @PathVariable("bno") Long bno) {
			
			ReviewCriteria cri = new ReviewCriteria(page, 10);
			
			log.info("get Reply===================" + bno);
			
			log.info("cri==========" + cri);
			
			return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
			
		}
	
	
}

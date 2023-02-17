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
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		int insertCount = service.register(vo);
				
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
	
	@ResponseBody
	@GetMapping(value = "/{bno}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<ReviewReplyVO>> getList(@PathVariable("bno") Long bno) {
				
		log.info("get Reply===================" + bno);
				
		return new ResponseEntity<>(service.getList(bno), HttpStatus.OK);
		
	}
	
	@RequestMapping(method = {RequestMethod.DELETE} , value = "/{rno}")
	public ResponseEntity<String> deleteReviewReply(@PathVariable("rno") Long rno) {
		
		return service.remove(rno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}

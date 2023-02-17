package com.hosinsa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hosinsa.domain.LikesVO;
import com.hosinsa.service.LikesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/likes/")
@Log4j
@AllArgsConstructor
public class LikesController {
		
		@Autowired
		private LikesService service;
		
		
		//찜하기 추가
		@PostMapping(value="/new",
				consumes = "application/json",
				produces = { MediaType.TEXT_PLAIN_VALUE,
							MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<String> create(@RequestBody LikesVO vo) {
			
			log.info("LikesVO=======" + vo);
			
			int insertCount = service.register(vo);
			
			log.info("LikesVO=======" + insertCount);
			
			return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		//찜하기 삭제
		@DeleteMapping(value="/{lno}",
				consumes = "application/json",
				produces = { MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> remove(@PathVariable("lno") Long lno) {
			
			log.info("remove========" + lno);
			
			return service.remove(lno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
				
		@GetMapping(value= "/{id}",
				consumes = "application/json",
				produces = { MediaType.TEXT_PLAIN_VALUE,
							MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<List<LikesVO>> getMyList(@PathVariable("id") LikesVO vo) {
			
			log.info("마이페이지=========" + vo);
			return new ResponseEntity<>(service.getMyList(vo), HttpStatus.OK);
		}
		
		@GetMapping(value= "/{pronum}",
				consumes = "application/json",
				produces = { MediaType.TEXT_PLAIN_VALUE,
							MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<List<LikesVO>> getProList(@PathVariable("pronum") int pronum) {
			
			log.info("마이페이지=========" + pronum);
			return new ResponseEntity<>(service.getProList(pronum), HttpStatus.OK);
		}
		
		@PostMapping(value="/lno",
				consumes = "application/json",
				produces = { MediaType.TEXT_PLAIN_VALUE,
							MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<Integer> getBylnowithUser(@RequestBody LikesVO vo) {

			log.info("중복체크===========" + vo);
			return new ResponseEntity<>(service.getBylnowithUser(vo), HttpStatus.OK);
		}
		
	}
		


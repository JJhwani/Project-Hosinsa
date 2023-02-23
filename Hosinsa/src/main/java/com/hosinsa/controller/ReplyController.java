package com.hosinsa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ReplyPageDTO;
import com.hosinsa.domain.ReplyVO;
import com.hosinsa.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/qreplies/")
@RestController
@Log4j
@NoArgsConstructor
@AllArgsConstructor
public class ReplyController {

	@Autowired
	private ReplyService service;

	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {

		log.info(vo);

		int insertCount = service.register(vo);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/pages/{qno}/{page}", 
	         produces = { MediaType.APPLICATION_XML_VALUE,
	         MediaType.APPLICATION_JSON_VALUE })
	   public ResponseEntity<ReplyPageDTO> getList(
	         @PathVariable("page") int page, 
	         @PathVariable("qno") Long qno) {

	      Criteria cri = new Criteria(page, 10);
	      
	      log.info("get Reply List qno: " + qno);

	      log.info("cri:" + cri);

	      return new ResponseEntity<>(service.getListPage(cri, qno), HttpStatus.OK);
	   }
	
	@GetMapping(value = "/{rno}", 
			produces = { MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {
		return new ResponseEntity<>(service.get(rno),HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rno}", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno)  {
		vo.setRno(rno);
		log.info(rno);
		return service.modify(vo) ==1?  new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	
	}

}

package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ReplyPageDTO;
import com.hosinsa.domain.ReplyVO;
import com.hosinsa.mapper.QnaMapper;
import com.hosinsa.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private QnaMapper qnaMapper;

	@Transactional
	@Override
	public int register(ReplyVO vo) {
		qnaMapper.updateReplyCnt(vo.getQno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {

		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {

		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		ReplyVO vo = mapper.read(rno);
		qnaMapper.updateReplyCnt(vo.getQno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long qno) {

		return mapper.getListWithPaging(cri, qno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long qno) {
		return new ReplyPageDTO(
				mapper.getCountByQno(qno),
				mapper.getListWithPaging(cri, qno));
	}
}

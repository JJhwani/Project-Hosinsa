package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ReplyPageDTO;
import com.hosinsa.domain.ReplyVO;
import com.hosinsa.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {

		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long qno) {

		return mapper.read(qno);
	}

	@Override
	public int modify(ReplyVO vo) {

		return mapper.update(vo);
	}

	@Override
	public int remove(Long qno) {

		return mapper.delete(qno);
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

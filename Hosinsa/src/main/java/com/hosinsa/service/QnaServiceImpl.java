package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.QnaVO;
import com.hosinsa.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper qnaMapper;

	@Override
	public void register(QnaVO qna) {
		qnaMapper.insertSelectKey(qna);
	}

	@Override
	public QnaVO get(Long pno) {
		return qnaMapper.read(pno);
	}

	@Override
	public boolean modify(QnaVO qna) {
		return qnaMapper.update(qna) == 1;
	}

	@Override
	public boolean remove(Long pno) {
		return qnaMapper.delete(pno) == 1;
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		return qnaMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return qnaMapper.getTotalCount(cri);
	}

}

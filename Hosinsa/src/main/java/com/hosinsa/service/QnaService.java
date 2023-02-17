package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.QnaVO;

public interface QnaService {
	public void register(QnaVO qna);

	public QnaVO get(Long pno);

	public boolean modify(QnaVO qna);

	public boolean remove(Long pno);

	public List<QnaVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
}

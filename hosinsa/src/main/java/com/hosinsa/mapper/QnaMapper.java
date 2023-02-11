package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.QnaVO;

public interface QnaMapper {

	public List<QnaVO> getList();

	public List<QnaVO> getListWithPaging(Criteria cri);

	public void insert(QnaVO qna);

	public void insertSelectKey(QnaVO qna);

	public QnaVO read(Long qno);

	public int delete(Long qno);

	public int update(QnaVO qna);

	public int getTotalCount(Criteria cri);

	public void updateReplyCnt(@Param("qno") Long qno, @Param("amount") int amount);
}

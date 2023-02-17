package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);

	public ReplyVO read(Long rno);

	public int delete(Long rno);

	public int update(ReplyVO vo);

	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("qno") Long qno);

	public int getCountByQno(Long qno);
}

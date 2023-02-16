package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getList();

	public List<NoticeVO> getListWithPaging(Criteria cri);

	public int insert(NoticeVO vo); //void

	public int insertSelectKey(NoticeVO vo); //integer

	public NoticeVO read(Long nno);

	public int delete(Long nno);

	public int update(NoticeVO vo);
	
	public int getTotalCount(Criteria cri);
	
	public int readCount(Long nno); //추가
	
}

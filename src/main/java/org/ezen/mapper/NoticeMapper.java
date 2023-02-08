package org.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.ezen.domain.Criteria;
import org.ezen.domain.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getList();

	public List<NoticeVO> getListWithPaging(Criteria cri);

	public int insert(NoticeVO vo);

	public int insertSelectKey(NoticeVO vo);

	public NoticeVO read(Long nno);

	public int delete(Long nno);

	public int update(NoticeVO vo);
}

package hosinsa.service;

import java.util.List;

import hosinsa.domain.ReviewVO;



public interface ReviewService {
	
	public void regiseter(ReviewVO vo);
	public ReviewVO get(Long bno);
	public boolean modify(ReviewVO vo);
	public boolean remove(Long bno);
	public List<ReviewVO> getList();

}

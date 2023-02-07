package hosinsa.domain;

import lombok.Data;

@Data
public class ProductVO {
	
	private String category; //카테고리 
	private String proname; //제품명
	private String proimgSmall; 
	private String proimgBig;
	private String brand; //브랜드
	private int pronum; //품번
	private int price; //가격
	private int stock; //재고
	private int proview; //조회수	

}

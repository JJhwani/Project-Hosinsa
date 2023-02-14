package com.hosinsa.domain;

import lombok.Data;

@Data
public class ReviewCriteria {
	
		private int pageNum;
		private int amount;
		
		private String type;
		private String keyword;
		
		public ReviewCriteria() {
			this(1,10);
		}
		
		public ReviewCriteria(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
		}
		
		public String[] getTypeArr() {
			return type == null ? new String[] {}: type.split("");
			
		}

}

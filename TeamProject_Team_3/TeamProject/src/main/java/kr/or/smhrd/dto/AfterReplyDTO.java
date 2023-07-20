package kr.or.smhrd.dto;

import lombok.Data;

@Data
public class AfterReplyDTO {
	private int grad_review_num;
	private int grad_num;
	private String grad_review_content;
	private String mem_id;
}

package kr.or.smhrd.dto;

import lombok.Data;

@Data
public class CommunityReplyDTO {
	private int com_review_num;
	private int com_num;
	private String mem_id;
	private String com_review_content;
}

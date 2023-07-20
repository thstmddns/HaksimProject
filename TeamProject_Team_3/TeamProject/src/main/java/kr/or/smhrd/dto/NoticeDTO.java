package kr.or.smhrd.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
	private int notice_num;
	
	private int admin_num;
	
	private String mem_id;
	
	private String notice_title;
	
	private String notice_content;
	
	private String notice_wdate;
	
	private String notice_update;
}

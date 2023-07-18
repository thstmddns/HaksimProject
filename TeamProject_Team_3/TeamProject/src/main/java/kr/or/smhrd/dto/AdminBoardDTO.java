package kr.or.smhrd.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminBoardDTO {
	// 관리자
	private int admin_num;
	private String mem_id;
	
	// 신고
	private int report_num;
	private String report_content;
	private String report_wdate;
	
	// 공지
	private int notice_num;
	private String notice_title;
	private String notice_content;
	private String notice_wdate;
	private String notice_update;
	
}

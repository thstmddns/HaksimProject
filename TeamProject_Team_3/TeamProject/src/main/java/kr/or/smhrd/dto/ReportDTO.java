package kr.or.smhrd.dto;

import java.time.LocalTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportDTO {
	private int report_num;
	private String mem_id;
	private String report_content;
	private String report_wdate;
	private String report_url;
	private String reportReply_url;
	private String board;
	private int grad_num;
	private int grad_review_num;
}

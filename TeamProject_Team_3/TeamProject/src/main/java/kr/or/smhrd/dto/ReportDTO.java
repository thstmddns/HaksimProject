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
	private String data_report_url;
	private String data_reportReply_url;
	private int grad_num;
	private String board;
	private int data_num;
	private int com_num;
	private int grad_review_num;
	private int data_review_num;
	private int com_review_num;
}

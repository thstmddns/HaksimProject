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
<<<<<<< HEAD
	private String reportReply_url;
	private String board;
	private int grad_num;
	private int grad_review_num;
=======
	private String report_board;
	private String report_board_num;
>>>>>>> 0474079d0e8d3ca7c2461289f2a277041d0dfeee
}

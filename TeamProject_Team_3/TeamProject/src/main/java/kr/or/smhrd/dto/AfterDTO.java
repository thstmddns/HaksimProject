package kr.or.smhrd.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AfterDTO {
	private int grad_num;
	private String grad_title;
	private String grad_content;
	private int grad_type;
	private String mem_id;
	private int grad_hit;
	private String grad_wdate;
	private String grad_update;
}

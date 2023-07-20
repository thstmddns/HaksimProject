package kr.or.smhrd.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityDTO {
	private int com_num;
	private String mem_id;
	private String com_title;
	private String com_content;
	private String com_type;
	private int com_hit;
	private String com_wdate;
	private String com_update;
}

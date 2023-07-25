package kr.or.smhrd.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class DataDTO {
	
	private int data_num;
	private String mem_id;
	private String data_title;
	private String data_content;
	private int data_hit;
	private String data_wdate;
	private String data_update;
	
	private List<String> delFile;
}
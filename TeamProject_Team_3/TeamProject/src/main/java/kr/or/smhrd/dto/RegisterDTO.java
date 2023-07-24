package kr.or.smhrd.dto;

import lombok.Data;

@Data
public class RegisterDTO {
	private String mem_id;
	private String mem_password;
	private String mem_type;
	private int mem_age;
	private String mem_email;
	private String mem_name;
	private String mem_wdate;
	private String mem_update;
	private int mem_ca;
	private int mem_auth;
}
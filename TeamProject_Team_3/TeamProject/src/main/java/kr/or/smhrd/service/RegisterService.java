package kr.or.smhrd.service;


import kr.or.smhrd.dto.RegisterDTO;

public interface RegisterService {
	//회원가입
	public int registerInsert(RegisterDTO dto);
	// 아이디 중복체크
	public int idCheck(String mem_id);
	// 로그인
	public RegisterDTO loginOk(String mem_id, String mem_password);
}

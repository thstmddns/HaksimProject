package kr.or.smhrd.dao;

import kr.or.smhrd.dto.RegisterDTO;

public interface RegisterDAO {
	// 회원가입
	public int registerInsert(RegisterDTO dto);
	// 아이디 체크
	public int idCheck(String mem_id);
	// 로그인
	public RegisterDTO loginOk(String mem_id, String mem_password);
	//아이디 찾기
	public RegisterDTO passwordSearch(RegisterDTO dto);
}

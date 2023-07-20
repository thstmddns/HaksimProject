package kr.or.smhrd.dao;

import kr.or.smhrd.dto.RegisterDTO;

public interface RegisterDAO {
	public int registerInsert(RegisterDTO dto);
	
	public int idCheck(String mem_id);
}

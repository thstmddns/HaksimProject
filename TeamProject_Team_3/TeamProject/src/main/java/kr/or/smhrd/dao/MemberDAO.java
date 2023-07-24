package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.RegisterDTO;

public interface MemberDAO {

	public List <RegisterDTO> getMemberList();

	public RegisterDTO getMember(String mem_id);

	public int memberEditOk(RegisterDTO dto);


}

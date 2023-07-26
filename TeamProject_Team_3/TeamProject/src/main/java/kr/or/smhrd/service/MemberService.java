package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.RegisterDTO;

public interface MemberService {

	public List <RegisterDTO> getMemberList();

	public RegisterDTO getMember(String mem_id);

	public int memberEditOk(RegisterDTO dto);


}

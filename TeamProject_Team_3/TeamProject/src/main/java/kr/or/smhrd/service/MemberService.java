package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.RegisterDTO;

public interface MemberService {

	List <RegisterDTO> getMemberList();

}

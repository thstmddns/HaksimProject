package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.RegisterDTO;

public interface MemberDAO {

	List <RegisterDTO> getMemberList();

}

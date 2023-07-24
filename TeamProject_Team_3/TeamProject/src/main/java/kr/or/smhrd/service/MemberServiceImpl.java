package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.MemberDAO;
import kr.or.smhrd.dto.RegisterDTO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO dao;
	
	@Override
	public List<RegisterDTO> getMemberList() {
		return dao.getMemberList();
	}

	@Override
	public RegisterDTO getMember(String mem_id) {
		// TODO Auto-generated method stub
		return dao.getMember(mem_id);
	}

	@Override
	public int memberEditOk(RegisterDTO dto) {
		// TODO Auto-generated method stub
		return dao.memberEditOk(dto);
	}

}

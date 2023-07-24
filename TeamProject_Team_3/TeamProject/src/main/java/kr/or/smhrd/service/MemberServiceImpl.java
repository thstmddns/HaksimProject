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

}
package kr.or.smhrd.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.RegisterDAO;
import kr.or.smhrd.dto.RegisterDTO;
@Service
public class RegisterServiceImpl implements RegisterService {
	
	@Inject
	RegisterDAO dao;
	
	@Override
	public int registerInsert(RegisterDTO dto) {
		return dao.registerInsert(dto);
	}
	@Override
	public int idCheck(String mem_id) {
		int cnt = dao.idCheck(mem_id);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	@Override
	public RegisterDTO loginOk(String mem_id, String mem_password) {
		return dao.loginOk(mem_id, mem_password);
	}
	@Override
	public RegisterDTO passwordSearch(RegisterDTO dto) {
		return dao.passwordSearch(dto);
	}
	@Override
	public RegisterDTO idSearchResult(RegisterDTO dto) {
		return dao.idSearchResult(dto);
	}

	
}

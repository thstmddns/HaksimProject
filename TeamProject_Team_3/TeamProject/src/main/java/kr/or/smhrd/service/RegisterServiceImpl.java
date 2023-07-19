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
	
}

package kr.or.smhrd.service;

import org.springframework.stereotype.Service;

import kr.or.smhrd.dto.RegisterDTO;

@Service
public interface RegisterService {
	public int registerInsert(RegisterDTO dto);
}

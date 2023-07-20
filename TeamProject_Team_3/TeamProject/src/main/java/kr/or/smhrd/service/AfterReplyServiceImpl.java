package kr.or.smhrd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.AfterReplyDAO;
import kr.or.smhrd.dto.AfterReplyDTO;

@Service
public class AfterReplyServiceImpl implements AfterReplyService {
	@Inject
	AfterReplyDAO dao;
	
	@Override
	public int aReplyInsert(AfterReplyDTO dto) {
		
		return dao.aReplyInsert(dto);
	}

	@Override
	public List<AfterReplyDTO> aReplySelect(int grad_num) {
		
		return dao.aReplySelect(grad_num);
	}

	@Override
	public int aReplyUpdate(AfterReplyDTO dto) {
		
		return dao.aReplyUpdate(dto);
	}

	@Override
	public int aReplyDelete(int grad_review_num) {
		
		return dao.aReplyDelete(grad_review_num);
	}

	
}

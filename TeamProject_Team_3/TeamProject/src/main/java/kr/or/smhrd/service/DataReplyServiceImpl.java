package kr.or.smhrd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.DataReplyDAO;
import kr.or.smhrd.dto.DataReplyDTO;

@Service
public class DataReplyServiceImpl implements DataReplyService {
	@Inject
	DataReplyDAO dao;
	
	@Override
	public int dReplyInsert(DataReplyDTO dto) {
		
		return dao.dReplyInsert(dto);
	}

	@Override
	public List<DataReplyDTO> dReplySelect(int data_num) {
		
		return dao.dReplySelect(data_num);
	}

	@Override
	public int dReplyUpdate(DataReplyDTO dto) {
		
		return dao.dReplyUpdate(dto);
	}

	@Override
	public int dReplyDelete(int data_review_num) {
		
		return dao.dReplyDelete(data_review_num);
	}
	
}

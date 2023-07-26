package kr.or.smhrd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.AfterDAO;
import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.AfterFileDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.ReportDTO;

@Service
public class AfterServiceImpl implements AfterService {
	
	@Inject
	AfterDAO dao;
	
	@Override
	public List<AfterDTO> getAfterList(PagingDTO pDTO) {
		
		return dao.getAfterList(pDTO);
	}

	@Override
	public int totalRecord(PagingDTO pDTO) {
		
		return dao.totalRecord(pDTO);
	}
	
	@Override
	public int afterInsert(AfterDTO dto) {
		
		return dao.afterInsert(dto);
	}
	
	
	@Override
	public int afterEdit(AfterDTO dto) {
		
		return dao.afterEdit(dto);
	}
	


	@Override
	public AfterDTO afterSelect(int grad_num) {
		
		return dao.afterSelect(grad_num);
	}

	@Override
	public void hitCount(int grad_num) {
		dao.hitCount(grad_num);
	}

	@Override
	public int reportInsert(ReportDTO Rdto) {
		
		return dao.reportInsert(Rdto);
	}

	@Override
	public int afterDelete(int grad_num, String mem_id) {
		
		return dao.afterDelete(grad_num, mem_id);
	}


	
}

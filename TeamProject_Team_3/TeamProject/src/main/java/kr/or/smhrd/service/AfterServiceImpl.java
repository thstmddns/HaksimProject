package kr.or.smhrd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.AfterDAO;
import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.AfterFileDTO;
import kr.or.smhrd.dto.PagingDTO;

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
	public int afterFileInsert(List<AfterFileDTO> fileList) {
		
		return dao.afterFileInsert(fileList);
	}

	
	@Override
	public int afterEdit(AfterDTO dto) {
		
		return dao.afterEdit(dto);
	}
	
	@Override
	public int afterDelete(int grad_num, String userid) {
		
		return dao.afterDelete(grad_num, userid);
	}

	@Override
	public int afterFileDelete(int grad_num) {
		
		return dao.afterFileDelete(grad_num);
	}

	@Override
	public AfterDTO afterSelect(int grad_num) {
		
		return dao.afterSelect(grad_num);
	}

	@Override
	public List<AfterFileDTO> afterFileSelect(int grad_num) {
		
		return dao.afterFileSelect(grad_num);
	}
	
	@Override
	public void hitCount(int grad_num) {
		dao.hitCount(grad_num);
	}

	
	
}

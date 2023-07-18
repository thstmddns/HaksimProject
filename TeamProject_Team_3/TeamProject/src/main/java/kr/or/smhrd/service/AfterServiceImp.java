package kr.or.smhrd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.AfterDAO;
import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.AfterFileDTO;

@Service
public class AfterServiceImp implements AfterService{
	@Autowired
	AfterDAO dao;
	
	@Override
	public List<AfterDTO> getAfterList() {
		return dao.getAfterList();
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
	public int afterDelete(int no, String userid) {
		
		return dao.afterDelete(no, userid);
	}

	@Override
	public int afterFileDelete(int no) {		
		return dao.afterFileDelete(no);
	}

	@Override
	public AfterDTO afterSelect(int no) {	
		return dao.afterSelect(no);
	}

	@Override
	public List<AfterFileDTO> afterFileSelect(int no) {
		return dao.afterFileSelect(no);
	}
	
	@Override
	public void hitCount(int grad_num) {
		dao.hitCount(grad_num);
	}
}

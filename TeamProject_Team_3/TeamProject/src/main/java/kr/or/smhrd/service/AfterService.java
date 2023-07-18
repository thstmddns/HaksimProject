package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.AfterFileDTO;

public interface AfterService {
	public List<AfterDTO> getAfterList();
	
	public AfterDTO afterSelect(int grad_num);
	
	public int afterInsert(AfterDTO dto);
	
	public int afterFileInsert(List<AfterFileDTO> fileList);
	
	public int afterEdit(AfterDTO dto);
	
	public int afterDelete(int grad_num, String userid);
	
	public int afterFileDelete(int grad_num);
	
	public List<AfterFileDTO> afterFileSelect(int grad_num);
	
	public void hitCount(int grad_num);
}

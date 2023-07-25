package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface AfterService {
	public List<AfterDTO> getAfterList(PagingDTO pDTO);
	
	public int totalRecord(PagingDTO pDTO);
	
	public AfterDTO afterSelect(int grad_num);
	
	public void hitCount(int grad_num);
	
	public int afterInsert(AfterDTO dto);
	
	public int afterEdit(AfterDTO dto);
	
	public int afterDelete(int grad_num);

}

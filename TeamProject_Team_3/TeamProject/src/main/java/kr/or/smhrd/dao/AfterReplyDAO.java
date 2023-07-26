package kr.or.smhrd.dao;



import java.util.List;

import kr.or.smhrd.dto.AfterReplyDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface AfterReplyDAO {
	
	public int aReplyInsert(AfterReplyDTO dto);
	
	public List<AfterReplyDTO> aReplySelect(int grad_num);
	
	public int aReplyUpdate(AfterReplyDTO dto);
	
	public int aReplyDelete(int grad_review_num);

	public int aReportInsert(ReportDTO Rdto);
}


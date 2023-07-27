package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.CommunityReplyDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface CommunityReplyDAO {
	
	//리플 삽입
	public int replyInsert(CommunityReplyDTO dto);
	
	 // 리플 조회 
	public List <CommunityReplyDTO> replySelect(int com_num);
	
	//리플 업데이트 
	public int replyUpdate(CommunityReplyDTO dto);
	
	// 리플 삭제 
	public int replyDelete(int com_num);

	public int sReportInsert(ReportDTO dto);
}

package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.CommunityDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface CommunityService {
	public List<CommunityDTO> boardList(PagingDTO pDTO);
	public int totalRecord(PagingDTO pDTO);
	public CommunityDTO getBoard(int com_num);
	public void hitCount(int com_num);
	public int boardDel(int com_num);
	public int communityEditOk(CommunityDTO dto);
	public int boardWriteOk(CommunityDTO dto);
	public int communityReportInsert(ReportDTO Rdto);
}

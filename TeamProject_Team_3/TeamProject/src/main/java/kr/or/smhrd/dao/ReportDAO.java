package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface ReportDAO {
	
	public List<ReportDTO> getReportList();
	
	
	public ReportDTO ReportBoardView(int no);
	
	
	public int ReportBoardDel(int no, String id);
	
	
	public ReportDTO ReportReplyView();
	
	
	public int ReportReplyDel(int no, String id);

	public int ReportDel(int no);

}

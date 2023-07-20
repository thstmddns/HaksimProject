package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface ReportService {
	// 신고 내역 리스트
	public List<ReportDTO> getReportList();
		
	// 신고 게시글 상세 조회
	public ReportDTO ReportBoardView(int no);
		
	// 신고 게시글 삭제
	public int ReportBoardDel(int no, String id);
		
	// 신고 댓글 상세 조회
	public ReportDTO ReportReplyView();
		
	// 신고 댓글 삭제 
	public int ReportReplyDel(int no, String id);
}

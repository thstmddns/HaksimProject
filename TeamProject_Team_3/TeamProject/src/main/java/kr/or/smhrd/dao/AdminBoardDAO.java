package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface AdminBoardDAO {
	// 학생 리스트 출력 : String -> MemberDTO
	public List<String> getMemberList();
	
	// 학생 정보 조회 : void -> MemberDTO 
	public void getMember();
	
	// 학생 정보 수정 : 파라미터 -> MemberDTO dto
	public int memberUpdate();
	
	// 학생 정보 삭제
	public int memberDel(int no, String id);
	
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
	
	// 공지사항 리스트
	public List<NoticeDTO> getNoticeList();
	
	// 공지사항 작성
	public int NoticeWriteOk(NoticeDTO dto);
	
	// 공지사항 수정
	public int NoticeEditOk(NoticeDTO dto);
	
	// 공시사항 삭제
	public int NoticeDel(int no, String id);
}

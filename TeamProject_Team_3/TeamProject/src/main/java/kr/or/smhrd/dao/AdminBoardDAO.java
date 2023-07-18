package kr.or.smhrd.dao;

public interface AdminBoardDAO {
	// 신고 내역 리스트
	public void getReportList();
	
	// 신고 게시글 상세 조회
	public void ReportBoardView();
	
	// 신고 게시글 삭제
	public void ReportBoardDel();
	
	// 신고 댓글 상세 조회
	public void ReportReplyView();
	
	// 신고 댓글 삭제
	public void ReportReplyDel();
	
	// 공지사항 리스트
	public void getNoticeList();
	
	// 공지사항 작성
	public void NoticeWriteOk();
	
	// 공지사항 수정
	public void NoticeEditOk();
	
	// 공시사항 삭제
	public void NoticeDel();
}

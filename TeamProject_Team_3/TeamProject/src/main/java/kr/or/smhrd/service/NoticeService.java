package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface NoticeService {
	// 공지사항 리스트
	public List<NoticeDTO> getNoticeList();
		
	// 공지사항 작성
	public int NoticeWriteOk(NoticeDTO dto);
		
	// 공지사항 수정
	public int NoticeEditOk(NoticeDTO dto);
		
	// 공시사항 삭제
	public int NoticeDel(int no, String id);
}

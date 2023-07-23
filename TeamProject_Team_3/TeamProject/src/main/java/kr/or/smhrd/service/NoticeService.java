package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface NoticeService {

	// 글 등록
	public int NoticeWriteOk(NoticeDTO dto); 
		
	// 글 목록 조회 
	public List<NoticeDTO> NoticeList(PagingDTO pDTO);
	
	// 총 레코드 수
	public int totalRecord(PagingDTO pDTO);
	
	// 한개의 레코드 선택
	public NoticeDTO getNotice(int no);
		
	// 조회수 증가
	public void hitCount(int no);
		
	// 글수정
	public int NoticeEditOk(NoticeDTO dto);
		
	// 글 삭제
	public int NoticeDel(int no, String id);
}

package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.CommunityDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface CommunityDAO {
	
	//글 등록
	public int boardWriteOk(CommunityDTO dto); 
	
	
	// 글 목록 선택 
	public List<CommunityDTO> boardList(PagingDTO pDTO);
	
	// 총 레코드 수
	public int totalRecord(PagingDTO pDTO);
		
	
	//한개의 레코드 선택
	public CommunityDTO getBoard(int com_num);
	
	// 조회수 증가
	public void hitCount(int com_num);
	
	
	// 글수정
	public int communityEditOk(CommunityDTO dto);
	
	
	//글 삭제
	public int boardDel(int com_num);
	

	// 게시물 신고
	public int communityReportInsert(ReportDTO Rdto);
	
//	// 맛집 리스트 Topten추출
//	public List<CommunityDTO> boardListTen(PagingDTO pDTO);

}

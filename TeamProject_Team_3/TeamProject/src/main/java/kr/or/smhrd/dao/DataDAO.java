package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.DataDTO;
import kr.or.smhrd.dto.DataFileDTO;
import kr.or.smhrd.dto.DataReplyDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface DataDAO {
	// 글 등록
	public int dataWriteOk(DataDTO dto); 
	
	// 글 목록 선택 
	public List<DataDTO> dataList(PagingDTO pDTO);
	
	// 총 레코드 수
	public int dTotalRecord(PagingDTO pDTO);
	
	// 한개의 레코드 선택
	public DataDTO getBoard(int data_num);
	
	// 조회수 증가
	public void hitCount(int data_num);
	
	// 글수정
	public int dataUpdate(DataDTO dto);
	
	// 글 삭제
	public int dataDelete(int data_num, String mem_id);

	// 파일명 등록
		public int dataFileInsert(List<DataFileDTO> fileList);
	// 첨부파일목록 삭제
		public int dataFileDelete(int data_num);
		// 해당글의 첨부파일 선택
		public List<DataFileDTO> dataFileSelect (int data_num);
		// 글등록
		public int dataInsert(DataDTO dto);
		
		// 게시물 신고
	public int dReportInsert(ReportDTO Rdto);
		
}
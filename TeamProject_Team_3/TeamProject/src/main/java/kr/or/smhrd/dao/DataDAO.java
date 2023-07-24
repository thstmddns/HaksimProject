package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.DataDTO;
import kr.or.smhrd.dto.DataFileDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface DataDAO {
	// 글 등록
	public int dataWriteOk(DataDTO dto); 
	
	// 글 목록 선택 
	public List<DataDTO> dataList(PagingDTO pDTO);
	
	// 총 레코드 수
	public int totalRecord(PagingDTO pDTO);
	
	// 한개의 레코드 선택
	public DataDTO getBoard(int data_num);
	
	// 조회수 증가
	public void hitCount(int data_num);
	
	// 글수정
	public int dataEdit(DataDTO dto);
	
	// 글 삭제
	public int dataDelete(int data_num);
	
	// 첨부파일
	public int dataFileDelete(int data_num);
	
	public List<DataFileDTO> dataFileSelect (int data_num);

	public int dataFileInsert(List<DataFileDTO> fileList);
	
}
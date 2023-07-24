package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.DataDAO;
import kr.or.smhrd.dto.DataDTO;
import kr.or.smhrd.dto.DataReplyDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface DataService {
	public List<DataDTO> dataList(PagingDTO pDTO);
	public int totalRecord(PagingDTO pDTO);
	public void hitCount(int data_num);
	public DataDTO getBoard(int data_num);
	public int dataDelete(int data_num);

}
	
	/*
	 * // 글선택 public DataDTO dataSelect(int data_num); // 파일명 등록 public int
	 * dataFileInsert(List<DataFileDTO> fileList); // 글수정 public int
	 * dataUpdate(DataDTO dto); // 첨부파일목록 삭제 public int dataFileDelete(int
	 * data_num); // 해당글의 첨부파일 선택 public List<DataFileDTO> dataFileSelect (int
	 * data_num);
	 */


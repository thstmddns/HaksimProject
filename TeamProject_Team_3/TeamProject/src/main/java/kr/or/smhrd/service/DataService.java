package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.DataDAO;
import kr.or.smhrd.dto.DataDTO;
import kr.or.smhrd.dto.DataFileDTO;
import kr.or.smhrd.dto.DataReplyDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface DataService {
	public List<DataDTO> dataList(PagingDTO pDTO);
	public int dTotalRecord(PagingDTO pDTO);
	public void hitCount(int data_num);
	public DataDTO getBoard(int data_num);
	public int dataDelete(int data_num, String mem_id);
	// 파일명 등록
			public int dataFileInsert(List<DataFileDTO> fileList);
	// 첨부파일목록 삭제
			public int dataFileDelete(int data_num);
	// 해당글의 첨부파일 선택
			public List<DataFileDTO> dataFileSelect (int data_num);
	// 글등록
			public int dataInsert(DataDTO dto);
			public int dataUpdate(DataDTO dto);	
			public int dReportInsert(ReportDTO Rdto);
}


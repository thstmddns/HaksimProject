package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.DataDAO;
import kr.or.smhrd.dto.DataDTO;
import kr.or.smhrd.dto.DataFileDTO;
import kr.or.smhrd.dto.DataReplyDTO;
import kr.or.smhrd.dto.PagingDTO;

@Service
public class DataServiceImp implements DataService{
	
	@Autowired
	DataDAO dao;

	@Override
	public List<DataDTO> dataList(PagingDTO pDTO) {
		return dao.dataList(pDTO);
	}

	@Override
	public int totalRecord(PagingDTO pDTO) {
		return dao.totalRecord(pDTO);
	}

	@Override
	public void hitCount(int data_num) {
		 dao.hitCount(data_num);
		
	}

	@Override
	public DataDTO getBoard(int data_num) {
		return dao.getBoard(data_num);
	}



	@Override
	public int dataFileInsert(List<DataFileDTO> fileList) {
		
		return dao.dataFileInsert(fileList);
	}

	@Override
	public int dataFileDelete(int data_num) {
		
		return dao.dataFileDelete(data_num);
	}

	@Override
	public List<DataFileDTO> dataFileSelect(int data_num) {
		
		return dao.dataFileSelect(data_num);
	}

	@Override
	public int dataInsert(DataDTO dto) {
		
		return dao.dataInsert(dto);
	}

	@Override
	public int dataUpdate(DataDTO dto) {
		return dao.dataUpdate(dto);
	}

	@Override
	public int dataDelete(int data_num, String mem_id) {
		
		return dao.dataDelete(data_num, mem_id);
	}
	
}

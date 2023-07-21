package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.DataDAO;
import kr.or.smhrd.dto.DataDTO;
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
	public int dataDelete(int data_num) {
		return dao.dataDelete(data_num);
	}

	
}

package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.DataDAO;
import kr.or.smhrd.dto.DataDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface DataService {
	public List<DataDTO> dataList(PagingDTO pDTO);
	public int totalRecord(PagingDTO pDTO);
	public void hitCount(int data_num);
	public DataDTO getBoard(int data_num);
	public int dataDelete(int data_num);

}
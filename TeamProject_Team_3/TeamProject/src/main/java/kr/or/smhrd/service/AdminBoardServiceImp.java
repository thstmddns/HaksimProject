package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.AdminBoardDAO;
import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.ReportDTO;

@Service
public class AdminBoardServiceImp implements AdminBoardService {
	@Autowired
	AdminBoardDAO dao;
	

	
}

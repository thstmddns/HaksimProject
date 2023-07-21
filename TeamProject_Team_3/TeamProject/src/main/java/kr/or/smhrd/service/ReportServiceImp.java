package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.ReportDAO;
import kr.or.smhrd.dto.ReportDTO;

@Service
public class ReportServiceImp implements ReportService {
	@Autowired
	ReportDAO dao;
	
	@Override
	public List<ReportDTO> getReportList() {
		// TODO Auto-generated method stub
		return dao.getReportList();
	}

	@Override
	public ReportDTO ReportBoardView(int no) {
		// TODO Auto-generated method stub
		return dao.ReportBoardView(no);
	}

	@Override
	public int ReportBoardDel(int no, String id) {
		// TODO Auto-generated method stub
		return dao.ReportBoardDel(no, id);
	}

	@Override
	public ReportDTO ReportReplyView() {
		// TODO Auto-generated method stub
		return dao.ReportReplyView();
	}

	@Override
	public int ReportReplyDel(int no, String id) {
		// TODO Auto-generated method stub
		return dao.ReportReplyDel(no, id);
	}

}

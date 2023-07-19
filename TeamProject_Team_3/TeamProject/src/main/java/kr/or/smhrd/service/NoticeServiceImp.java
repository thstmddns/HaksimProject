package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.NoticeDAO;
import kr.or.smhrd.dto.NoticeDTO;

@Service
public class NoticeServiceImp implements NoticeService {
	@Autowired
	NoticeDAO dao;
	
	@Override
	public List<NoticeDTO> getNoticeList() {
		// TODO Auto-generated method stub
		return dao.getNoticeList();
	}

	@Override
	public int NoticeWriteOk(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return dao.NoticeWriteOk(dto);
	}

	@Override
	public int NoticeEditOk(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return dao.NoticeEditOk(dto);
	}

	@Override
	public int NoticeDel(int no, String id) {
		// TODO Auto-generated method stub
		return dao.NoticeDel(no, id);
	}

}

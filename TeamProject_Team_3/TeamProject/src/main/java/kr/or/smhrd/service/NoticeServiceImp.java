package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.NoticeDAO;
import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.PagingDTO;

@Service
public class NoticeServiceImp implements NoticeService {
	@Autowired
	NoticeDAO dao;

	@Override
	public int NoticeWriteOk(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return dao.NoticeWriteOk(dto);
	}

	@Override
	public List<NoticeDTO> NoticeList(PagingDTO pDTO) {
		// TODO Auto-generated method stub
		return dao.NoticeList(pDTO);
	}

	@Override
	public int totalRecord(PagingDTO pDTO) {
		// TODO Auto-generated method stub
		return dao.totalRecord(pDTO);
	}

	@Override
	public NoticeDTO getNotice(int no) {
		// TODO Auto-generated method stub
		return dao.getNotice(no);
	}

	@Override
	public void hitCount(int no) {
		// TODO Auto-generated method stub
		dao.hitCount(no);
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

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
	public List<NoticeDTO> getNoticeList() {
		// TODO Auto-generated method stub
		return dao.getNoticeList();
	}

	@Override
	public NoticeDTO selectNotice(int no) {
		// TODO Auto-generated method stub
		return dao.selectNotice(no);
	}

	@Override
	public int NoticeWriteOk(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return dao.NoticeWriteOk(dto);
	}

	@Override
	public int NoticeEdit(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return dao.NoticeEdit(dto);
	}

	@Override
	public int NoticeDel(int no, String id) {
		// TODO Auto-generated method stub
		return dao.NoticeDel(no, id);
	}

	@Override
	public void hitCount(int no) {
		// TODO Auto-generated method stub
		dao.hitCount(no);
	}

	@Override
	public int totalRecord(PagingDTO pDTO) {
		// TODO Auto-generated method stub
		return dao.totalRecord(pDTO);
	}
	

}

package kr.or.smhrd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.CommunityDAO;
import kr.or.smhrd.dto.CommunityDTO;
import kr.or.smhrd.dto.PagingDTO;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Inject
	CommunityDAO dao;

	@Override
	public List<CommunityDTO> boardList(PagingDTO pDTO) {
		
		return dao.boardList(pDTO);
	}

	@Override
	public int totalRecord(PagingDTO pDTO) {
		
		return dao.totalRecord(pDTO);
	}
	// 상세보기
	@Override
	public CommunityDTO getBoard(int com_num) {
		return dao.getBoard(com_num);
	}
	//조회수
	@Override
	public void hitCount(int com_num) {
		dao.hitCount(com_num);
		
	}

	@Override
	public int boardDel(int com_num) {
		return dao.boardDel(com_num);
	}

}


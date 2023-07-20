package kr.or.smhrd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.CommunityDAO;
import kr.or.smhrd.dto.CommunityDTO;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Inject
	CommunityDAO dao;

	@Override
	public List<CommunityDTO> boardList() {
		
		return dao.boardList();
	}
}

package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.CommunityDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface CommunityService {
	public List<CommunityDTO> boardList(PagingDTO pDTO);
	public int totalRecord(PagingDTO pDTO);
	public CommunityDTO getBoard(int com_num);
	public void hitCount(int com_num);
}

package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.CommunityDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface CommunityService {
	public List<CommunityDTO> boardList(PagingDTO pDTO);
	public int totalRecord(PagingDTO pDTO);
}

package kr.or.smhrd.service;

import java.util.List; 

import kr.or.smhrd.dto.CommunityReplyDTO;

public interface CommunityReplyService {
	public List <CommunityReplyDTO> replySelect(int com_num);
	
}

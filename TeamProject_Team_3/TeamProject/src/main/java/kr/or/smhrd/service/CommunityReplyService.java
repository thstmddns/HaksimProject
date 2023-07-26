package kr.or.smhrd.service;

import java.util.List; 

import kr.or.smhrd.dto.CommunityReplyDTO;

public interface CommunityReplyService {
	public List <CommunityReplyDTO> replySelect(int com_num);
	public int replyDelete(int com_num);
	public int replyUpdate(CommunityReplyDTO dto);
	public int replyInsert(CommunityReplyDTO dto);
	
}

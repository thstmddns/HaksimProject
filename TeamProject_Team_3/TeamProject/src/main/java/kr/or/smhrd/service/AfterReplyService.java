package kr.or.smhrd.service;


import java.util.List;

import kr.or.smhrd.dto.AfterReplyDTO;

public interface AfterReplyService {
	public int aReplyInsert(AfterReplyDTO dto);
	public List<AfterReplyDTO> aReplySelect(int grad_num);
	public int aReplyUpdate(AfterReplyDTO dto);
	public int aReplyDelete(int grad_review_num);
}

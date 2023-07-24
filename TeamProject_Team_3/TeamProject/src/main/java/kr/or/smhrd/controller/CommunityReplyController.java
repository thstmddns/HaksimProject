package kr.or.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.smhrd.dto.CommunityReplyDTO;
import kr.or.smhrd.service.CommunityReplyService;

@RestController
public class CommunityReplyController {
	@Autowired
	CommunityReplyService service;

	// 댓글 목록
	@GetMapping("/communityReply/replyList")
	public List<CommunityReplyDTO> replyList(int com_num) {

	return service.replySelect(com_num);
	}
	 @GetMapping("/communityReply/replyDel")
	  public String replyDel(int com_review_num) {
	  return String.valueOf(service.replyDelete(com_review_num));
	 } 
}

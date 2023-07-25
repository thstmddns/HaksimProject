package kr.or.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.smhrd.dto.CommunityReplyDTO;
import kr.or.smhrd.service.CommunityReplyService;

@RestController
public class CommunityReplyController {
	@Autowired
	CommunityReplyService service;
	
	@PostMapping("/communityReply/replyWrite")
	public String replyWrite(CommunityReplyDTO dto, HttpSession session) {
	      
	      dto.setMem_id((String)session.getAttribute("logId"));
	      
	      System.out.println(dto.toString());
	      int result = service.replyInsert(dto);
	      
	      System.out.println(dto.getMem_id());
	      
	      return result+""; 
	   }
	
	// 댓글 목록
	@GetMapping("/communityReply/replyList")
	public List<CommunityReplyDTO> replyList(int com_num) {

		return service.replySelect(com_num);
	}
	 
	@GetMapping("/communityReply/replyDel")
	  public String replyDel(int com_review_num) {
	  return String.valueOf(service.replyDelete(com_review_num));
	 } 
	 
	@PostMapping("/communityReply/replyEditOk")
	public String replyEditOk(CommunityReplyDTO dto) {
		return String.valueOf(service.replyUpdate(dto));
	}
}

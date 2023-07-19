package kr.or.smhrd.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.smhrd.dto.AfterReplyDTO;
import kr.or.smhrd.service.AfterReplyService;

@RestController
public class AfterReplyController {
	@Autowired
	AfterReplyService service;
	
	// 댓글 등록
	@PostMapping("/afterReply/replyWrite")
	public String replyWrite(AfterReplyDTO dto, HttpSession session) {
		// session 글쓴이 구하기
		dto.setMem_id((String)session.getAttribute("logId"));
		
		int result = service.aReplyInsert(dto);
	
		return result+""; 
	}
	
	// 댓글 목록
	@GetMapping("/afterReply/replyList")
	public List<AfterReplyDTO> replyList(int grad_num) {   // 원글 글 번호
	
		return service.aReplySelect(grad_num);	
	}
	
	// 댓글 수정(DB:update)
	@PostMapping("/afterReply/replyEditOk")
	public String replyEditOk(AfterReplyDTO dto) {
		return String.valueOf(service.aReplyUpdate(dto));
	}
	
	@GetMapping("/afterReply/replyDel")
	public String replyDel(int grad_review_num) {
		return String.valueOf(service.aReplyDelete(grad_review_num));
	}
}

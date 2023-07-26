package kr.or.smhrd.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.smhrd.dto.AfterReplyDTO;
import kr.or.smhrd.dto.ReportDTO;
import kr.or.smhrd.service.AfterReplyService;

@RestController
public class AfterReplyController {

	@Autowired
	AfterReplyService service;
	
	
	@PostMapping("/afterReply/replyWrite")
	public String replyWrite(AfterReplyDTO dto, HttpSession session) {
		
		dto.setMem_id((String)session.getAttribute("logId"));
		
		System.out.println(dto.toString());
		int result = service.aReplyInsert(dto);
		
		System.out.println(dto.getMem_id());
		
		return result+""; 
	}
	

	@GetMapping("/afterReply/replyList")
	public List<AfterReplyDTO> replyList(int grad_num) {   
	
		return service.aReplySelect(grad_num);	
	}
	
	
	@PostMapping("/afterReply/replyEditOk")
	public String replyEditOk(AfterReplyDTO dto) {
		return String.valueOf(service.aReplyUpdate(dto));
	}
	
	@GetMapping("/afterReply/replyDel")
	public String replyDel(int grad_review_num) {
		return String.valueOf(service.aReplyDelete(grad_review_num));
	}
	
	@PostMapping("/afterReply/afterReplyReportOk") 
	@ResponseBody
	public String afterReplyReportOk(ReportDTO dto, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
	  dto.setMem_id((String)session.getAttribute("logId"));
	
	  
	  int result = service.aReportInsert(dto);
	  
	  return result+""; 
	}
}


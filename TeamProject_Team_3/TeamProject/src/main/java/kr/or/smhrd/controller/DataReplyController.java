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

import kr.or.smhrd.dto.DataReplyDTO;
import kr.or.smhrd.dto.ReportDTO;
import kr.or.smhrd.service.DataReplyService;

@RestController
public class DataReplyController {
   @Autowired
   DataReplyService service;
   
   
   @PostMapping("/dataReply/replyWrite")
   public String replyWrite(DataReplyDTO dto, HttpSession session) {
      
      dto.setMem_id("King");
      
      System.out.println(dto.toString());
      int result = service.dReplyInsert(dto);
      
      System.out.println(dto.getMem_id());
      
      return result+""; 
   }
   

   @GetMapping("/dataReply/replyList")
   public List<DataReplyDTO> replyList(int data_num) {   
      return service.dReplySelect(data_num);   
   }
   
   
   @PostMapping("/dataReply/replyEditOk")
   public String replyEditOk(DataReplyDTO dto) {
	      return String.valueOf(service.dReplyUpdate(dto));
   }
   
   @GetMapping("/dataReply/replyDel")
   public String replyDel(int data_review_num) {
      return String.valueOf(service.dReplyDelete(data_review_num));
   }
   
   @PostMapping("/dataReply/dataReplyReportOk") 
	@ResponseBody
	public String afterReplyReportOk(ReportDTO dto, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
	  dto.setMem_id((String)session.getAttribute("logId"));
	
	  
	  int result = service.dtReportInsert(dto);
	  
	  return result+""; 
	}
}
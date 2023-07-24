package kr.or.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.RegisterDTO;
import kr.or.smhrd.dto.ReportDTO;
import kr.or.smhrd.service.MemberService;
import kr.or.smhrd.service.NoticeService;
import kr.or.smhrd.service.RegisterService;
import kr.or.smhrd.service.ReportService;

@RestController
@RequestMapping("/admin")
public class AdminBoardController {

	@Autowired 
	MemberService mService; 
	
	@Autowired
	ReportService rService;
	
	@Autowired
	NoticeService nService;
	
	@GetMapping("/adminList")
	public ModelAndView boardList(PagingDTO pDTO) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("member", mService.getMemberList());

		mav.addObject("report",rService.getReportList());

		mav.addObject("notice",nService.NoticeList(pDTO));
		
		mav.setViewName("admin/adminBoard");
		
		return mav;
	}

	@GetMapping("/memberView")
	public ModelAndView memberView(String id ) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("member", mService.getMember(id));
		
		mav.setViewName("admin/memberView");
		
		return mav;
	}
	
	@GetMapping("/memberEdit")
	public ModelAndView memberEdit(String id) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto", mService.getMember(id));		
		
		mav.setViewName("admin/memberEdit");
		
		return mav;
	}
	
	@PostMapping("/memberEditOk")
	public ModelAndView memberEditOk(RegisterDTO dto) {
		int result = mService.memberEditOk(dto);

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto", dto);
		
		if(result > 0) {
			mav.setViewName("redirect: memberView");			
		}else {			
			mav.setViewName("redirect: memberEdit");
		}
					
		return mav;
	}
}

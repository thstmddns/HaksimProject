package kr.or.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.smhrd.service.NoticeService;

@RestController
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService service;
	
	@GetMapping("/noticeList")
	public ModelAndView NoticeList() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("notice", service.getNoticeList());
		
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
}

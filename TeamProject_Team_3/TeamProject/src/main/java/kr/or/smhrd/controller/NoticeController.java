package kr.or.smhrd.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.service.NoticeService;

@RestController
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService service;
	
	@GetMapping("/noticeList")
	public ModelAndView NoticeList(PagingDTO pDTO) {
		pDTO.setTotalRecord(service.totalRecord(pDTO));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice", service.getNoticeList());
		mav.addObject("pDTO", pDTO);
		
		mav.setViewName("notice/noticeList");	
		return mav;
	}
	
	@GetMapping("/noticeWrite")
	public ModelAndView noticeWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/noticeWrite");
		return mav;
	}
	
	@PostMapping("/noticeWriteOk")
	public ModelAndView noticeWriteOk(HttpServletRequest request, NoticeDTO dto ) {
		dto.setMem_id((String) request.getSession().getAttribute("id"));
		
		ModelAndView mav = new ModelAndView();
		
		try {
			int result = service.NoticeWriteOk(dto);
			mav.setViewName("redirect:noticeList");
		}catch(Exception e){
			e.printStackTrace();
			mav.setViewName("notice/noticeWriteResult");
		}
		
		return mav;
	}
	
	
	@GetMapping("/noticeView/{no}")
	public ModelAndView dataView(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice", service.selectNotice(no));
		service.hitCount(no);
		mav.setViewName("notice/noticeView");
			
		return mav;
	}
	
	@GetMapping("/noticeEdit")
	public ModelAndView noticeEdit(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice", service.selectNotice(no));
		mav.setViewName("notice/noticeEdit");
		
		return mav;
	}
	
	
}

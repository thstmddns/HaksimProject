package kr.or.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.ReportDTO;
import kr.or.smhrd.service.NoticeService;
import kr.or.smhrd.service.ReportService;

@RestController
@RequestMapping("/admin")
public class AdminBoardController {
/* 
	@Autowired 
	RegisterService mService; 
*/
	
	@Autowired
	ReportService rService;
	
	@Autowired
	NoticeService nService;
	
	// 관리자 페이지로 이동
	@GetMapping("/adminList")
	public ModelAndView boardList(PagingDTO pDTO) {
		ModelAndView mav = new ModelAndView();
		
		// 학생 리스트
		/* mav.addObject("member", mService.getMemberList()); */
		
		// 신고 내역 리스트
		mav.addObject("report",rService.getReportList());
		
		// 공지사항 리스트
		mav.addObject("notice",nService.NoticeList(pDTO));
		
		mav.setViewName("admin/adminBoard");
		
		return mav;
	}
	
	// 신고 게시글 상세 조회
	
	
	// 신고 게시글 삭제
	
	
	// 신고 댓글 상세 조회
	
	
	// 신고 댓글 삭제

	
	// 공지사항 작성
	
	
	// 공지사항 수정
		
	
	// 공시사항 삭제

	
}

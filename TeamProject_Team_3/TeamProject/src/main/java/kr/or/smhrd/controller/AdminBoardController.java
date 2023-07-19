package kr.or.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.smhrd.service.AdminBoardService;

@RestController
@RequestMapping("/admin")
public class AdminBoardController {
	@Autowired
	AdminBoardService service;
	
	// 관리자 페이지로 이동
	@GetMapping("/adminList")
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminBoard");
		// 학생 리스트
		
		// 신고 내역 리스트
		
		// 공지사항 리스트
		
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

package kr.or.smhrd.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	
	// 게시판으로 이동
		@GetMapping("/noticeList")
		public ModelAndView noticeList(PagingDTO pDTO) {	
			pDTO.setTotalRecord(service.totalRecord(pDTO));
			
			List <NoticeDTO> list = service.NoticeList(pDTO);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("notice", list);		
			mav.addObject("pDTO", pDTO);
			mav.setViewName("notice/noticeList");
			
			return mav;
		}

		@GetMapping("/noticeWrite")
		public ModelAndView boardWrite() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("notice/noticeWrite");
			
			return mav;
		}
		
		@PostMapping("/noticeWriteOk")
		public ModelAndView boardWriteOk(NoticeDTO dto, HttpServletRequest req) {
			dto.setMem_id("kim");
			
			ModelAndView mav = new ModelAndView();
			
			System.out.println(dto.toString());
			try {			
				int insert = service.NoticeWriteOk(dto);
				mav.setViewName("redirect:noticeList");
			}catch (Exception e) {
				System.out.println("에러 발생 >> "+e.getMessage());
				mav.setViewName("notice/noticeWriteResult");
			}
			
			return mav;
		}
		
		// 글 내용 보기
		@GetMapping("/noticeView")
		public ModelAndView boardView(int no, PagingDTO pDTO) {
			service.hitCount(no);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("dto", service.getNotice(no));
			mav.addObject("pDTO", pDTO);	// 페이지 정보를 추가
			
			mav.setViewName("notice/noticeView");
			
			return mav;
		}
		
		// 글수정으로 이동
		@GetMapping("/noticeEdit")
		public ModelAndView boardEdit(int no, PagingDTO pDTO) {
			
			ModelAndView mav = new ModelAndView();		
			
			mav.addObject("dto",service.getNotice(no));
			mav.addObject("pDTO",pDTO);
			
			mav.setViewName("notice/noticeEdit");
			
			return mav;
		}
		
		@PostMapping("/noticeEditOk")
		public ModelAndView boardEditOk(NoticeDTO dto, PagingDTO pDTO, HttpSession session, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			System.out.println(dto.toString());
			
			try {
				int result = service.NoticeEditOk(dto);
				
				mav.setViewName("redirect:noticeView?no="+dto.getNotice_num());
			}catch(Exception e){
				e.printStackTrace();
				mav.setViewName("redirect:noticeEdit");
			}
			
			return mav;
		}
		
		// 글 삭제
		@GetMapping("/noticeDel")
		public ModelAndView boardDel(int no, HttpSession session) {
//			int result = service.NoticeDel(no,(String)session.getAttribute("logId"));
			int result = service.NoticeDel(no,"kim");
			ModelAndView mav = new ModelAndView();
			
			if(result > 0) {
				// 삭제 성공
				mav.setViewName("redirect:noticeList");
			}else {
				// 삭제 실패
				mav.addObject("no",no);
				mav.setViewName("redirect:noticeView");
				
			}
			
			return mav;
		}
}
package kr.or.smhrd.controller;

import java.nio.charset.Charset;
import java.util.List;

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
	
	@GetMapping("/noticeList")
	public ModelAndView boardList(PagingDTO pDTO) {	
		pDTO.setTotalRecord(service.totalRecord(pDTO));
			
		List <NoticeDTO> list = service.NoticeList(pDTO);
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice", list);		
		mav.addObject("pDTO", pDTO);
		mav.setViewName("notice/noticeList");
		System.out.println(list);
			
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
		int insert = 0 ;
		ModelAndView mav = new ModelAndView();
		
		dto.setNotice_num(dto.getNotice_num());
		dto.setMem_id("kim");
		//dto.setMem_id((String)req.getSession().getAttribute("logId"));
			
		System.out.println(dto);
		
		try {			
			insert = service.NoticeWriteOk(dto);
			System.out.println(insert);
			
			mav.setViewName("redirect:noticeList");
		}catch (Exception e) {
			System.out.println("에러 발생 >> "+e.getMessage());
			mav.setViewName("notice/noticeWriteResult");
		}
			
		return mav;	
			
	}
		
		// 글 내용 보기
		@GetMapping("/noticeView/{notice_num}")
		public ModelAndView boardView(@PathVariable("notice_num") int no) {
			ModelAndView mav = new ModelAndView();
			// 조회수 증가
			service.hitCount(no);
			
			mav.addObject("notice", service.getNotice(no));
			
			mav.setViewName("notice/noticeView");
			
			return mav;
		}
		
		// 글수정으로 이동
		@GetMapping("/noticeEdit")
		public ModelAndView boardEdit(int no, PagingDTO pDTO) {
			NoticeDTO dto = service.getNotice(no);
			
			ModelAndView mav = new ModelAndView();		
			mav.addObject("notice",dto);
			mav.addObject("pDTO",pDTO);
			
			mav.setViewName("notice/noticeEdit");
			
			return mav;
		}
		
		@PostMapping("/noticeEditOk")
		public ModelAndView boardEditOk(NoticeDTO dto, PagingDTO pDTO, HttpSession session) {
			dto.setMem_id((String)session.getAttribute("logId"));
			
			int result = service.NoticeEditOk(dto);
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("no", dto.getNotice_num());
			mav.addObject("nowPage", pDTO.getNowPage());
			mav.addObject("searchKey", pDTO.getSearchKey());
			mav.addObject("searchWord", pDTO.getSearchWord());
			
			if(result > 0) {
				// 수정 성공 -> 글내용으로
				mav.setViewName("redirect:noticeView");
			}else {
				// 수정 실패 -> 수정폼으로
				mav.setViewName("redirect:noticeEdit");
			}
			return mav;
		}
		
		// 글 삭제
		@GetMapping("/noticeDel")
		public ModelAndView boardDel(int no, HttpSession session) {
			int result = 0;
			result = service.NoticeDel(no,"kim");
			//result = service.NoticeDel(no,(String)session.getAttribute("logId"));
			
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

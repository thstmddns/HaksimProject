package kr.or.smhrd.controller;

import java.io.Console;
import java.io.File;
import java.lang.StackWalker.Option;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.AfterFileDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.service.AfterService;

@Controller
@RequestMapping("/after")
public class AfterController {
	@Autowired
	AfterService service;
	
	// 후기 글 목록
	@GetMapping("/afterList")
	public ModelAndView afterList(PagingDTO pDTO) {
		
		pDTO.setTotalRecord(service.totalRecord(pDTO));
		List<AfterDTO> list = service.getAfterList(pDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pDTO", pDTO);
		mav.setViewName("after/afterList");
		return mav;
	}
	
	@GetMapping("/afterWrite")
	public ModelAndView afterWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("after/afterWrite");
		return mav;
	}
	
	// 글쓰기 DB 기록
	@PostMapping("/afterWriteOk")
	public ResponseEntity<String> afterWriteOk(AfterDTO dto, HttpServletRequest request, @RequestParam("cate") String cate) {
		
		int grad_type = Integer.parseInt(cate);
		dto.setGrad_type(grad_type);
		dto.setMem_id("king");
		System.out.println(grad_type);
		//dto.setMem_id((String)request.getSession().getAttribute("logId"));
		
		int result = 0;
		try {
			result = service.afterInsert(dto);
		} catch (Exception e) {
			System.out.println("게시글 등록 예외 발생" + e.getMessage());
		}
				
		String tag = "<script>";
		if(result>0) {
			tag += "location.href='/smhrd/after/afterList';";
		}else { 
			tag += "alert('게시글 등록이 실패하였습니다.');";
			tag += "history.back();";
		}
			tag += "</script>";
				
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
			return new ResponseEntity<String>(tag, headers, HttpStatus.OK);
		}		
	
	// 게시글 세부 보기
	@GetMapping("/afterView/{grad_num}")
	public ModelAndView afterView(@PathVariable("grad_num") int grad_num) {
		
		ModelAndView mav = new ModelAndView();
		
		//service.hitCount(grad_num);
		
		mav.addObject("dto", service.afterSelect(grad_num));
		
		mav.setViewName("after/afterView");
		return mav;
	}
	
	
}

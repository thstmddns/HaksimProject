package kr.or.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.smhrd.dto.BoardDTO;
import kr.or.smhrd.dto.CommunityDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.service.BoardService;
import kr.or.smhrd.service.CommunityService;

@RestController
@RequestMapping("/community")
public class CommunityController {
	@Autowired
	CommunityService service;
	
	// 게시판으로 이동
	@GetMapping("/communityList")
	public ModelAndView communityList() {	

		// 1. 총 레코드 수 설정
		//pDTO.setTotalRecord(service.totalRecord(pDTO));
		
		// 2. DB data
		List <CommunityDTO> list = service.boardList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);		
		//mav.addObject("pDTO", pDTO);
		mav.setViewName("community/communityList");
		
		return mav;
	}
}	
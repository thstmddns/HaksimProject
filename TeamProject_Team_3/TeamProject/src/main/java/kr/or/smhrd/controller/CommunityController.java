package kr.or.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.CommunityDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	@Autowired
	CommunityService service;
	
	@GetMapping("/communityList")
	public ModelAndView communityList(PagingDTO pDTO, @ModelAttribute("com_type") Integer com_type) {	
		if(com_type == null) {
			com_type = 0;
		}
		pDTO.setCom_type(com_type);
		pDTO.setTotalRecord(service.totalRecord(pDTO));
		List <CommunityDTO> list = service.boardList(pDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);		
		mav.addObject("pDTO", pDTO);
		mav.setViewName("community/communityList");
		
		return mav;
	}
	
	@GetMapping("/communityWrite")
	   public ModelAndView communityWrite() {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("community/communityWrite");
	      return mav;
	   }
	// 수료생 게시글 등록
    @PostMapping("/communityWriteOk")
    public ModelAndView boardWriteOk(CommunityDTO dto, HttpSession session, RedirectAttributes rttr) {
       dto.setMem_id((String)session.getAttribute("logId"));   
       ModelAndView mav = new ModelAndView();
       try {
    	   rttr.addAttribute("com_type",dto.getCom_type());
    	   int result = service.boardWriteOk(dto);
          mav.setViewName("redirect:communityList");
       }catch(Exception e) {
          e.printStackTrace();
          mav.setViewName("community/communityResult");
       }
       return mav;
    }   
	// 게시글 세부 보기
	   @GetMapping("/communityView/{com_num}")
	   public ModelAndView afterView(@PathVariable("com_num") int com_num) {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      service.hitCount(com_num);
	      
	      mav.addObject("dto", service.getBoard(com_num));
	      
	      mav.setViewName("community/communityView");
	      return mav;
	   }
	   
	// 글수정으로 이동
		@GetMapping("/communityEdit")
		public ModelAndView communityEdit(int com_num, PagingDTO pDTO) {
			CommunityDTO dto = service.getBoard(com_num);
			
			ModelAndView mav = new ModelAndView();		
			mav.addObject("dto",dto);
			mav.addObject("pDTO",pDTO);
			
			mav.setViewName("community/communityEdit");
			
			return mav;
		}
		// 수료생 게시글 수정
	      @PostMapping("/communityEditOk")  
	      public ModelAndView communityEditOk(CommunityDTO dto, HttpSession session, HttpServletRequest request) {
	         
	         ModelAndView mav = new ModelAndView();
	         
	         try {
	            int result = service.communityEditOk(dto);
	            
	            mav.setViewName("redirect:communityView/"+dto.getCom_num());
	         }catch(Exception e){
	            e.printStackTrace();
	            mav.setViewName("redirect:communityEdit?com_num="+dto.getCom_num());
	         }
	         return mav;
	      }
	      
	      
		// 글 삭제
		@GetMapping("/boardDel")
		public ModelAndView boardDel(int com_num, HttpSession session,  PagingDTO dto, RedirectAttributes rttr) {
			int result = service.boardDel(com_num);
		
			rttr.addAttribute("com_type",dto.getCom_type());
			
			ModelAndView mav = new ModelAndView();
			
			if(result > 0) {
				// 삭제 성공
				mav.setViewName("redirect:communityList");
			}else {
				// 삭제 실패
				mav.addObject("",com_num);
				mav.setViewName("redirect:communityView");
				
			}
			
			return mav;
		}
}
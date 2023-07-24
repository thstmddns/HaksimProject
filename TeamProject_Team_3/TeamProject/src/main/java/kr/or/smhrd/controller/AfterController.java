package kr.or.smhrd.controller;

import java.io.Console;
import java.io.File;
import java.lang.StackWalker.Option;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.DataFileDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.service.AfterService;

@Controller
@RequestMapping("/after")
public class AfterController {
   @Autowired
   AfterService service;
   
   // 수료생 게시글 목록 조회
   @GetMapping("/afterList")
   public ModelAndView afterList(PagingDTO pDTO, @ModelAttribute("grad_type") Integer grad_type) {
      if(grad_type == null) {
         grad_type = 0;
      }
      pDTO.setGrad_type(grad_type);
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
   
   // 수료생 게시글 등록
      @PostMapping("/afterWriteOk")
      public ModelAndView afterWriteOk(HttpServletRequest request, AfterDTO dto, RedirectAttributes rttr) {
         
         dto.setMem_id("King");
         
         ModelAndView mav = new ModelAndView();
         try {
            rttr.addAttribute("grad_type",dto.getGrad_type());
            int result = service.afterInsert(dto);
            System.out.println(dto.toString());
            mav.setViewName("redirect:afterList");
         }catch(Exception e) {
            e.printStackTrace();
            mav.setViewName("after/afterResult");
         }
         return mav;
      }   
   
   // 수료생 게시글 상세 보기
   @GetMapping("/afterView/{grad_num}")
   public ModelAndView afterView(@PathVariable("grad_num") int grad_num) {
      
      ModelAndView mav = new ModelAndView();
      
      service.hitCount(grad_num);
      
      mav.addObject("dto", service.afterSelect(grad_num));
      
      mav.setViewName("after/afterView");
      return mav;
   }
   
   // 수료생 게시글 삭제
   @GetMapping("/afterDel")
   public ModelAndView afterDel(int grad_num, PagingDTO dto, RedirectAttributes rttr) {
      int result = service.afterDelete(grad_num);
      rttr.addAttribute("grad_type",dto.getGrad_type());
      
      ModelAndView mav = new ModelAndView();
      if(result>0) {
         mav.setViewName("redirect:afterList");
      }else {
         mav.addObject("grad_num", grad_num);
         mav.setViewName("redirect:afterView");
      }
      return mav;
   }
   
   //  수료생 게시글 수정폼
      @GetMapping("/afterEdit")
      public ModelAndView afterEdit(int grad_num) {
         ModelAndView mav = new ModelAndView();
         
         mav.addObject("dto", service.afterSelect(grad_num));
         
         mav.setViewName("after/afterEdit");
         return mav;
      }
      
      // 수료생 게시글 수정
      @PostMapping("/afterEditOk")  
      public ModelAndView afterEditOk(AfterDTO dto, HttpSession session, HttpServletRequest request) {
         
         ModelAndView mav = new ModelAndView();
         try {
            int result = service.afterEdit(dto);
            
            mav.setViewName("redirect:afterView/"+dto.getGrad_num());
         }catch(Exception e){
            e.printStackTrace();
            mav.setViewName("redirect:afterEdit?grad_num="+dto.getGrad_num());
         }
         return mav;
      }
      
      
}
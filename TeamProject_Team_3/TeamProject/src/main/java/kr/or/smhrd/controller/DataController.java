package kr.or.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.smhrd.dto.DataDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.service.DataService;

@Controller
@RequestMapping("/data")
public class DataController {
	
	@Autowired
	DataService service;
	
	   @GetMapping("/dataList")
	   public ModelAndView dataList(PagingDTO pDTO) {
	      
	      pDTO.setTotalRecord(service.totalRecord(pDTO));
	      List<DataDTO> list = service.dataList(pDTO);
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("list", list);
	      mav.addObject("pDTO", pDTO);
	      mav.setViewName("data/dataList");
	      return mav;
	   }
	
	@GetMapping("/dataWrite")
	public ModelAndView dataWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("data/dataWrite");
		return mav;
	}
	
/*	@GetMapping("/dataOpen")
	public ModelAndView dataOpen(int data_num) {
		  service.hitCount(data_num);
	         DataDTO dto = service.getBoard(data_num);
	         ModelAndView mav = new ModelAndView();
	         mav.addObject("dto", dto);
	         mav.setViewName("data/dataOpen");
	         return mav;*/
	
	   @GetMapping("/dataOpen/{data_num}")
	   public ModelAndView afterView(@PathVariable("data_num")  int data_num) {
	      ModelAndView mav = new ModelAndView();
	      service.hitCount(data_num);
	      mav.addObject("dto", service.getBoard(data_num));
	      mav.setViewName("data/dataOpen");
	      return mav;
	   }
	   
	   @GetMapping("/dataDel")
	   public ModelAndView dataDel (int data_num) {
		   int result = service.dataDelete(data_num);
		   
		   ModelAndView mav = new ModelAndView();
		   if(result>0) {
			   	mav.setViewName("redirect:dataList");
		   } else {
			   	mav.addObject("data_num", data_num);
			   	mav.setViewName("redirect:dataOpen");
		   }
		   return mav;
	   }
}
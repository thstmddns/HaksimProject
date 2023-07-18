package kr.or.smhrd.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.smhrd.service.AfterService;

@Controller
@RequestMapping("/after")
public class AfterController {
	@Autowired
	AfterService service;
	
	@GetMapping("/afterList")
	public String afterList(Model model) {
		model.addAttribute("list", service.getAfterList());
		return "after/afterList";
	}
	
	@GetMapping("/afterWrite")
	public ModelAndView afterWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("after/afterWrite");
		return mav;
	}
	

	@GetMapping("/afterView/{grad_num}")
	public ModelAndView afterView(@PathVariable("grad_num") int grad_num) {
		ModelAndView mav = new ModelAndView();
		
		service.hitCount(grad_num);
		
		mav.addObject("dto", service.afterSelect(grad_num));
		
		mav.addObject("fileList", service.afterFileSelect(grad_num));
		
		mav.setViewName("after/afterView");
		return mav;
	}
	

	@GetMapping("/afterEdit")
	public ModelAndView afterEdit(int no) {
		ModelAndView mav = new ModelAndView();
		/* mav.addObject("dto", service.dataSelect(no)); */
		/* mav.addObject("fileList", service.dataFileSelect(no)); */
		mav.setViewName("after/afterEdit");
		return mav;
	}
	

	
	private void fileDelete(String path, String filename) {
		try {
			File f = new File(path, filename);
			f.delete();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

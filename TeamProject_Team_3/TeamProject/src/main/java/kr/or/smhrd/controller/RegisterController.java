package kr.or.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.smhrd.dto.RegisterDTO;
import kr.or.smhrd.service.RegisterService;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	RegisterService service;
	
	//회원가입
	@GetMapping("/regForm")
	public String regForm() {
		return "register/regForm";
	}
	
	// 회원가입 체크
	@PostMapping("/registerOk")
	public ModelAndView registerOk(RegisterDTO dto) {
		System.out.println(dto.toString());
		int result = 0;
		try {
			result = service.registerInsert(dto);
		}catch(Exception e) {
			System.out.println("회원가입 실패....");		
		}
		ModelAndView mav = new ModelAndView();
		if(result > 0) {
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("register/registerResult");
		}
	return mav;
	}
	
	//아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("mem_id") String mem_id) {
		int cnt = service.idCheck(mem_id);
		return cnt;
	}
}

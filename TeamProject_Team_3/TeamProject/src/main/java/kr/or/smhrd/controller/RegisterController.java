package kr.or.smhrd.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	@Autowired
	JavaMailSenderImpl mailSender;
	
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
	
	// 로그인
	@GetMapping("/login")
	public String login() {
	   return "register/login";
	}

	// 로그인 확인
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String mem_id, String mem_password, HttpSession session) {
		RegisterDTO dto = service.loginOk(mem_id, mem_password);
		ModelAndView mav = new ModelAndView();
		if(dto!=null) {
			session.setAttribute("logId", dto.getMem_id());
			session.setAttribute("logType", dto.getMem_type());
			session.setAttribute("logCa", dto.getMem_ca());
			session.setAttribute("logStatus", "Y");
			 
			 mav.setViewName("redirect:/");
		}else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//비밀번호 찾기 (폼)
	@GetMapping("/passwordSearch")
	public String passwordSearchForm() {
		return "register/passwordSearch";
	}
	
	// 비밀번호 찾기
	@PostMapping("/passwordSearchOk")
	@ResponseBody
	public String passwordSearchOk(@RequestBody RegisterDTO dto) {
		//이름, 연락처가 일치하는 아이디와 이메일을 구한다. 
		RegisterDTO resultDTO = service.passwordSearch(dto);
		String resultTxt = "N";
		if(resultDTO!=null) { //일치하는 정보가 있을때
	 //이메일 보내기 
	try {   
		String subject = "비밀번호 찾기 결과";
		String content = "<div style='background:pink; border:1px solid #ddd; padding:50px; text-align:center'>";
		   
		content += "검색한 비밀번호는 :"+ resultDTO.getMem_password();
		content += "</div>";
		  
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		messageHelper.setFrom("smshrd@naver.com");
		messageHelper.setTo("smshrd@naver.com");
		messageHelper.setSubject(subject);
		messageHelper.setText("text/html; charset=UTF-8", content);
		
		mailSender.send(message);
		
		resultTxt = "Y";
		System.out.println(resultTxt);
	}catch(Exception e) {
		e.printStackTrace();  
	} 
	}else { //일치하는 정보가 없을때
		resultTxt = "N";
	}    
		return resultTxt;
	}
}
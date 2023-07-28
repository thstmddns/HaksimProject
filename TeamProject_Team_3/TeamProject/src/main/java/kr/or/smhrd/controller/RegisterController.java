package kr.or.smhrd.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableScheduling;
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

@EnableScheduling
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
			session.setAttribute("logAuth", dto.getMem_auth());
			session.setAttribute("logStatus", "Y");
			session.setAttribute("logAuth", dto.getMem_auth());
			
			 mav.setViewName("redirect:/");
		}else {
			mav.setViewName("register/loginResult");
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
	
	//아이디 찾기
	@GetMapping("/idSearchForm")
	public String idSearchForm() {
		System.out.println(1);
		return "register/idSearchForm";
		}
	
	@PostMapping("/idSearchResult")
	public ModelAndView idSearchResult(RegisterDTO dto) { 
		RegisterDTO resultDTO = service.idSearchResult(dto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", resultDTO);
		if(resultDTO!=null) { //일치하는 정보가 있을때
			mav.setViewName("register/idSearchResult");
		}else {
			mav.setViewName("register/idS");
		}
		return mav;
	}
	
	@GetMapping("/registerEdit")
	public ModelAndView registerEdit(HttpSession session){
		RegisterDTO dto = service.registerSelect((String)session.getAttribute("logId"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mem_id", dto);
		mav.setViewName("register/registerEdit");
		return mav;
	}
	
	@PostMapping("/registerEditOk")
	public ModelAndView registerEditOk(RegisterDTO dto, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			int result = service.memberEdit(dto);
			mav.setViewName("redirect: /smhrd");
		}catch(Exception e){
			e.printStackTrace();
			mav.setViewName("register/registerEditResult");
		}		
		return mav;
	}
	// 간식 요청
    @PostMapping("/sendSnackRequestEmail")
    @ResponseBody
    public String sendSnackRequestEmail() {
        String recipientEmail = "smshrd@naver.com"; // 실제 수신자 이메일 주소로 바꿔주세요.

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom("smshrd@naver.com"); // 본인의 이메일 주소로 바꿔주세요
            helper.setTo(recipientEmail);
            helper.setSubject("간식 요청");
            helper.setText("<div style='background:pink;  border:1px solid #ddd; padding:50px; text-align:center'>"
                    + "간식 요청이 도착했습니다!"
                    + "</div>", true);

            mailSender.send(message);
            return "이메일이 성공적으로 전송되었습니다!";
        } catch (MessagingException e) {
            e.printStackTrace();
            return "이메일 보내기 중 오류가 발생했습니다. 나중에 다시 시도해주세요.";
        }
    }
    
    
    public void attendRegister() {
        System.out.println(1);
        List<String> absenteesEmail = service.getAbsenteesEmail();

        for (String email : absenteesEmail) {
            sendAbsenteeEmail(email);
        }
    }

    // 미출석자에게 메일 보내는 메서드
    private void sendAbsenteeEmail(String email) {
    	System.out.println(1);
        try {
        	MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom("smshrd@naver.com"); // 본인의 이메일 주소로 바꿔주세요
            helper.setTo(email);
            helper.setSubject("출석 요청");
            helper.setText("<div style='background:pink;  border:1px solid #ddd; padding:50px; text-align:center'>"
                    + "귀하는 미출석자입니다. 지금 바로 지문을 찍어주시기 바랍니다."
                    + "</div>", true);

            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}


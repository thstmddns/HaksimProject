package kr.or.smhrd;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.service.AfterService;
import kr.or.smhrd.service.CommunityService;
import kr.or.smhrd.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	AfterService afterService;
	
	@Autowired
	CommunityService communityService;
	
	
	@GetMapping("/")
	public String home(Locale locale, Model model, PagingDTO pDTO) {		
		model.addAttribute("notice", noticeService.NoticeList(pDTO));
		
		
		return "home";
	}
	

}

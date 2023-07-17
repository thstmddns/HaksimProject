package kr.or.smhrd;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	// 매핑되기 전에 호출되는 interceptor
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 현재 로그인 유무 확인 
		// -> O: 원래 매핑 주소로 이동
		// -> X: 로그인 폼으로 매핑되도록 매핑주소 변경
		HttpSession session = request.getSession();
		String userid=(String) session.getAttribute("logId");
		String logStatus = (String) session.getAttribute("logStatus");
		
		if(userid == null || logStatus == null || userid.equals("") || !logStatus.equals("Y")) {
			// 로그인 안된 경우
			response.sendRedirect("/home/register/login");
			return false;
		}
		return true;
	}
	
	// 뷰페이지로 이동 전에 interceptor
	
	
	// 매핑이 실행된 후 interceptor
	
	
}

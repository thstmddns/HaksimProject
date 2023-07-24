package kr.or.smhrd;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("logId");
		String logStatus = (String)session.getAttribute("logStatus");
		String logType = (String)session.getAttribute("logType");
		int logAuth =  (Integer) session.getAttribute("logAuth");
		
		if(userid == null || logStatus == null || userid.equals("") || !logStatus.equals("Y")) {
			response.sendRedirect("/smhrd/register/login");
			return false;
		}
		
		
		if(logAuth!=1) {
			response.sendRedirect("/smhrd");
			return false;
		}
		
		
		return true;
	}
}

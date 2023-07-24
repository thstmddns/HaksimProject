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
		
		if(userid == null || logStatus == null || userid.equals("") || !logStatus.equals("Y")) {
			response.sendRedirect("/smhrd/register/login");
			return false;
		}
		return true;
	}
}

package kr.or.gaw.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        HttpSession session = request.getSession(false); // 세션이 없으면 null 반환
	        if (session == null || session.getAttribute("loggedInUserId") == null) {
	            response.sendRedirect("/login"); // 세션에 로그인 정보가 없으면 로그인 페이지로 리다이렉트
	            return false; // 요청을 중단하고 로그인 페이지로 이동
	        }
	        return true; // 세션에 로그인 정보가 있으면 요청 진행
	    }

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}

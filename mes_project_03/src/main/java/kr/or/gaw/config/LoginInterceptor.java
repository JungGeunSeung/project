package kr.or.gaw.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gaw.dto.EmpDTO;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false); // 세션 가져오기, 없으면 null 반환

        if (session == null || session.getAttribute("loggedInUser") == null) {
            // 세션이 없거나 로그인하지 않은 경우, 로그인 페이지로 리다이렉트
            response.sendRedirect("/login");
            return false;
        }

        // 로그인된 사용자의 직책 확인
        EmpDTO dto =  (EmpDTO) session.getAttribute("loggedInUser");
        String position = dto.getPosition();
        // 접근 제한이 필요한 페이지에 대해 권한 확인 (예: 직책이 '인턴'이면 접근 차단)
        if (!("부장".equals(position))) {
            response.sendRedirect("/access-denied"); // 접근 차단 페이지로 리다이렉트
            return false;
        }

        return true; // 조건에 맞으면 요청 계속 진행
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

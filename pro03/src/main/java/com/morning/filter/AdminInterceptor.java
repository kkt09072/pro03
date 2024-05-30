package com.morning.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.morning.domain.Member;


public class AdminInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

    	String requestURI = request.getRequestURI();
    	
        // /sales/ 경로에 대해 예외 처리
        if(requestURI.startsWith(request.getContextPath() + "/sales/")) {
            return true;
        }

        HttpSession session = request.getSession();
        Member ses = (Member) session.getAttribute("cus");
        
        if(session.getAttribute("cus")==null) { //로그인을 하지 않은 경우
            response.sendRedirect(request.getContextPath()+"/member/login.do");
            return false;
        }
        
        if(ses.getId().equals("admin")){ //관리자(admin) 계정인 경우 (/admin/**) 접근 가능
            return true;
        } else { //관리자(admin) 계정이 아닌 경우
            response.sendRedirect(request.getContextPath()+"/member/login.do");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}

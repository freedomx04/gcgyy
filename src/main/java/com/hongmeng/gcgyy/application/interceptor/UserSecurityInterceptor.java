package com.hongmeng.gcgyy.application.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hongmeng.gcgyy.common.utils.DeviceUtils;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;

/**
 * 用户权限拦截器
 * 		未登录用户不能调用servlet方法获取数据
 */
public class UserSecurityInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (DeviceUtils.isMobile(request)) {
		
		} else {
			Object obj = request.getSession().getAttribute("cur_user");
	        if (obj == null || !(obj instanceof BaseUserEntity)) {
	            return false;
	        }
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
}
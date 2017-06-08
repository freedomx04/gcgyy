package com.hongmeng.gcgyy.controller.wx;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongmeng.gcgyy.common.wx.WxUtil;
import com.hongmeng.gcgyy.service.authority.UserService;

@Controller
public class WxPersonalController {
	
	static Logger log = LoggerFactory.getLogger(WxPersonalController.class);
	
	@Autowired
	UserService userService;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value = "/wx/personal")
	String personal(ModelMap modelMap) {
		String url = request.getRequestURL().toString() + "?" + request.getQueryString();
		WxUtil.config(modelMap, url);
		
		return WxUtil.getInstace().redirect(modelMap, request, userService, "wx/personal/personal");
	}
	
	@RequestMapping(value = "/wx/bind")
	String bind(ModelMap modelMap) {
		return "wx/personal/bind"; 
	}
	
	
}

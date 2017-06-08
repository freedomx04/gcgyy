package com.hongmeng.gcgyy.controller.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BasicController {
	
	static Logger log = LoggerFactory.getLogger(BasicController.class);
	
	@RequestMapping(value={"/", "/portal"})
	String home() {
		return "portal";
	}
	
	@RequestMapping("/demo")
	String demo() {
		return "demo";
	}
	
	@RequestMapping("/demoPage")
	String demoPage(String page) {
		return "demo/" + page;
	}
	
	@RequestMapping("/page")
	String page(String page) {
		return "page/" + page;
	}
	
	@RequestMapping("/manager")
	String index() {
		return "manager";
	}
	@RequestMapping("/login")
	String login() {
		return "login";
	}
	@RequestMapping("/register")
	String register() {
		return "register";
	}
	
	@RequestMapping("/noteList")
	String noteList() {
		return "noteList";
	}
	@RequestMapping("/introduce")
	String introduce() {
		return "introduce";
	}
	
	@RequestMapping("/monitor")
	String monitor() {
		return "monitor";
	}
	@RequestMapping("/assist")
	String assist() {
		return "assist";
	}
	
	@RequestMapping("/releases")
	String releases() {
		return "releases";
	}
	
	
	@RequestMapping(value = "/wx/message")
	String message() {
		return "wx/message";
	}
}
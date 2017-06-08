package com.hongmeng.gcgyy.controller.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("m")
public class MobileController {

	static Logger log = LoggerFactory.getLogger(MobileController.class);
	
	@RequestMapping("/about")
	String about() {
		return "m/about";
	}
	
		
	@RequestMapping("/dynamic")
	String dynamic() {
		return "m/dynamic";
	}
	
	@RequestMapping("/dynamicinfo")
	String dynamicinfo() {
		return "m/dynamicinfo";
	}
	
	@RequestMapping("/productinfo")
	String productinfo() {
		return "m/productinfo";
	}
	
	@RequestMapping("/enterpriseinfo")
	String enterpriseinfo() {
		return "m/enterpriseinfo";
	}
}

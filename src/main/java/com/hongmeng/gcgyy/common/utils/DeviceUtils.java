package com.hongmeng.gcgyy.common.utils;

import javax.servlet.http.HttpServletRequest;

import com.hongmeng.gcgyy.entity.common.LoginEntity.DeviceType;
import com.hongmeng.gcgyy.entity.common.LoginEntity.LoginType;

public class DeviceUtils {
	
	public static boolean isMobile(HttpServletRequest request) {
		String useragent = request.getHeader("User-Agent").toLowerCase();
		if (useragent.contains("android") || useragent.contains("iphone") || useragent.contains("ipad")) {
			return true;
		}
		return false;
	}
	
	public static Integer getLoginType(HttpServletRequest request) {
		Integer loginType;
		String useragent = request.getHeader("User-Agent").toLowerCase();
		if (useragent.contains("android") || useragent.contains("iphone") || useragent.contains("ipad")) {
			loginType = LoginType.MOBILE;
		} else {
			loginType = LoginType.WEB;
		}
		return loginType;
	}
	
	public static Integer getDeviceType(HttpServletRequest request) {
		Integer deviceType;
		String useragent = request.getHeader("User-Agent").toLowerCase();
		if (useragent.contains("android")) {
			deviceType = DeviceType.ANDROID;
		} else if (useragent.contains("iphone") || useragent.contains("ipad")) {
			deviceType = DeviceType.IOS;
		} else {
			deviceType = DeviceType.WEB;
		}
		return deviceType;
	}
}

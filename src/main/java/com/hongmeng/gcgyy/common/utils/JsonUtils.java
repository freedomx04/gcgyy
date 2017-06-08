package com.hongmeng.gcgyy.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Json 框架类
 * 
 * @author yiyun 2016.05.25
 */
public class JsonUtils {

	static Logger log = LoggerFactory.getLogger(JsonUtils.class);

	public static Gson INSTANCE = null;

	private JsonUtils() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * 获取实例
	 * 
	 * @return
	 */
	public static Gson getInstance() {
		if (INSTANCE == null) {
			synchronized (Gson.class) {
				if (INSTANCE == null) {
					INSTANCE = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				}
			}
		}
		return INSTANCE;
	}

	public static String toJson(Object obj) {
		return getInstance().toJson(obj);
	}

}

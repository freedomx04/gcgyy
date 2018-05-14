package com.hongmeng.gcgyy.application.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.ueditor.MyActionEnter;

/**
 * 百度富文本编辑器上传功能控制器
 * 
 * @author yiyun 2016.5.18
 */
@Controller
public class UEditorController {

	@Value("${config.json.path}")
	private String configJSONPath;

	@RequestMapping("/ueditorController")
	public @ResponseBody String controller(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type", "text/html");
		
		String root = request.getSession().getServletContext().getRealPath("/");
		File file = new File(root + configJSONPath);
		FileInputStream fis = new FileInputStream(file);
		String baseState = new MyActionEnter(request, fis).exec();
		
//		@SuppressWarnings("resource")
//		ApplicationContext appContext = new ClassPathXmlApplicationContext();
//		String baseState = new MyActionEnter(request, appContext.getResource(configJSONPath).getInputStream()).exec();
		return baseState;
	}
}

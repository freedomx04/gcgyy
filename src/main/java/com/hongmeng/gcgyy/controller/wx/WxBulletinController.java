package com.hongmeng.gcgyy.controller.wx;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongmeng.gcgyy.entity.setting.DynamicEntity;
import com.hongmeng.gcgyy.service.setting.DynamicService;

@Controller
public class WxBulletinController {

	static Logger log = LoggerFactory.getLogger(WxBulletinController.class);
	
	@Autowired
	DynamicService dynamicService;
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@RequestMapping(value = "/wx/bulletin")
	String bulletin(ModelMap modelMap) {
		List<DynamicEntity> list = dynamicService.listByType(1);
		modelMap.addAttribute("list", list);
		
		return "wx/bulletin/bulletin";
	}
	
	@RequestMapping(value = "/wx/bulletin/get")
	String bulletin_get(ModelMap modelMap, Long bulletinId) throws IOException {
		DynamicEntity bulletin = dynamicService.findOne(bulletinId);
		
		File file = new File(uploadPath + File.separator + bulletin.getLinkPath());
		String content = FileUtils.readFileToString(file, "UTF-8");
		
		// 懒加载图片
		content = content.replaceAll("src", "data-src");
		bulletin.setContent(content);
		
		modelMap.addAttribute("bulletin", bulletin);
		return "wx/bulletin/bulletin_info";
	}
	
}

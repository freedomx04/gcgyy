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

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.NewsEntity;
import com.hongmeng.gcgyy.entity.authority.ProductEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;

@Controller
public class WxEnterpriseController {
	
	static Logger log = LoggerFactory.getLogger(WxEnterpriseController.class);
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@RequestMapping(value = "/wx/enterprise")
	String enterprise(ModelMap modelMap) {
		List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
		modelMap.addAttribute("enterpriseList", enterpriseList);
		
		return "wx/enterprise/enterprise_list";
	}
	
	@RequestMapping(value = "/wx/enterprise/get")
	String enterprise_get(ModelMap modelMap, Long enterpriseId) {
		EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
		modelMap.addAttribute("enterprise", enterprise);
		
		return "wx/enterprise/enterprise_info";
	}
	
	@RequestMapping(value = "/wx/enterprise/product")
	String enterprise_product(ModelMap modelMap, Long productId) {
		ProductEntity product = enterpriseService.findOneProduct(productId);
		modelMap.addAttribute("product", product);
		
		return "wx/enterprise/enterprise_product";
	}
	
	@RequestMapping(value = "/wx/enterprise/news")
	String enterprise_news(ModelMap modelMap, Long newsId) throws IOException {
		NewsEntity news = enterpriseService.findOneNews(newsId);
		BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(news.getEnterpriseId());
		
		File file = new File(uploadPath + File.separator + news.getLinkPath());
		String content = FileUtils.readFileToString(file, "UTF-8");
		
		// 懒加载图片
		content = content.replaceAll("src", "data-src");
		news.setContent(content);
		
		modelMap.addAttribute("news", news);
		modelMap.addAttribute("enterpriseName", enterprise.getName());
		
		return "wx/enterprise/enterprise_news";
	}
	
	@RequestMapping(value = "/wx/product")
	String product(ModelMap modelMap) {
		return "wx/enterprise/product";
	}
	

}

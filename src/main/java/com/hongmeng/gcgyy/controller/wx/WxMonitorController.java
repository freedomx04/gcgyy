package com.hongmeng.gcgyy.controller.wx;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongmeng.gcgyy.common.wx.WxUtil;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;

@Controller
public class WxMonitorController {
	
	static Logger log = LoggerFactory.getLogger(WxMonitorController.class);
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	ProductTypeService productTypeService;
	
	@Autowired
	AreaService areaService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/wx/monitor")
	String monitor(ModelMap modelMap) {
		return WxUtil.getInstace().redirect(modelMap, request, userService, "wx/monitor/menu");
	}
	
	@RequestMapping(value = "/wx/monitorGV")
	String monitorGV(ModelMap modelMap) {
		String type = request.getParameter("type");
		String item = type != "" ? type.split("-")[0] : "0";
		
		switch (item) {
		case "0":
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			modelMap.addAttribute("selectList", enterpriseList);
			break;
		case "1":
			List<ProductTypeEntity> productTypeList = productTypeService.list();
			modelMap.addAttribute("selectList", productTypeList);
			break;
		case "2":
			List<AreaEntity> areaList = areaService.list();
			modelMap.addAttribute("selectList", areaList);
			break;
		case "3":
			List<BaseEnterpriseEntity> pointEnterpriseList = enterpriseService.listPoint();
			modelMap.addAttribute("selectList", pointEnterpriseList);
			break;
		}
		
		return "wx/monitor/monitor_gv";
	}
	
	@RequestMapping(value = "/wx/monitorEP")
	String monitorEP(ModelMap modelMap, String type, Long userId) {
		String item = type != "" ? type.split("-")[0] : "0";
		
		switch (item) {
		case "0":
			UserEntity user = userService.findOne(userId);
			EnterpriseEntity enterprise = user.getEnterprise();
			modelMap.addAttribute("enterprise", enterprise);
			break;
		case "1":
			List<ProductTypeEntity> productTypeList = productTypeService.list();
			modelMap.addAttribute("selectList", productTypeList);
			break;
		case "2":
			List<AreaEntity> areaList = areaService.list();
			modelMap.addAttribute("selectList", areaList);
			break;
		case "3":
			List<BaseEnterpriseEntity> pointEnterpriseList = enterpriseService.listPoint();
			modelMap.addAttribute("selectList", pointEnterpriseList);
			break;
		}
		
		return "wx/monitor/monitor_ep";
	}
}

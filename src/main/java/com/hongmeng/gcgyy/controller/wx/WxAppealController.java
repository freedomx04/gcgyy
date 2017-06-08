package com.hongmeng.gcgyy.controller.wx;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongmeng.gcgyy.common.wx.WxUtil;
import com.hongmeng.gcgyy.entity.assist.AppealEntity;
import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;
import com.hongmeng.gcgyy.service.assist.AppealService;
import com.hongmeng.gcgyy.service.authority.DepartmentService;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.baseData.AppealTypeService;

@Controller
public class WxAppealController {
	
	static Logger log = LoggerFactory.getLogger(WxAppealController.class);
	
	@Autowired
	AppealService appealService;
	
	@Autowired
	AppealTypeService appealTypeService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/wx/appealCenter")
	String rank(ModelMap modelMap) {
		return WxUtil.getInstace().redirect(modelMap, request, userService, "wx/appealCenter/menu");
	}
	
	@RequestMapping(value = "/wx/appealEP")
	String appealEP(ModelMap modelMap, Long userId) {
		
		UserEntity user = userService.findOne(userId);
		EnterpriseEntity enterprise = user.getEnterprise();
		Long enterpriseId = enterprise.getId();
		List<AppealEntity> appealList = appealService.findByEnterpriseId(enterpriseId);
		
		List<Map<String, Object>> overDaysList = new ArrayList<Map<String, Object>>();
		List<AppealTypeEntity> aptList = appealTypeService.list();
		
		Integer acceptDayAppealLength = 0;
		Integer handleDayAppealLength = 0;
		
		if (aptList.size() != 0) {
			for (int i = 0; i < aptList.size(); i++) {
				List<AppealEntity> acceptDays = new ArrayList<AppealEntity>();
				List<AppealEntity> handleDays = new ArrayList<AppealEntity>();
				Map<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("appealTypeName", aptList.get(i).getName());
				
				List<BigInteger> acceptDaysData = appealService.getOverAcceptDays(null, enterpriseId,
						aptList.get(i).getId());
				if (acceptDaysData.size() != 0) {
					acceptDayAppealLength = acceptDayAppealLength + 1;
				}
				for (int x = 0; x < acceptDaysData.size(); x++) {
					acceptDays.add(appealService.findOne(((BigInteger) acceptDaysData.get(x)).longValue()));
				}
				
				List<BigInteger> handleDaysData = appealService.getOverHandleDays(null, enterpriseId,
						aptList.get(i).getId());
				if (handleDaysData.size() != 0) {
					handleDayAppealLength = handleDayAppealLength + 1;
				}
				for (int x = 0; x < handleDaysData.size(); x++) {
					handleDays.add(appealService.findOne(((BigInteger) handleDaysData.get(x)).longValue()));
				}
				
				resultMap.put("acceptDays", acceptDays);
				resultMap.put("handleDays", handleDays);
				overDaysList.add(resultMap);
			}
			
		}
		
		modelMap.addAttribute("appealList", appealList);
		modelMap.addAttribute("overDaysList", overDaysList);
		modelMap.addAttribute("acceptDayAppealLength", acceptDayAppealLength);
		modelMap.addAttribute("handleDayAppealLength", handleDayAppealLength);
		
		return "wx/appealCenter/appeal_ep";
	}
	
	@RequestMapping(value = "/wx/appealGV")
	String appealGV(ModelMap modelMap, Long userId) {
		
		UserEntity user = userService.findOne(userId);
		DepartmentEntity department = user.getDepartment();
		Long departmentId = department.getId();
		
		List<AppealEntity> appealList = appealService.findByDepartmentId(departmentId);
		
		modelMap.addAttribute("appealList", appealList);
		modelMap.addAttribute("departmentId", departmentId);
		
		return "wx/appealCenter/appeal_gv";
	}
	
	@RequestMapping(value = "/wx/appealDispatcher")
	String appealDispatcher(ModelMap modelMap) {
		List<AppealEntity> appealList = appealService.list();
		modelMap.addAttribute("appealList", appealList);
		
		return "wx/appealCenter/appeal_dispatcher";
	}
	
	@RequestMapping(value = "/wx/appealPoint")
	String appealPoint(ModelMap modelMap, Long pointUserId) {
		
		List<EnterpriseEntity> enterpriseListP = enterpriseService.listByPointUserId(pointUserId);
		List<AppealEntity> appealList = appealService.findByEnterpriseIn(enterpriseListP);
		
		List<EnterpriseEntity> enterpriseList = enterpriseService.listByPointUserId(pointUserId);
		
		List<Map<String, Object>> overDaysList = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<EnterpriseEntity> list = enterpriseService.listByPointUserId(pointUserId);
		List<AppealEntity> acceptDays = new ArrayList<AppealEntity>();
		List<AppealEntity> handleDays = new ArrayList<AppealEntity>();
		
		Integer acceptDayAppealLength = 0;
		Integer handleDayAppealLength = 0;
		
		for (int i = 0; i < list.size(); i++) {
			List<BigInteger> acceptDaysData = appealService.getOverAcceptDays(list.get(i).getId());
			if (acceptDaysData.size() != 0) {
				acceptDayAppealLength = acceptDayAppealLength + 1;
			}
			for (int x = 0; x < acceptDaysData.size(); x++) {
				acceptDays.add(appealService.findOne(((BigInteger) acceptDaysData.get(x)).longValue()));
			}
			
			List<BigInteger> handleDaysData = appealService.getOverHandleDays(list.get(i).getId());
			if (handleDaysData.size() != 0) {
				handleDayAppealLength = handleDayAppealLength + 1;
			}
			for (int x = 0; x < handleDaysData.size(); x++) {
				handleDays.add(appealService.findOne(((BigInteger) handleDaysData.get(x)).longValue()));
			}
		}
		resultMap.put("acceptDays", acceptDays);
		resultMap.put("handleDays", handleDays);
		overDaysList.add(resultMap);
		
		modelMap.addAttribute("enterpriseList", enterpriseList);
		modelMap.addAttribute("appealList", appealList);
		modelMap.addAttribute("overDaysList", overDaysList);
		modelMap.addAttribute("acceptDayAppealLength", acceptDayAppealLength);
		modelMap.addAttribute("handleDayAppealLength", handleDayAppealLength);
		
		return "wx/appealCenter/appeal_point";
	}
	
	@RequestMapping(value = "/wx/appealCenter/appealinfo")
	String appeal_get(ModelMap modelMap, Long appealId, String role, Long userId) {
		AppealEntity appeal = appealService.findOne(appealId);
		modelMap.addAttribute("appeal", appeal);
		modelMap.addAttribute("role", role);
		modelMap.addAttribute("userId", userId);
		
		return "wx/appealCenter/appeal_info";
	}
	
	@RequestMapping("/wx/appealCenter/urge")
	String urge(ModelMap modelMap, Long appealId, String role, Long userId) {
		modelMap.addAttribute("role", role);
		return "wx/appealCenter/appeal_urge";
	}
	
	@RequestMapping("/wx/appealCenter/reject")
	String reject(ModelMap modelMap, Long appealId, String role, Long userId) {
		modelMap.addAttribute("role", role);
		return "wx/appealCenter/appeal_reject";
	}
	
	@RequestMapping("/wx/appealCenter/confirm")
	String confirm(ModelMap modelMap, Long appealId, String role, Long userId) {
		modelMap.addAttribute("role", role);
		return "wx/appealCenter/appeal_confirm";
	}
	
	@RequestMapping("/wx/appealCenter/dispatch")
	String dispatch(ModelMap modelMap, Long appealId, String role, Long userId) {
		List<DepartmentEntity> departmentList = departmentService.list();
		modelMap.addAttribute("departmentList", departmentList);
		modelMap.addAttribute("role", role);
		
		return "wx/appealCenter/appeal_dispatch";
	}
}

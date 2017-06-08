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
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareApplyEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareEntity;
import com.hongmeng.gcgyy.entity.industryService.HireEntity;
import com.hongmeng.gcgyy.entity.industryService.JobEntity;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.industryService.DeclareApplyService;
import com.hongmeng.gcgyy.service.industryService.DeclareService;
import com.hongmeng.gcgyy.service.industryService.HireService;
import com.hongmeng.gcgyy.service.industryService.JobService;

@Controller
public class WxIndustryServiceController {
	
	static Logger log = LoggerFactory.getLogger(WxIndustryServiceController.class);
	
	@Autowired
	JobService jobService;
	
	@Autowired
	HireService hireService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	DeclareService declareService;
	
	@Autowired
	DeclareApplyService declareApplyService;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/wx/industryService")
	String rank(ModelMap modelMap) {
		return WxUtil.getInstace().redirect(modelMap, request, userService, "wx/industryService/menu");
	}
	
	@RequestMapping("/wx/jobPlatformGV")
	String jobPlatformGV(ModelMap modelMap, Long userId) {
		List<HireEntity> hireList = hireService.list();
		modelMap.addAttribute("hireList", hireList);
		
		List<JobEntity> jobList = jobService.findByUserId(userId);
		modelMap.addAttribute("jobList", jobList);
		
		return "wx/industryService/jobPlatform/jobPlatform_gv";
	}
	
	@RequestMapping("/wx/jobPlatformEP")
	String jobPlatformEP(ModelMap modelMap, Long userId) {
		UserEntity user = userService.findOne(userId);
		EnterpriseEntity enterprise = user.getEnterprise();
		Long enterpriseId = enterprise.getId();
		
		List<HireEntity> hireList = hireService.findByEnterpriseId(enterpriseId);
		modelMap.addAttribute("hireList", hireList);
		
		List<JobEntity> jobList = jobService.findByUserId(userId);
		modelMap.addAttribute("jobList", jobList);
		
		return "wx/industryService/jobPlatform/jobPlatform_ep";
	}
	
	@RequestMapping(value = "/wx/jobPlatform/hireinfo")
	String hire_get(ModelMap modelMap, Long hireId) {
		HireEntity hire = hireService.findOne(hireId);
		modelMap.addAttribute("hire", hire);
		
		return "wx/industryService/jobPlatform/hire_info";
	}
	
	@RequestMapping(value = "/wx/jobPlatform/jobinfo")
	String job_get(ModelMap modelMap, Long jobId) {
		JobEntity job = jobService.findOne(jobId);
		modelMap.addAttribute("job", job);
		
		return "wx/industryService/jobPlatform/job_info";
	}
	
	@RequestMapping("/wx/declareEP")
	String declareEP(ModelMap modelMap, Long userId) {
		UserEntity user = userService.findOne(userId);
		EnterpriseEntity enterprise = user.getEnterprise();
		Long enterpriseId = enterprise.getId();
		List<DeclareEntity>	declareList = declareService.listOnline();
		List<DeclareApplyEntity> declareApplyList = declareApplyService.list(enterpriseId);
			
		modelMap.addAttribute("declareApplyList", declareApplyList);
		modelMap.addAttribute("declareList", declareList);
		
		return "wx/industryService/declare/declare_ep";
	}
	
	@RequestMapping("/wx/declareGV")
	String declareGV(ModelMap modelMap, Long userId) {
		List<DeclareEntity> declareList = declareService.listByUserId(userId);
		modelMap.addAttribute("declareList", declareList);
		
		return "wx/industryService/declare/declare_gv";
	}
	
	@RequestMapping(value = "/wx/declareinfo")
	String declare_get(ModelMap modelMap, Long declareId, String role) {
		DeclareEntity declare = declareService.findOne(declareId);
		modelMap.addAttribute("declare", declare);
		modelMap.addAttribute("role", role);
		
		return "wx/industryService/declare/declare_info";
	}
	
	@RequestMapping("/wx/declareEnterprise")
	String declareEnterprise(ModelMap modelMap, Long declareId) {
		DeclareEntity declare = declareService.findOne(declareId);
		modelMap.addAttribute("declareApplyList", declare.getDeclareApplys());
		
		return "wx/industryService/declare/declare_enterprise";
	}
	
	@RequestMapping(value = "/wx/declareApplyInfo")
	String declareApply_get(ModelMap modelMap, Long declareApplyId, String role) {
		DeclareApplyEntity declareApply = declareApplyService.findOne(declareApplyId);
		modelMap.addAttribute("declareApply", declareApply);
		modelMap.addAttribute("role", role);
		
		return "wx/industryService/declare/declareApply_info";
	}
	
	@RequestMapping("/wx/declareApprove")
	String declareApprove() {
		return "wx/industryService/declare/declare_approve";
	}
	
	@RequestMapping("/wx/declareApply")
	String declareApply() {
		return "wx/industryService/declare/declare_apply";
	}
}

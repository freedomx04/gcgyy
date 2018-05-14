package com.hongmeng.gcgyy.controller.monitor;

import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.monitor.AlertEnterpriseVO;
import com.hongmeng.gcgyy.service.monitor.AlertReportVO;
import com.hongmeng.gcgyy.service.monitor.AlertService;

@RestController
@RequestMapping("alert")
public class AlertController {

	static Logger log = LoggerFactory.getLogger(AlertController.class);
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	AlertService alertService;
	
	@RequestMapping(value = "/listEnterprise", method = RequestMethod.POST)
	public OutputList listEnterprise(@RequestParam String monthly) {
		try {
			List<AlertEnterpriseVO> ret = new LinkedList<>();
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				ret.add(alertService.detailEnterprise(monthly, enterprise));
			}
			return new OutputList(ret, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listEnterprisePaging", method = RequestMethod.POST)
	public OutputList listEnterprisePaging(@RequestParam String monthly, @RequestParam int page, @RequestParam int size) {
		try {
			List<AlertEnterpriseVO> ret = new LinkedList<>();
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase(page, size);
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				ret.add(alertService.detailEnterprise(monthly, enterprise));
			}
			return new OutputList(ret, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listEnterpriseByMonthlyRange", method = RequestMethod.POST)
	public OutputList listEnterpriseByMonthlyRange(@RequestParam Long enterpriseId, @RequestParam String monthlyStart,
			@RequestParam String monthlyEnd) {
		try {
			List<AlertEnterpriseVO> list = new LinkedList<>();
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				list.add(alertService.detailEnterprise(monthly, enterprise));
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listReport", method = RequestMethod.POST)
	public OutputList listReport(@RequestParam String monthly) {
		try {
			List<AlertReportVO> ret = new LinkedList<>();
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				ret.add(alertService.detailReport(monthly, enterprise));
			}
			return new OutputList(ret, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listReportPaging", method = RequestMethod.POST)
	public OutputList listReportPaging(@RequestParam String monthly, @RequestParam int page, @RequestParam int size) {
		try {
			List<AlertReportVO> ret = new LinkedList<>();
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase(page, size);
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				ret.add(alertService.detailReport(monthly, enterprise));
			}
			return new OutputList(ret, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listReportByMonthlyRange", method = RequestMethod.POST)
	public OutputList listReportByMonthlyRange(@RequestParam Long enterpriseId, @RequestParam String monthlyStart,
			@RequestParam String monthlyEnd) {
		try {
			List<AlertReportVO> list = new LinkedList<>();
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				list.add(alertService.detailReport(monthly, enterprise));
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
}
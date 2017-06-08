package com.hongmeng.gcgyy.controller.ranking;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.baseData.CountyEntity;
import com.hongmeng.gcgyy.entity.ranking.MainBusinessEntity;
import com.hongmeng.gcgyy.service.baseData.CountyService;
import com.hongmeng.gcgyy.service.ranking.MainBusinessService;

@RestController
@RequestMapping("mainBusiness")
public class MainBusinessController {

	static Logger log = LoggerFactory.getLogger(MainBusinessController.class);

	@Autowired
	MainBusinessService businessService;

	@Autowired
	CountyService countyService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(String monthly, Long countyId, Double total, Double yearGrowth, Integer sort) {
		try {
			MainBusinessEntity business = businessService.findOne(monthly, countyId);
			if (businessService != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			CountyEntity county = countyService.findOne(countyId);
			business = new MainBusinessEntity(monthly, county, total, yearGrowth, sort);
			business.setCreateTime(new Date());
			businessService.save(business);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output add(Long businessId, String monthly, Long countyId, Double total, Double yearGrowth, Integer sort) {
		try {
			MainBusinessEntity business = businessService.findOne(businessId);
			business.setTotal(total);
			business.setYearGrowth(yearGrowth);
			business.setSort(sort);

			businessService.save(business);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String businessIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(businessIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			businessService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Output(null, ReturnStatus.CONSTRAINT.status(), e.getMessage());
			}
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long businessId) {
		try {
			MainBusinessEntity business = businessService.findOne(businessId);
			return new Output(business, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthly", method = RequestMethod.POST)
	public OutputList listByMonthly(@RequestParam String monthly) {
		try {
			List<MainBusinessEntity> list = new LinkedList<>();

			List<CountyEntity> countyList = countyService.list();
			for (CountyEntity county : countyList) {
				MainBusinessEntity business = businessService.findOne(monthly, county.getId());
				if (business == null) {
					business = new MainBusinessEntity(monthly, county);
					business.setCreateTime(new Date());
					businessService.save(business);
				}
				list.add(business);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}

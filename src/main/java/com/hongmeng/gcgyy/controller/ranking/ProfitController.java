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
import com.hongmeng.gcgyy.entity.ranking.ProfitEntity;
import com.hongmeng.gcgyy.service.baseData.CountyService;
import com.hongmeng.gcgyy.service.ranking.ProfitService;

@RestController
@RequestMapping("profit")
public class ProfitController {

	static Logger log = LoggerFactory.getLogger(ProfitController.class);

	@Autowired
	ProfitService profitService;

	@Autowired
	CountyService countyService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(String monthly, Long countyId, Double total, Double yearGrowth, Integer sort) {
		try {
			ProfitEntity profit = profitService.findOne(monthly, countyId);
			if (profit != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			CountyEntity county = countyService.findOne(countyId);
			profit = new ProfitEntity(monthly, county, total, yearGrowth, sort);
			profit.setCreateTime(new Date());
			profitService.save(profit);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output add(Long profitId, String monthly, Long countyId, Double total, Double yearGrowth, Integer sort) {
		try {
			ProfitEntity profit = profitService.findOne(profitId);
			profit.setTotal(total);
			profit.setYearGrowth(yearGrowth);
			profit.setSort(sort);

			profitService.save(profit);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String profitIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(profitIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			profitService.delete(list);
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
	public Output detail(@RequestParam Long profitId) {
		try {
			ProfitEntity profit = profitService.findOne(profitId);
			return new Output(profit, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthly", method = RequestMethod.POST)
	public OutputList listByMonthly(@RequestParam String monthly) {
		try {
			List<ProfitEntity> list = new LinkedList<>();

			List<CountyEntity> countyList = countyService.list();
			for (CountyEntity county : countyList) {
				ProfitEntity profit = profitService.findOne(monthly, county.getId());
				if (profit == null) {
					profit = new ProfitEntity(monthly, county);
					profit.setCreateTime(new Date());
					profitService.save(profit);
				}
				list.add(profit);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}

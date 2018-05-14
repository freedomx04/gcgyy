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
import com.hongmeng.gcgyy.entity.ranking.ProfitTaxEntity;
import com.hongmeng.gcgyy.service.baseData.CountyService;
import com.hongmeng.gcgyy.service.ranking.ProfitTaxService;

@RestController
@RequestMapping("profitTax")
public class ProfitTaxController {

	static Logger log = LoggerFactory.getLogger(ProfitTaxController.class);

	@Autowired
	ProfitTaxService taxService;

	@Autowired
	CountyService countyService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(String monthly, Long countyId, Double total, Double yearGrowth, Integer sort) {
		try {
			ProfitTaxEntity tax = taxService.findOne(monthly, countyId);
			if (tax != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			CountyEntity county = countyService.findOne(countyId);
			tax = new ProfitTaxEntity(monthly, county, total, yearGrowth, sort);
			tax.setCreateTime(new Date());
			taxService.save(tax);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output add(Long taxId, String monthly, Long countyId, Double total, Double yearGrowth, Integer sort) {
		try {
			ProfitTaxEntity tax = taxService.findOne(taxId);
			tax.setTotal(total);
			tax.setYearGrowth(yearGrowth);
			tax.setSort(sort);

			taxService.save(tax);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String taxIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(taxIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			taxService.delete(list);
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
	public Output detail(@RequestParam Long taxId) {
		try {
			ProfitTaxEntity tax = taxService.findOne(taxId);
			return new Output(tax, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthly", method = RequestMethod.POST)
	public OutputList listByMonthly(@RequestParam String monthly) {
		try {
			List<ProfitTaxEntity> list = new LinkedList<>();

			List<CountyEntity> countyList = countyService.list();
			for (CountyEntity county : countyList) {
				ProfitTaxEntity tax = taxService.findOne(monthly, county.getId());
				if (tax == null) {
					tax = new ProfitTaxEntity(monthly, county);
					tax.setCreateTime(new Date());
					taxService.save(tax);
				}
				list.add(tax);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}

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
import com.hongmeng.gcgyy.entity.ranking.IndustryOutputEntity;
import com.hongmeng.gcgyy.service.baseData.CountyService;
import com.hongmeng.gcgyy.service.ranking.IndustryOutputService;

@RestController
@RequestMapping("industryOutput")
public class IndustryOutputController {
	
	static Logger log = LoggerFactory.getLogger(IndustryOutputController.class);
	
	@Autowired
	IndustryOutputService outputService;
	
	@Autowired
	CountyService countyService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(String monthly, Long countyId, Integer enterpriseNum, Double total, Double yearGrowth, Integer sort) {
		try {
			IndustryOutputEntity output = outputService.findOne(monthly, countyId);
			if (output != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			CountyEntity county = countyService.findOne(countyId);
			output = new IndustryOutputEntity(monthly, county, enterpriseNum, total, yearGrowth, sort);
			output.setCreateTime(new Date());
			outputService.save(output);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output add(Long outputId, String monthly, Long countyId, Integer enterpriseNum, Double total, Double yearGrowth, Integer sort) {
		try {
			IndustryOutputEntity output = outputService.findOne(outputId);
			output.setEnterpriseNum(enterpriseNum);
			output.setTotal(total);
			output.setYearGrowth(yearGrowth);
			output.setSort(sort);

			outputService.save(output);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String outputIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(outputIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			outputService.delete(list);
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
	public Output detail(@RequestParam Long outputId) {
		try {
			IndustryOutputEntity output = outputService.findOne(outputId);
			return new Output(output, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthly", method = RequestMethod.POST)
	public OutputList listByMonthly(@RequestParam String monthly) {
		try {
			List<IndustryOutputEntity> list = new LinkedList<>();

			List<CountyEntity> countyList = countyService.list();
			for (CountyEntity county : countyList) {
				IndustryOutputEntity output = outputService.findOne(monthly, county.getId());
				if (output == null) {
					output = new IndustryOutputEntity(monthly, county);
					output.setCreateTime(new Date());
					outputService.save(output);
				}
				list.add(output);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}

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
import com.hongmeng.gcgyy.entity.ranking.VatEntity;
import com.hongmeng.gcgyy.service.baseData.CountyService;
import com.hongmeng.gcgyy.service.ranking.VatService;

@RestController
@RequestMapping("vat")
public class VatController {
	
	static Logger log = LoggerFactory.getLogger(VatController.class);
	
	@Autowired
	VatService vatService;
	
	@Autowired
	CountyService countyService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(String monthly, Long countyId, Double total, Double yearGrowth) {
		try {
			VatEntity vat = vatService.findOne(monthly, countyId);
			if (vat != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			CountyEntity county = countyService.findOne(countyId);
			vat = new VatEntity(monthly, county, total, yearGrowth);
			vat.setCreateTime(new Date());
			vatService.save(vat);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output add(Long vatId, String monthly, Long countyId, Double total, Double yearGrowth) {
		try {
			VatEntity vat = vatService.findOne(vatId);
			vat.setTotal(total);
			vat.setYearGrowth(yearGrowth);

			vatService.save(vat);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String vatIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(vatIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			vatService.delete(list);
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
	public Output detail(@RequestParam Long vatId) {
		try {
			VatEntity vat = vatService.findOne(vatId);
			return new Output(vat, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthly", method = RequestMethod.POST)
	public OutputList listByMonthly(@RequestParam String monthly) {
		try {
			List<VatEntity> list = new LinkedList<>();

			List<CountyEntity> countyList = countyService.list();
			for (CountyEntity county : countyList) {
				VatEntity vat = vatService.findOne(monthly, county.getId());
				if (vat == null) {
					vat = new VatEntity(monthly, county);
					vat.setCreateTime(new Date());
					vatService.save(vat);
				}
				list.add(vat);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
}

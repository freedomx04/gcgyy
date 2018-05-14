package com.hongmeng.gcgyy.controller.baseData;

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
import com.hongmeng.gcgyy.service.baseData.CountyService;

@RestController
@RequestMapping("county")
public class CountyController {
	
	static Logger log = LoggerFactory.getLogger(CountyController.class);

	@Autowired
	CountyService countyService;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String name, @RequestParam String remark) {
		try {
			CountyEntity county = countyService.findByName(name);
			if (county != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}
			
			county = new CountyEntity(name, remark);
			county.setCreateTime(new Date());
			countyService.save(county);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long countyId, @RequestParam String name, @RequestParam String remark) {
		try {
			CountyEntity county = countyService.findOne(countyId);
			county.setName(name);
			county.setRemark(remark);
			countyService.save(county);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String countyIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr: StringUtils.split(countyIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			countyService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Output(null, ReturnStatus.CONSTRAINT.status(), e.getMessage());
			}
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(countyService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/sort", method = RequestMethod.POST)
	public Output sort(@RequestParam("countyList[]") List<String> countyList) {
		try {
			for (String str: countyList) {
				String[] arr = str.split(",");
				Long countyId = Long.valueOf(arr[0]);
				Integer sort = Integer.valueOf(arr[2]);
				
				CountyEntity county = countyService.findOne(countyId);
				county.setSort(sort);
				countyService.save(county);
			}
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long countyId) {
		try {
			CountyEntity county = countyService.findOne(countyId);
			return new Output(county, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
}

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
import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;
import com.hongmeng.gcgyy.service.authority.DepartmentService;
import com.hongmeng.gcgyy.service.baseData.AppealTypeService;

@RestController
@RequestMapping("appealType")
public class AppealTypeController {

	static Logger log = LoggerFactory.getLogger(AppealTypeController.class);

	@Autowired
	AppealTypeService appealTypeService;

	@Autowired
	DepartmentService departmentService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String name, @RequestParam Integer acceptDays, @RequestParam Integer handleDays) {
		try {
			AppealTypeEntity appealType = new AppealTypeEntity(name, acceptDays, handleDays);
			appealType.setCreateTime(new Date());
			appealTypeService.save(appealType);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long appealTypeId, @RequestParam String name, @RequestParam Integer acceptDays,
			@RequestParam Integer handleDays) {
		try {
			AppealTypeEntity appealType = appealTypeService.findOne(appealTypeId);
			appealTypeService.update(appealType, name, acceptDays, handleDays);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String appealTypeIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(appealTypeIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			appealTypeService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Output(null, ReturnStatus.CONSTRAINT.status(), e.getMessage());
			}
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(appealTypeService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long appealTypeId) {
		try {
			AppealTypeEntity appealType = appealTypeService.findOne(appealTypeId);
			return new Output(appealType, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
}
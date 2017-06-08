package com.hongmeng.gcgyy.controller.industryService;

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
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;
import com.hongmeng.gcgyy.entity.industryService.JobEntity;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.baseData.BusinessService;
import com.hongmeng.gcgyy.service.industryService.JobService;

@RestController
@RequestMapping("job")
public class JobController {

	static Logger log = LoggerFactory.getLogger(JobController.class);

	@Autowired
	JobService jobService;

	@Autowired
	UserService userService;

	@Autowired
	BusinessService businessService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam Long userId, @RequestParam Integer age, @RequestParam String telephone,
			@RequestParam Long businessId, @RequestParam String salary, @RequestParam String description,
			@RequestParam String experience) {
		try {
			BaseUserEntity user = userService.findOneBase(userId);
			BusinessEntity business = businessService.findOne(businessId);
			JobEntity job = new JobEntity(user, age, telephone, business, salary, description, experience);
			job.setCreateTime(new Date());
			jobService.save(job);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output eidt(@RequestParam Long jobId, @RequestParam Long userId, @RequestParam Integer age,
			@RequestParam String telephone, @RequestParam Long businessId, @RequestParam String salary,
			@RequestParam String description, @RequestParam String experience) {
		try {
			BaseUserEntity user = userService.findOneBase(userId);
			BusinessEntity business = businessService.findOne(businessId);
			JobEntity job = jobService.findOne(jobId);
			jobService.update(job, user, age, telephone, business, salary, description, experience);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String jobIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(jobIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			jobService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (NumberFormatException e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(jobService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long jobId) {
		try {
			JobEntity job = jobService.findOne(jobId);
			return new Output(job, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/findByUserId", method = RequestMethod.POST)
	public OutputList findByUserId(@RequestParam Long userId) {
		try {
			return new OutputList(jobService.findByUserId(userId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(int page, int size) {
		try {
			return new OutputList(jobService.listPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPagingByUserId", method = RequestMethod.POST)
	public OutputList listPagingByUserId(@RequestParam Long userId, int page, int size) {
		try {
			return new OutputList(jobService.listPagingByUserId(userId, page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
}

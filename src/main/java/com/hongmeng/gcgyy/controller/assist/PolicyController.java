package com.hongmeng.gcgyy.controller.assist;

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
import com.hongmeng.gcgyy.entity.assist.PolicyEntity;
import com.hongmeng.gcgyy.entity.baseData.PolicyTypeEntity;
import com.hongmeng.gcgyy.service.assist.PolicyService;
import com.hongmeng.gcgyy.service.baseData.PolicyTypeService;
import com.hongmeng.gcgyy.service.common.UeditorService;

@RestController
@RequestMapping("policy")
public class PolicyController {

	static Logger log = LoggerFactory.getLogger(PolicyController.class);

	@Autowired
	PolicyService policyService;

	@Autowired
	PolicyTypeService policyTypeService;
	
	@Autowired
	UeditorService ueditorService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String title, @RequestParam Long policyTypeId, @RequestParam String allHtml) {
		try {
			PolicyTypeEntity policyType = policyTypeService.findOne(policyTypeId);
			String linkPath = ueditorService.save(allHtml);
			PolicyEntity policy = new PolicyEntity(title, policyType, linkPath);
			policy.setCreateTime(new Date());
			policyService.save(policy);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long policyId, @RequestParam String title, @RequestParam Long policyTypeId,
			@RequestParam String allHtml) {
		try {
			PolicyEntity policy = policyService.findOne(policyId);
			PolicyTypeEntity policyType = policyTypeService.findOne(policyTypeId);
			String linkPath = ueditorService.save(allHtml);
			policyService.update(policy, title, policyType, linkPath);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String policyIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(policyIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			policyService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(policyService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(int page, int size) {
		try {
			return new OutputList(policyService.listPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long policyId) {
		try {
			PolicyEntity policy = policyService.findOne(policyId);
			return new Output(policy, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}
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
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.industryService.BaseDeclareEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareApplyEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareApplyEntity.DeclareApproveStatus;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.industryService.DeclareApplyService;
import com.hongmeng.gcgyy.service.industryService.DeclareService;

@RestController
@RequestMapping("declareApply")
public class DeclareApplyController {

	static Logger log = LoggerFactory.getLogger(DeclareApplyController.class);

	@Autowired
	DeclareApplyService declareApplyService;

	@Autowired
	DeclareService declareService;

	@Autowired
	EnterpriseService enterpriseService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam Long declareId, @RequestParam Long enterpriseId, @RequestParam String description,
			@RequestParam String attachName, @RequestParam String attachPath) {
		try {
			DeclareApplyEntity declareApply = declareApplyService.findOne(declareId, enterpriseId);
			if (declareApply != null) { // 不能重复申报
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			BaseDeclareEntity declare = declareService.findOneBase(declareId);
			declareApply = new DeclareApplyEntity(declare, enterprise, description, attachName, attachPath);
			
			declareApply.setCreateTime(new Date());
			declareApply.setStatus(DeclareApproveStatus.UNAPPROVE);
			declareApplyService.save(declareApply);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long declareApplyId, @RequestParam String description,
			@RequestParam String attachName, @RequestParam String attachPath) {
		try {
			DeclareApplyEntity declareApply = declareApplyService.findOne(declareApplyId);
			declareApplyService.update(declareApply, description, attachName, attachPath);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String declareApplyIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(declareApplyIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			declareApplyService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByEnterpriseId", method = RequestMethod.POST)
	public OutputList listByEnterpriseId(@RequestParam Long enterpriseId) {
		try {
			return new OutputList(declareApplyService.list(enterpriseId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByEnterpriseIdPaging", method = RequestMethod.POST)
	public OutputList listByEnterpriseIdPaging(@RequestParam Long enterpriseId, @RequestParam int page,
			@RequestParam int size) {
		try {
			return new OutputList(declareApplyService.list(enterpriseId, page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long declareApplyId) {
		try {
			DeclareApplyEntity declareApply = declareApplyService.findOne(declareApplyId);
			return new Output(declareApply, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/approve", method = RequestMethod.POST)
	public Output approve(@RequestParam Long declareApplyId, @RequestParam Integer status,
			@RequestParam String opinion) {
		try {
			DeclareApplyEntity declareApply = declareApplyService.findOne(declareApplyId);
			declareApply.setStatus(status);
			declareApply.setOpinion(opinion);
			declareApplyService.save(declareApply);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}
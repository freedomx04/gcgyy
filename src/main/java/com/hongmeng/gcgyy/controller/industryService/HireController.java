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
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;
import com.hongmeng.gcgyy.entity.industryService.HireEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.baseData.BusinessService;
import com.hongmeng.gcgyy.service.industryService.HireService;

@RestController
@RequestMapping("hire")
public class HireController {
	static Logger log = LoggerFactory.getLogger(HireController.class);

	@Autowired
	HireService hireService;

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	BusinessService businessService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String imagePath, @RequestParam Long enterpriseId, @RequestParam String position,
			@RequestParam String telephone, @RequestParam String salary, @RequestParam Long businessId,
			@RequestParam String description) {
		try {
			EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
			BusinessEntity business = businessService.findOne(businessId);
			HireEntity hire = new HireEntity(imagePath, enterprise, position, telephone, salary, business, description);
			hire.setCreateTime(new Date());
			hireService.save(hire);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long hireId, @RequestParam String imagePath, @RequestParam Long enterpriseId,
			@RequestParam String position, @RequestParam String telephone, @RequestParam String salary,
			@RequestParam Long businessId, @RequestParam String description) {
		try {
			HireEntity hire = hireService.findOne(hireId);
			EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
			BusinessEntity business = businessService.findOne(businessId);
			hireService.update(hire, imagePath, enterprise, position, telephone, salary, business, description);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String hireIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(hireIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			hireService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(hireService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long hireId) {
		try {
			HireEntity hire = hireService.findOne(hireId);
			return new Output(hire, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/findByUserId", method = RequestMethod.POST)
	public OutputList findByUserId(@RequestParam Long userId) {
		try {
			UserEntity user = userService.findOne(userId);
			Long enterpriseId = user.getEnterprise().getId();
			return new OutputList(hireService.findByEnterpriseId(enterpriseId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(int page, int size) {
		try {
			return new OutputList(hireService.listPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPagingByUserId", method = RequestMethod.POST)
	public OutputList listPagingByUserId(@RequestParam Long userId, int page, int size) {
		try {
			UserEntity user = userService.findOne(userId);
			Long enterpriseId = user.getEnterprise().getId();
			return new OutputList(hireService.listPagingByEnterpriseId(enterpriseId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
}

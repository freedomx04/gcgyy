package com.hongmeng.gcgyy.controller.industryService;

import java.util.Date;
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
import com.hongmeng.gcgyy.entity.industryService.DeclareApplyEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareEntity.ApplyStatus;
import com.hongmeng.gcgyy.entity.industryService.DeclareEntity.DeclareStatus;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.industryService.DeclareApplyService;
import com.hongmeng.gcgyy.service.industryService.DeclareService;

@RestController
@RequestMapping("declare")
public class DeclareController {

	static Logger log = LoggerFactory.getLogger(DeclareController.class);

	@Autowired
	DeclareService declareService;

	@Autowired
	DeclareApplyService declareApplyService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String itemName, @RequestParam String description, @RequestParam Date startTime,
			@RequestParam Date endTime, @RequestParam String attachName, @RequestParam String attachPath,
			@RequestParam Long userId) {
		try {
			BaseUserEntity user = userService.findOneBase(userId);
			DeclareEntity declare = new DeclareEntity(itemName, description, startTime, endTime, attachName, attachPath,
					user);
			declare.setCreateTime(new Date());
			declareService.save(declare);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long declareId, @RequestParam String itemName, @RequestParam String description,
			@RequestParam Date startTime, @RequestParam Date endTime, @RequestParam String attachName,
			@RequestParam String attachPath) {
		try {
			DeclareEntity declare = declareService.findOne(declareId);
			declareService.update(declare, itemName, description, startTime, endTime, attachName, attachPath);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String declareIds) {
		try {
			for (String idStr : StringUtils.split(declareIds, ",")) {
				DeclareEntity declare = declareService.findOne(Long.parseLong(idStr));

				if (declare.getDeclareApplys().size() > 0) {
					return new Output(null, ReturnStatus.CONSTRAINT.status(), ReturnStatus.CONSTRAINT.msg());
				}
				declareService.delete(declare);
			}
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
			return new OutputList(declareService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(@RequestParam int page, @RequestParam int size) {
		try {
			return new OutputList(declareService.list(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByUserId", method = RequestMethod.POST)
	public OutputList listByUserId(@RequestParam Long userId) {
		try {
			return new OutputList(declareService.listByUserId(userId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByUserIdPaging", method = RequestMethod.POST)
	public OutputList listByUserIdPaging(@RequestParam Long userId, @RequestParam int page, @RequestParam int size) {
		try {
			return new OutputList(declareService.listByUserId(userId, page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listOnline", method = RequestMethod.POST)
	public OutputList listOnlineUnapply(@RequestParam Long enterpriseId) {
		try {
			List<DeclareEntity> list = declareService.listOnline();
			for (DeclareEntity declare : list) {
				DeclareApplyEntity apply = declareApplyService.findOne(declare.getId(), enterpriseId);
				if (apply != null) {
					declare.setApplyStatus(ApplyStatus.APPLY);
				}
			}
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listOnlinePaging", method = RequestMethod.POST)
	public OutputList listOnlineUnapplyPaging(@RequestParam Long enterpriseId, @RequestParam int page,
			@RequestParam int size) {
		try {
			List<DeclareEntity> list = declareService.listOnline(page, size);
			for (DeclareEntity declare : list) {
				DeclareApplyEntity apply = declareApplyService.findOne(declare.getId(), enterpriseId);
				if (apply != null) {
					declare.setApplyStatus(ApplyStatus.APPLY);
				}
			}
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long declareId) {
		try {
			DeclareEntity declare = declareService.findOne(declareId);
			return new Output(declare, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/online", method = RequestMethod.POST)
	public Output online(@RequestParam Long declareId) {
		try {
			DeclareEntity declare = declareService.findOne(declareId);
			declare.setStatus(DeclareStatus.ONLINE);
			declareService.save(declare);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/downline", method = RequestMethod.POST)
	public Output downline(@RequestParam Long declareId) {
		try {
			DeclareEntity declare = declareService.findOne(declareId);
			declare.setStatus(DeclareStatus.DOWNLINE);
			declareService.save(declare);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}
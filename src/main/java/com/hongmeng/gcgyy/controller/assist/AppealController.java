package com.hongmeng.gcgyy.controller.assist;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
import com.hongmeng.gcgyy.entity.assist.AppealEntity;
import com.hongmeng.gcgyy.entity.assist.AppealEntity.AppealStatus;
import com.hongmeng.gcgyy.entity.assist.EvaluateEntity;
import com.hongmeng.gcgyy.entity.assist.UrgeEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;
import com.hongmeng.gcgyy.entity.common.PushEntity;
import com.hongmeng.gcgyy.entity.common.PushEntity.PushType;
import com.hongmeng.gcgyy.entity.common.PushEntity.SendType;
import com.hongmeng.gcgyy.service.assist.AppealService;
import com.hongmeng.gcgyy.service.authority.DepartmentService;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.baseData.AppealTypeService;
import com.hongmeng.gcgyy.service.common.PushService;

@RestController
@RequestMapping("appeal")
public class AppealController {

	static Logger log = LoggerFactory.getLogger(AppealController.class);

	@Autowired
	AppealService appealService;

	@Autowired
	AppealTypeService appealTypeService;

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	DepartmentService departmentService;

	@Autowired
	UserService userService;

	@Autowired
	PushService pushService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam Long enterpriseId, @RequestParam String title, @RequestParam Long appealTypeId,
			@RequestParam String description) {
		try {
			EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
			AppealTypeEntity appealType = appealTypeService.findOne(appealTypeId);
			AppealEntity appeal = new AppealEntity(enterprise, title, appealType, description);
			appeal.setCreateTime(new Date());
			appealService.save(appeal);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long appealId, @RequestParam String title, @RequestParam Long appealTypeId,
			@RequestParam String description) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			AppealTypeEntity appealType = appealTypeService.findOne(appealTypeId);
			appealService.update(appeal, title, appealType, description);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String appealIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(appealIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			appealService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(appealService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(@RequestParam int page, @RequestParam int size) {
		try {
			return new OutputList(appealService.listPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	/**
	 * enterprise
	 */
	@RequestMapping(value = "/listByEnterpriseId", method = RequestMethod.POST)
	public OutputList listByEnterpriseId(@RequestParam Long enterpriseId) {
		try {
			return new OutputList(appealService.findByEnterpriseId(enterpriseId), ReturnStatus.SUCCESS.status(),
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
			return new OutputList(appealService.findByEnterpriseId(enterpriseId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByEnterpriseIdUnconfirm", method = RequestMethod.POST)
	public OutputList listByEnterpriseIdUnconfirm(@RequestParam Long enterpriseId) {
		try {
			return new OutputList(appealService.findByEnterpriseIdUnconfirm(enterpriseId),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByEnterpriseIdUnconfirmPaging", method = RequestMethod.POST)
	public OutputList listByEnterpriseIdUnconfirmPaging(@RequestParam Long enterpriseId, @RequestParam int page,
			@RequestParam int size) {
		try {
			return new OutputList(appealService.findByEnterpriseIdUnconfirm(enterpriseId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByEnterpriseIdConfirmed", method = RequestMethod.POST)
	public OutputList listByEnterpriseIdConfirmed(@RequestParam Long enterpriseId) {
		try {
			return new OutputList(appealService.findByEnterpriseIdConfirmed(enterpriseId),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByEnterpriseIdConfirmedPaging", method = RequestMethod.POST)
	public OutputList listByEnterpriseIdConfirmedPaging(@RequestParam Long enterpriseId, @RequestParam int page,
			@RequestParam int size) {
		try {
			return new OutputList(appealService.findByEnterpriseIdConfirmed(enterpriseId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/searchByEnterpriseName", method = RequestMethod.POST)
	public OutputList searchByEnterpriseName(@RequestParam String name) {
		try {
			return new OutputList(appealService.searchByEnterpriseName(name), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/searchByEnterpriseNamePaging", method = RequestMethod.POST)
	public OutputList searchByEnterpriseNamePaging(@RequestParam String name, @RequestParam int page,
			@RequestParam int size) {
		try {
			return new OutputList(appealService.searchByEnterpriseName(name, page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	/**
	 * department
	 */
	@RequestMapping(value = "/listByDepartmentId", method = RequestMethod.POST)
	public OutputList listByDepartmentId(@RequestParam Long departmentId) {
		try {
			return new OutputList(appealService.findByDepartmentId(departmentId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByDepartmentIdPaging", method = RequestMethod.POST)
	public OutputList listByDepartmentIdPaging(@RequestParam Long departmentId, @RequestParam int page,
			@RequestParam int size) {
		try {
			return new OutputList(appealService.findByDepartmentId(departmentId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByDepartmentIdUnconfirm", method = RequestMethod.POST)
	public OutputList listByDepartmentIdUnconfirm(@RequestParam Long departmentId) {
		try {
			return new OutputList(appealService.findByDepartmentIdUnconfirm(departmentId),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByDepartmentIdUnconfirmPaging", method = RequestMethod.POST)
	public OutputList listByDepartmentIdUnconfirmPaging(@RequestParam Long departmentId, @RequestParam int size,
			@RequestParam int page) {
		try {
			return new OutputList(appealService.findByDepartmentIdUnconfirm(departmentId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByDepartmentIdConfirmed", method = RequestMethod.POST)
	public OutputList listByDepartmentIdConfirmed(@RequestParam Long departmentId) {
		try {
			return new OutputList(appealService.findByDepartmentIdConfirmed(departmentId),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByDepartmentIdConfirmedPaging", method = RequestMethod.POST)
	public OutputList listByDepartmentIdConfirmedPaging(@RequestParam Long departmentId, @RequestParam int page,
			@RequestParam int size) {
		try {
			return new OutputList(appealService.findByDepartmentIdConfirmed(departmentId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/searchByDepartmentIdAndEnterpriseName", method = RequestMethod.POST)
	public OutputList searchByDepartmentIdAndEnterpriseName(@RequestParam Long departmentId,
			@RequestParam String name) {
		try {
			return new OutputList(appealService.findByDepartmentIdAndEnterpriseName(departmentId, name),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/searchByDepartmentIdAndEnterpriseNamePaging", method = RequestMethod.POST)
	public OutputList searchByDepartmentIdAndEnterpriseNamePaging(@RequestParam Long departmentId,
			@RequestParam String name, @RequestParam int page, @RequestParam int size) {
		try {
			return new OutputList(appealService.findByDepartmentIdAndEnterpriseName(departmentId, name, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	/**
	 * appeal other
	 */
	@RequestMapping(value = "/listByUserId", method = RequestMethod.POST)
	public OutputList listByUserId(@RequestParam Long userId) {
		try {
			Long enterpriseId = enterpriseService.findByUserId(userId);
			return new OutputList(appealService.findByEnterpriseId(enterpriseId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByUserIdPaging", method = RequestMethod.POST)
	public OutputList listByUserIdPaging(@RequestParam Long userId, @RequestParam int page, @RequestParam int size) {
		try {
			Long enterpriseId = enterpriseService.findByUserId(userId);
			return new OutputList(appealService.findByEnterpriseId(enterpriseId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByPointUserId", method = RequestMethod.POST)
	public OutputList listByPointUserId(@RequestParam Long pointUserId) {
		try {
			List<EnterpriseEntity> list = enterpriseService.listByPointUserId(pointUserId);
			return new OutputList(appealService.findByEnterpriseIn(list), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByPointUserIdPaging", method = RequestMethod.POST)
	public OutputList listByPointUserIdPaging(@RequestParam Long pointUserId, @RequestParam int page,
			@RequestParam int size) {
		try {
			List<EnterpriseEntity> list = enterpriseService.listByPointUserId(pointUserId);
			return new OutputList(appealService.findByEnterpriseIn(list, page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listUnconfirm", method = RequestMethod.POST)
	public OutputList listUnconfirm() {
		try {
			return new OutputList(appealService.findUnconfirm(), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listUnconfirmPaging", method = RequestMethod.POST)
	public OutputList listUnconfirmPaging(int page, int size) {
		try {
			return new OutputList(appealService.findUnconfirmPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listConfirmed", method = RequestMethod.POST)
	public OutputList listConfirmed() {
		try {
			return new OutputList(appealService.findConfirmed(), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listConfirmedPaging", method = RequestMethod.POST)
	public OutputList listConfirmedPaging(@RequestParam int page, @RequestParam int size) {
		try {
			return new OutputList(appealService.findConfirmedPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByAppealTypeId", method = RequestMethod.POST)
	public OutputList listByAppealTypeId(@RequestParam Long appealTypeId,
			@RequestParam(required = false) Long departmentId) {
		try {
			return new OutputList(appealService.findByAppealTypeId(appealTypeId, departmentId),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByAppealTypeIdPaging", method = RequestMethod.POST)
	public OutputList listByAppealTypeIdPaging(@RequestParam Long appealTypeId,
			@RequestParam(required = false) Long departmentId, @RequestParam int page, @RequestParam int size) {
		try {
			return new OutputList(appealService.findByAppealTypeId(appealTypeId, departmentId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long appealId) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			return new Output(appeal, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/addByApp", method = RequestMethod.POST)
	public Output addByApp(@RequestParam Long enterpriseId, @RequestParam String title, @RequestParam Long appealTypeId,
			@RequestParam String description) {
		try {
			EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
			AppealTypeEntity appealType = appealTypeService.findOne(appealTypeId);
			AppealEntity appeal = new AppealEntity(enterprise, title, appealType, description);
			appeal.setCreateTime(new Date());

			appeal.setSendTime(new Date());
			appeal.setStatus(AppealStatus.SENDING);
			appeal = appealService.save(appeal);

			// 派单员
			List<BaseUserEntity> dipatchers = userService.listDispatcher();
			for (BaseUserEntity dipatcher : dipatchers) {
				PushEntity push = new PushEntity(dipatcher, "您好，有新的诉求单需要派发！", appeal.getTitle(), SendType.DISPATCH,
						PushType.APPEAL, appeal.getId());
				pushService.push(push);
			}

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public Output send(@RequestParam Long appealId) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setStatus(AppealStatus.SENDING);
			appeal.setSendTime(new Date());
			appealService.save(appeal);

			// 派单员
			List<BaseUserEntity> dipatchers = userService.listDispatcher();
			for (BaseUserEntity dipatcher : dipatchers) {
				PushEntity push = new PushEntity(dipatcher, "您好，有新的诉求单需要派发！", appeal.getTitle(), SendType.DISPATCH,
						PushType.APPEAL, appealId);
				pushService.push(push);
			}

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/dispatch", method = RequestMethod.POST)
	public Output dispatch(@RequestParam Long appealId, @RequestParam Long departmentId,
			@RequestParam String dispatchOpinion) {
		try {
			DepartmentEntity department = departmentService.findOne(departmentId);
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setStatus(AppealStatus.PENDING);
			appeal.setDispatchTime(new Date());
			appeal.setDepartment(department);
			appeal.setDispatchOpinion(dispatchOpinion);
			appealService.save(appeal);

			// 企业
			List<BaseUserEntity> enterpriseUsers = appeal.getEnterprise().getUsers();
			for (BaseUserEntity enterpriseUser : enterpriseUsers) {
				PushEntity push = new PushEntity(enterpriseUser, "您好，诉求单已派发，请耐心等待！", appeal.getTitle(),
						SendType.ENTERPRISE, PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 相关部门
			List<BaseUserEntity> departmentUsers = department.getUsers();
			for (BaseUserEntity departmentUser : departmentUsers) {
				PushEntity push = new PushEntity(departmentUser, "您好，有新的诉求单需要处理！", appeal.getTitle(),
						SendType.DEPARTMENT, PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 监督员
			List<BaseUserEntity> monitors = userService.listMonitor();
			for (BaseUserEntity monitor : monitors) {
				PushEntity push = new PushEntity(monitor, "您好，诉求单已派发，请耐心等待！", appeal.getTitle(), SendType.MONITOR,
						PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 挂点人
			BaseUserEntity pointUser = appeal.getEnterprise().getPointUser();
			PushEntity push = new PushEntity(pointUser, "您好，诉求单已派发，请耐心等待！", appeal.getTitle(), SendType.POINT,
					PushType.APPEAL, appealId);
			pushService.push(push);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/urge", method = RequestMethod.POST)
	public Output urge(@RequestParam Long appealId, @RequestParam Long userId, @RequestParam String content) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			BaseUserEntity user = userService.findOneBase(userId);

			UrgeEntity urge = new UrgeEntity(appealId, user, content);
			urge.setCreateTime(new Date());
			appeal.getUrges().add(urge);

			// 待派发
			if (appeal.getStatus() == AppealStatus.SENDING) {
				// 派单员
				List<BaseUserEntity> dipatchers = userService.listDispatcher();
				for (BaseUserEntity dipatcher : dipatchers) {
					PushEntity push = new PushEntity(dipatcher, "您好，请尽快处理诉求单！", appeal.getTitle(), SendType.DISPATCH,
							PushType.APPEAL, appealId);
					pushService.push(push);
				}
			}
			// 待处理
			if (appeal.getStatus() == AppealStatus.PENDING) {
				// 相关部门
				List<BaseUserEntity> departmentUsers = appeal.getDepartment().getUsers();
				for (BaseUserEntity departmentUser : departmentUsers) {
					PushEntity push = new PushEntity(departmentUser, "您好，请尽快受理诉求单！", appeal.getTitle(),
							SendType.DEPARTMENT, PushType.APPEAL, appealId);
					pushService.push(push);
				}
			}
			// 处理中
			if (appeal.getStatus() == AppealStatus.PROCESSING) {
				// 相关部门
				List<BaseUserEntity> departmentUsers = appeal.getDepartment().getUsers();
				for (BaseUserEntity departmentUser : departmentUsers) {
					PushEntity push = new PushEntity(departmentUser, "您好，请尽快处理诉求单！", appeal.getTitle(),
							SendType.DEPARTMENT, PushType.APPEAL, appealId);
					pushService.push(push);
				}
			}

			appealService.save(appeal);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listUrge", method = RequestMethod.POST)
	public OutputList listUrge(@RequestParam Long appealId) {
		try {
			return new OutputList(appealService.getUrges(appealId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listUrgePaging", method = RequestMethod.POST)
	public OutputList listUrgePaging(@RequestParam Long appealId, @RequestParam int page, @RequestParam int size) {
		try {
			return new OutputList(appealService.getUrges(appealId, page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/reject", method = RequestMethod.POST)
	public Output reject(@RequestParam Long appealId, @RequestParam String rejectOpinion) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setAcceptTime(new Date());
			appeal.setHandleTime(new Date());
			appeal.setStatus(AppealStatus.REJECT);
			appeal.setRejectOpinion(rejectOpinion);
			appealService.save(appeal);

			// 企业
			List<BaseUserEntity> enterpriseUsers = appeal.getEnterprise().getUsers();
			for (BaseUserEntity enterpriseUser : enterpriseUsers) {
				PushEntity push = new PushEntity(enterpriseUser, "您好，很遗憾，诉求单被驳回！", appeal.getTitle(),
						SendType.ENTERPRISE, PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 监督员
			List<BaseUserEntity> monitors = userService.listMonitor();
			for (BaseUserEntity monitor : monitors) {
				PushEntity push = new PushEntity(monitor, "您好，很遗憾，诉求单被驳回！", appeal.getTitle(), SendType.MONITOR,
						PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 挂点人
			BaseUserEntity pointUser = appeal.getEnterprise().getPointUser();
			PushEntity push = new PushEntity(pointUser, "您好，很遗憾，诉求单被驳回！", appeal.getTitle(), SendType.POINT,
					PushType.APPEAL, appealId);
			pushService.push(push);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/accept", method = RequestMethod.POST)
	public Output accept(@RequestParam Long appealId) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setAcceptTime(new Date());
			appeal.setStatus(AppealStatus.PROCESSING);
			appealService.save(appeal);

			// 企业
			List<BaseUserEntity> enterpriseUsers = appeal.getEnterprise().getUsers();
			for (BaseUserEntity enterpriseUser : enterpriseUsers) {
				PushEntity push = new PushEntity(enterpriseUser, "您好，诉求单已受理成功，请耐心等待！", appeal.getTitle(),
						SendType.ENTERPRISE, PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 监督员
			List<BaseUserEntity> monitors = userService.listMonitor();
			for (BaseUserEntity monitor : monitors) {
				PushEntity push = new PushEntity(monitor, "您好，诉求单已受理成功，请耐心等待！", appeal.getTitle(), SendType.MONITOR,
						PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 挂点人
			BaseUserEntity pointUser = appeal.getEnterprise().getPointUser();
			PushEntity push = new PushEntity(pointUser, "您好，诉求单已受理成功，请耐心等待！", appeal.getTitle(), SendType.POINT,
					PushType.APPEAL, appealId);
			pushService.push(push);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/handle", method = RequestMethod.POST)
	public Output handle(@RequestParam Long appealId) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setHandleTime(new Date());
			appeal.setStatus(AppealStatus.UNCONFIRM);
			appealService.save(appeal);

			// 企业
			List<BaseUserEntity> enterpriseUsers = appeal.getEnterprise().getUsers();
			for (BaseUserEntity enterpriseUser : enterpriseUsers) {
				PushEntity push = new PushEntity(enterpriseUser, "您好，诉求单已办结，请确认！", appeal.getTitle(),
						SendType.ENTERPRISE, PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 监督员
			List<BaseUserEntity> monitors = userService.listMonitor();
			for (BaseUserEntity monitor : monitors) {
				PushEntity push = new PushEntity(monitor, "您好，诉求单已办结，请确认！", appeal.getTitle(), SendType.MONITOR,
						PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 挂点人
			BaseUserEntity pointUser = appeal.getEnterprise().getPointUser();
			PushEntity push = new PushEntity(pointUser, "您好，诉求单已办结，请确认！", appeal.getTitle(), SendType.POINT,
					PushType.APPEAL, appealId);
			pushService.push(push);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public Output confirm(@RequestParam Long appealId, @RequestParam Integer acceptSpeed,
			@RequestParam Integer processSpeed, @RequestParam Integer result, @RequestParam String evaluation) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setStatus(AppealStatus.CONFIRMED);

			EvaluateEntity evaluate = new EvaluateEntity(acceptSpeed, processSpeed, result, evaluation);
			evaluate.setCreateTime(new Date());
			appeal.setEvaluate(evaluate);
			appealService.save(appeal);

			// 相关部门
			List<BaseUserEntity> departmentUsers = appeal.getDepartment().getUsers();
			for (BaseUserEntity departmentUser : departmentUsers) {
				PushEntity push = new PushEntity(departmentUser, "您好，诉求单已成功办结！", appeal.getTitle(), SendType.DEPARTMENT,
						PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 监督员
			List<BaseUserEntity> monitors = userService.listMonitor();
			for (BaseUserEntity monitor : monitors) {
				PushEntity push = new PushEntity(monitor, "您好，诉求单已成功办结！", appeal.getTitle(), SendType.MONITOR,
						PushType.APPEAL, appealId);
				pushService.push(push);
			}
			// 挂点人
			BaseUserEntity pointUser = appeal.getEnterprise().getPointUser();
			PushEntity push = new PushEntity(pointUser, "您好，诉求单已成功办结！", appeal.getTitle(), SendType.POINT,
					PushType.APPEAL, appealId);
			pushService.push(push);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	// xiaye
	@RequestMapping(value = "/getAppealCountByType", method = RequestMethod.POST)
	public OutputList getAppealCountByType(@RequestParam(required = false) Long departmentId) {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		List<Object[]> list = appealService.getAppealCountByType(departmentId);
		for (int y = 0; y < list.size(); y++) {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("appealTypeId", list.get(y)[0]);
			resultMap.put("appealTypeName", list.get(y)[1]);
			resultMap.put("count", list.get(y)[2]);
			resultList.add(resultMap);
		}
		try {
			return new OutputList(resultList, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	// xiaye
	@RequestMapping(value = "/overAppealDays", method = RequestMethod.POST)
	public OutputList getAppealDays(@RequestParam(required = false) Long departmentId,
			@RequestParam(required = false) Long appealTypeId, @RequestParam int page, @RequestParam int size) {
		List<AppealEntity> list = new ArrayList<AppealEntity>();
		try {
			List<BigInteger> allData = appealService.getAllOverDaysByTypeId(departmentId, appealTypeId, page, size);
			for (int x = 0; x < allData.size(); x++) {
				list.add(appealService.findOne(((BigInteger) allData.get(x)).longValue()));
			}
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/overAppealDaysPC", method = RequestMethod.POST)
	public OutputList getAppealDaysPC(@RequestParam(required = false) Long enterpriseId,
			@RequestParam(required = false) Long departmentId) {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		List<AppealTypeEntity> aptList = appealTypeService.list();
		if (aptList.size() == 0) {
			return new OutputList(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		}
		try {
			for (int i = 0; i < aptList.size(); i++) {
				List<AppealEntity> acceptDays = new ArrayList<AppealEntity>();
				List<AppealEntity> handleDays = new ArrayList<AppealEntity>();
				Map<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("appealTypeName", aptList.get(i).getName());
				List<BigInteger> acceptDaysData = appealService.getOverAcceptDays(departmentId, enterpriseId,
						aptList.get(i).getId());
				for (int x = 0; x < acceptDaysData.size(); x++) {
					acceptDays.add(appealService.findOne(((BigInteger) acceptDaysData.get(x)).longValue()));
				}
				List<BigInteger> handleDaysData = appealService.getOverHandleDays(departmentId, enterpriseId,
						aptList.get(i).getId());
				for (int x = 0; x < handleDaysData.size(); x++) {
					handleDays.add(appealService.findOne(((BigInteger) handleDaysData.get(x)).longValue()));
				}
				resultMap.put("acceptDays", acceptDays);
				resultMap.put("handleDays", handleDays);
				resultList.add(resultMap);
			}
			return new OutputList(resultList, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/overAppealDaysBypointUser", method = RequestMethod.POST)
	public Output getAppealDaysByPointUser(@RequestParam Long pointUserId) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<EnterpriseEntity> list = enterpriseService.listByPointUserId(pointUserId);
		List<AppealEntity> acceptDays = new ArrayList<AppealEntity>();
		List<AppealEntity> handleDays = new ArrayList<AppealEntity>();
		try {
			for (int i = 0; i < list.size(); i++) {
				List<BigInteger> acceptDaysData = appealService.getOverAcceptDays(list.get(i).getId());
				for (int x = 0; x < acceptDaysData.size(); x++) {
					acceptDays.add(appealService.findOne(((BigInteger) acceptDaysData.get(x)).longValue()));
				}
				List<BigInteger> handleDaysData = appealService.getOverHandleDays(list.get(i).getId());
				for (int x = 0; x < handleDaysData.size(); x++) {
					handleDays.add(appealService.findOne(((BigInteger) handleDaysData.get(x)).longValue()));
				}
			}
			resultMap.put("acceptDays", acceptDays);
			resultMap.put("handleDays", handleDays);
			return new Output(resultMap, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/overAppealDaysCount", method = RequestMethod.POST)
	public Output overAppealDaysCount(@RequestParam(required = false) Long departmentId) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<AppealTypeEntity> aptList = appealTypeService.list();
		if (aptList.size() == 0) {
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		}
		String[] appealTypeNameData = new String[aptList.size()];
		Long[] appealTypeIdData = new Long[aptList.size()];
		BigInteger[] acceptDaysCountData = new BigInteger[aptList.size()];
		BigInteger[] handleDaysCountData = new BigInteger[aptList.size()];
		try {
			for (int i = 0; i < aptList.size(); i++) {
				appealTypeNameData[i] = aptList.get(i).getName();
				appealTypeIdData[i] = aptList.get(i).getId();
				BigInteger acceptDaysCount = appealService.getOverAcceptDaysCount(departmentId, aptList.get(i).getId());
				BigInteger handleDaysCount = appealService.getOverHandleDaysCount(departmentId, aptList.get(i).getId());
				acceptDaysCountData[i] = acceptDaysCount;
				handleDaysCountData[i] = handleDaysCount;
			}
			resultMap.put("appealTypeName", appealTypeNameData);
			resultMap.put("appealTypeId", appealTypeIdData);
			resultMap.put("acceptDaysCount", acceptDaysCountData);
			resultMap.put("handleDaysCount", handleDaysCountData);
			return new Output(resultMap, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/appealStatusCount", method = RequestMethod.POST)
	public Output getStatusCount(@RequestParam(required = false) Long departmentId) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<AppealTypeEntity> aptList = appealTypeService.list();
		try {
			for (int x = 0; x < aptList.size(); x++) {
				Map<String, List<AppealEntity>> map = new HashMap<String, List<AppealEntity>>();
				for (int i = 0; i < 7; i++) {
					List<AppealEntity> list = appealService.findByAppealTypeIdAndStatus(aptList.get(x).getId(), i,
							departmentId);
					map.put(String.valueOf(i), list);
				}
				resultMap.put(aptList.get(x).getName(), map);
			}
			return new Output(resultMap, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
}
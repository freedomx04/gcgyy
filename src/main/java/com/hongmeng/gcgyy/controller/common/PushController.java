package com.hongmeng.gcgyy.controller.common;

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
import com.hongmeng.gcgyy.entity.common.PushEntity;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.common.PushService;

@RestController
@RequestMapping("push")
public class PushController {

	static Logger log = LoggerFactory.getLogger(PushController.class);

	@Autowired
	PushService pushService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String pushIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(pushIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			pushService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByUserId", method = RequestMethod.POST)
	public OutputList listByUserId(@RequestParam Long userId) {
		try {
			return new OutputList(pushService.listByUserId(userId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByUserIdPaging", method = RequestMethod.POST)
	public OutputList listByUserIdPaging(@RequestParam Long userId, @RequestParam int page, @RequestParam int size) {
		try {
			return new OutputList(pushService.listByUserId(userId, page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long pushId) {
		try {
			PushEntity push = pushService.findOne(pushId);
			return new Output(push, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/pushByUserId", method = RequestMethod.POST)
	public Output pushByUserId(@RequestParam Long userId) {
		try {
			pushService.pushByUserId(userId);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}
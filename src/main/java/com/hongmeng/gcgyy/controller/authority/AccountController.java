package com.hongmeng.gcgyy.controller.authority;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.utils.CiphersUtils;
import com.hongmeng.gcgyy.common.utils.CurrentUserUtils;
import com.hongmeng.gcgyy.common.utils.DeviceUtils;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.RoleEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity.UserStatus;
import com.hongmeng.gcgyy.entity.common.LoginEntity;
import com.hongmeng.gcgyy.entity.common.LoginEntity.DeviceType;
import com.hongmeng.gcgyy.entity.common.LoginEntity.LoginType;
import com.hongmeng.gcgyy.service.authority.RoleService;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.common.LoginService;

@RestController
@RequestMapping("account")
public class AccountController {

	static Logger log = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	UserService userService;

	@Autowired
	HttpServletRequest request;

	@Autowired
	LoginService loginService;

	@Autowired
	RoleService roleService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public Output register(@RequestParam String username, @RequestParam String password,
			@RequestParam String telephone) {
		try {
			UserEntity user = userService.findByUsername(username);
			if (user != null) {
				return new Output(null, ReturnStatus.USER_EXISTED.status(), ReturnStatus.USER_EXISTED.msg());
			}

			user = new UserEntity(username, CiphersUtils.getInstance().MD5Password(password), telephone);
			user.setName(username);

			RoleEntity role = roleService.findByName("游客");
			user.setRole(role);

			user.setCreateTime(new Date());
			userService.save(user);
			return new Output(null, ReturnStatus.USER_REGISTER_SUCCESS.status(),
					ReturnStatus.USER_REGISTER_SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Output login(@RequestParam String username, @RequestParam String password,
			@RequestParam(required = false) String deviceToken) {
		try {
			UserEntity user = userService.findByUsername(username);

			if (user == null) { // 用户不存在
				return new Output(null, ReturnStatus.NULL.status(), ReturnStatus.NULL.msg());
			}
			if (user.getStatus() == UserStatus.STATUS_NO_VALID) { // 用户被禁用
				return new Output(null, ReturnStatus.USER_STATUS_NO_VALID.status(), ReturnStatus.USER_STATUS_NO_VALID.msg());
			}
			if (!StringUtils.equals(CiphersUtils.getInstance().MD5Password(password), user.getPassword())) { // 密码错误
				return new Output(null, ReturnStatus.USER_PWD_ERROR.status(), ReturnStatus.USER_PWD_ERROR.msg());
			}

			BaseUserEntity baseUser = userService.findOneBase(user.getId());
			Integer loginType = DeviceUtils.getLoginType(request);
			LoginEntity login = loginService.findByUserAndLoginType(baseUser, loginType);
			if (login == null) {
				login = new LoginEntity(baseUser, loginType, new Date());
			}

			if (loginType == LoginType.MOBILE) {
				Integer deviceType = DeviceUtils.getDeviceType(request);
				login.setDeviceType(deviceType);
				login.setDeviceToken(deviceToken);
			} else {
				login.setDeviceType(DeviceType.WEB);
				login.setLoginIp(request.getRemoteAddr());
				CurrentUserUtils.getInstance().serUser(baseUser);
			}
			loginService.save(login);

			return new Output(user, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public Output logout(@RequestParam Long userId) {
		try {
			BaseUserEntity user = userService.findOneBase(userId);
			if (user == null) {
				return new Output(null, ReturnStatus.NULL.status(), ReturnStatus.NULL.msg());
			}

			Integer loginType = DeviceUtils.getLoginType(request);
			LoginEntity login = loginService.findByUserAndLoginType(user, loginType);
			if (loginType == LoginType.MOBILE) {

			} else {
				CurrentUserUtils.getInstance().removeUser();
			}
			loginService.delete(login);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/loginStatus", method = RequestMethod.POST)
	public Boolean loginStatus() {
		try {
			Object obj = request.getSession().getAttribute("cur_user");
			if (obj == null || !(obj instanceof BaseUserEntity)) {
				return false;
			}
			return true;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return false;
		}
	}
	
	@RequestMapping(value = "/getCurrentUser", method = RequestMethod.POST)
	public Object getCurrentUser() {
		try {
			Object obj = request.getSession().getAttribute("cur_user");
			return obj;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return null;
		}
	}
	
}
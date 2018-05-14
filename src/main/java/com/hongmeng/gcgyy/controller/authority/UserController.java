package com.hongmeng.gcgyy.controller.authority;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.utils.CiphersUtils;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.RoleEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity.UserStatus;
import com.hongmeng.gcgyy.service.authority.DepartmentService;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.authority.RoleService;
import com.hongmeng.gcgyy.service.authority.UserService;

@RestController
@RequestMapping("user")
public class UserController {

	static Logger log = LoggerFactory.getLogger(UserController.class);

	@Value("${customize.initPassword}")
	private String initPassword;

	@Autowired
	UserService userService;

	@Autowired
	DepartmentService departmentService;

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	RoleService roleService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String username, @RequestParam String name, @RequestParam String officephone,
			@RequestParam String telephone, @RequestParam Integer sex, @RequestParam String email,
			@RequestParam String address, @RequestParam(required = false) Long departmentId,
			@RequestParam(required = false) Long enterpriseId, @RequestParam Long roleId,
			@RequestParam(required = false) String description) {
		try {
			UserEntity user = userService.findByUsername(username);
			if (user != null) {
				return new Output(null, ReturnStatus.USER_EXISTED.status(), ReturnStatus.USER_EXISTED.msg());
			}

			DepartmentEntity department = departmentId != null ? departmentService.findOne(departmentId) : null;
			EnterpriseEntity enterprise = enterpriseId != null ? enterpriseService.findOne(enterpriseId) : null;
			RoleEntity role = roleService.findOne(roleId);

			user = new UserEntity(username, name, officephone, telephone, sex, email, address, department, enterprise,
					role, description);
			user.setPassword(CiphersUtils.getInstance().string2MD5(initPassword));
			user.setCreateTime(new Date());
			userService.save(user);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long userId, @RequestParam String name, @RequestParam String officephone,
			@RequestParam String telephone, @RequestParam Integer sex, @RequestParam String email,
			@RequestParam String address, @RequestParam(required = false) Long departmentId,
			@RequestParam(required = false) Long enterpriseId, @RequestParam(required = false) Long roleId,
			@RequestParam(required = false) String description) {
		try {
			UserEntity user = userService.findOne(userId);
			DepartmentEntity department = departmentId != null ? departmentService.findOne(departmentId) : null;
			EnterpriseEntity enterprise = enterpriseId != null ? enterpriseService.findOne(enterpriseId) : null;
			RoleEntity role = roleId != null ? roleService.findOne(roleId) : null;

			userService.update(user, name, officephone, telephone, sex, email, address, department, enterprise, role,
					description);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam Long userId) {
		try {
			userService.delete(userId);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/status", method = RequestMethod.POST)
	public Output status(@RequestParam Long userId, @RequestParam Integer status) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setStatus(status);
			userService.save(user);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listBase", method = RequestMethod.POST)
	public OutputList listBase() {
		try {
			return new OutputList(userService.listBase(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(userService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(int page, int size) {
		try {
			return new OutputList(userService.list(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long userId) {
		try {
			return new Output(userService.findOne(userId), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public Output changePassword(@RequestParam Long userId, @RequestParam String oldPassword,
			@RequestParam String newPassword) {
		try {
			UserEntity user = userService.findOne(userId);
			if (!StringUtils.equals(CiphersUtils.getInstance().MD5Password(oldPassword), user.getPassword())) {
				return new Output(null, ReturnStatus.USER_PWD_ERROR.status(), ReturnStatus.USER_PWD_ERROR.msg());
			}

			user.setPassword(CiphersUtils.getInstance().MD5Password(newPassword));
			userService.save(user);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/changeImage", method = RequestMethod.POST)
	public Output changeImage(@RequestParam Long userId, @RequestParam String imagePath) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setImagePath(imagePath);
			userService.save(user);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/findByUsername", method = RequestMethod.POST)
	public Output findByUsername(@RequestParam String username) {
		try {
			UserEntity user = userService.findByUsername(username);
			if (user == null) {
				return new Output(null, ReturnStatus.NULL.status(), ReturnStatus.NULL.msg());
			}
			return new Output(user, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/infoEdit", method = RequestMethod.POST)
	public Output infoEdit(@RequestParam Long userId, @RequestParam String name,
			@RequestParam(required = false) Integer sex, @RequestParam String description,
			@RequestParam String position, @RequestParam String officephone) {
		try {
			UserEntity user = userService.findOne(userId);
			userService.update(user, sex, name, description, position, officephone);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listDispatcher", method = RequestMethod.POST)
	public OutputList listDispatcher() {
		try {
			return new OutputList(userService.listDispatcher(), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listMonitor", method = RequestMethod.POST)
	public OutputList listMonitor() {
		try {
			return new OutputList(userService.listMonitor(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/bind", method = RequestMethod.POST)
	public Output bind(String username, String password, String wxUserId) {
		try {
			UserEntity user = userService.findByUsername(username);
			
			if (user == null) { // 用户不存在
				return new Output(null, ReturnStatus.NULL.status(), ReturnStatus.NULL.msg());
			}
			
			if (user.getStatus() == UserStatus.STATUS_NO_VALID) { // 用户被禁用
				return new Output(null, ReturnStatus.USER_STATUS_NO_VALID.status(), ReturnStatus.USER_STATUS_NO_VALID.msg());
			}
			
			if (!StringUtils.equals(CiphersUtils.getInstance().string2MD5(password), user.getPassword())) { // 密码错误
				return new Output(null, ReturnStatus.USER_PWD_ERROR.status(), ReturnStatus.USER_PWD_ERROR.msg());
			}
			
			if (user.getWxUserId() != null) {
				return new Output(null, ReturnStatus.USER_WXUSERID_EXISTED.status(), ReturnStatus.USER_WXUSERID_EXISTED.msg());
			}
			
			// 保存wxUserId
			user.setWxUserId(wxUserId);
			userService.save(user);
			
			return new Output(user, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/removeBind", method = RequestMethod.GET)
	public Output removeBind(Long userId) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setWxUserId(null);
			userService.save(user);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}
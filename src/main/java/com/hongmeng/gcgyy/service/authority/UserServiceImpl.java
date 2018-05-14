package com.hongmeng.gcgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.assist.UrgeEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.RoleEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.common.LoginEntity;
import com.hongmeng.gcgyy.entity.common.PushEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareEntity;
import com.hongmeng.gcgyy.entity.industryService.JobEntity;
import com.hongmeng.gcgyy.repository.assist.UrgeRepository;
import com.hongmeng.gcgyy.repository.authority.BaseUserRepository;
import com.hongmeng.gcgyy.repository.authority.EnterpriseRepository;
import com.hongmeng.gcgyy.repository.authority.UserRepository;
import com.hongmeng.gcgyy.repository.common.LoginRepository;
import com.hongmeng.gcgyy.repository.common.PushRepository;
import com.hongmeng.gcgyy.repository.industryService.DeclareRepository;
import com.hongmeng.gcgyy.repository.industryService.JobRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	BaseUserRepository baseUserRepository;
	
	@Autowired
	RoleService roleService;

	@Override
	public UserEntity findOne(Long userId) {
		return userRepository.findOne(userId);
	}

	@Override
	public BaseUserEntity findOneBase(Long userId) {
		return baseUserRepository.findOne(userId);
	}

	@Override
	public UserEntity findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public void save(UserEntity user) {
		userRepository.save(user);
	}
	
	@Autowired
	EnterpriseRepository enterpriseRepository;
	@Autowired
	JobRepository jobRepository;
	@Autowired
	DeclareRepository declareRepository;
	@Autowired
	UrgeRepository urgeRepository;
	@Autowired
	LoginRepository loginRepository;
	@Autowired
	PushRepository pushRepository;
	
	@Override
	public void delete(Long userId) {
		UserEntity user = userRepository.findOne(userId);
		
		// 用户关联的角色,企业,部门
		user.setRole(null);
		user.setEnterprise(null);
		user.setDepartment(null);
		
		// 企业挂点人
		List<EnterpriseEntity> enterpriseList = enterpriseRepository.findByPointUserId(userId);
		for (EnterpriseEntity enterprise: enterpriseList) {
			enterprise.setPointUser(null);
			enterpriseRepository.save(enterprise);
		}
		
		// 求职
		Iterable<JobEntity> jobList = jobRepository.findByUserId(userId);
		jobRepository.delete(jobList);
		
		// 申报
		List<DeclareEntity> declareList = declareRepository.findByUserIdOrderByCreateTimeDesc(userId);
		for (DeclareEntity declare: declareList) {
			declare.setUser(null);
			declareRepository.save(declare);
		}
		
		// 催办
		List<UrgeEntity> urgeList = urgeRepository.findByUserId(userId);
		for (UrgeEntity urge: urgeList) {
			urge.setUser(null);
			urgeRepository.save(urge);
		}
		
		// 登录
		List<LoginEntity> loginList = loginRepository.findByUserId(userId);
		loginRepository.delete(loginList);
		
		// 推送
		List<PushEntity> pushList = pushRepository.findByUserIdOrderByCreateTimeDesc(userId);
		pushRepository.delete(pushList);
		
		// 删完所以关联后再删除该用户
		userRepository.delete(user);
	}
	
	@Override
	public List<BaseUserEntity> listBase() {
		return (List<BaseUserEntity>) baseUserRepository.findAll();
	}

	@Override
	public List<UserEntity> list() {
		return (List<UserEntity>) userRepository.findAll();
	}

	@Override
	public List<UserEntity> list(int page, int size) {
		Page<UserEntity> userPage = userRepository.findAll(new PageRequest(page, size));
		return userPage.getContent();
	}

	@Override
	public void update(UserEntity user, String name, String officephone, String telephone, Integer sex, String email,
			String address, DepartmentEntity department, EnterpriseEntity enterprise, RoleEntity role, String description) {
		user.setName(name);
		user.setOfficephone(officephone);
		user.setTelephone(telephone);
		user.setSex(sex);
		user.setEmail(email);
		user.setAddress(address);
		user.setDepartment(department);
		user.setEnterprise(enterprise);
		user.setRole(role);
		user.setDescription(description);
		userRepository.save(user);
	}

	@Override
	public void update(UserEntity user, Integer sex, String name, String description, String position, String officephone) {
		user.setName(name);
		user.setSex(sex);
		user.setDescription(description);
		user.setPosition(position);
		user.setOfficephone(officephone);
		userRepository.save(user);
	}

	@Override
	public List<BaseUserEntity> listDispatcher() {
		List<RoleEntity> roleList = roleService.searchByResource("assist_appeal_dispatcher");
		return baseUserRepository.findByRoleIn(roleList);
	}

	@Override
	public List<BaseUserEntity> listMonitor() {
		List<RoleEntity> roleList = roleService.searchByResource("assist_appeal_monitor");
		return baseUserRepository.findByRoleIn(roleList);
	}

	@Override
	public UserEntity findByWxUserId(String wxUserId) {
		return userRepository.findByWxUserId(wxUserId);
	}

}
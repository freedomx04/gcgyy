package com.hongmeng.gcgyy.service.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.common.LoginEntity;
import com.hongmeng.gcgyy.repository.common.LoginRepository;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginRepository loginRepository;
	
	@Override
	public void save(LoginEntity login) {
		loginRepository.save(login);
	}
	
	@Override
	public void delete(LoginEntity login) {
		loginRepository.delete(login);
	}

	@Override
	public LoginEntity findByUserAndLoginType(BaseUserEntity user, Integer loginType) {
		return loginRepository.findByUserAndLoginType(user, loginType);
	}
}
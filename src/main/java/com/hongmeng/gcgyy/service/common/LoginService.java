package com.hongmeng.gcgyy.service.common;

import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.common.LoginEntity;

public interface LoginService {
	
	void save(LoginEntity login);
	
	void delete(LoginEntity login);
	
	LoginEntity findByUserAndLoginType(BaseUserEntity user, Integer loginType);

}

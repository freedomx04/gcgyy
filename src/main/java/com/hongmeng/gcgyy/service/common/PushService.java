package com.hongmeng.gcgyy.service.common;

import java.util.List;

import com.hongmeng.gcgyy.entity.common.PushEntity;

public interface PushService {
	
	PushEntity findOne(Long pushId);
	
	void save(PushEntity push);
	
	void delete(List<Long> pushIds);
	
	List<PushEntity> list();
	
	List<PushEntity> listByUserId(Long userId);
	
	List<PushEntity> listByUserId(Long userId, int page, int size);
	
	void push(PushEntity push);
	
	void pushByUserId(Long userId);
	
	String getContent(PushEntity push);

}

package com.hongmeng.gcgyy.service.common;

import java.util.List;

import com.hongmeng.gcgyy.entity.common.VersionEntity;

public interface VersionService {
	
	VersionEntity findOne(Long versionId);
	
	VersionEntity findOne(Integer code);
	
	void save(VersionEntity version);
	
	List<VersionEntity> list();
	
	VersionEntity findLastest();
	
	void delete(List<Long> versionIds);
	
}

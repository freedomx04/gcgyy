package com.hongmeng.gcgyy.repository.common;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.common.VersionEntity;

public interface VersionRepository extends CrudRepository<VersionEntity, Long> {
	
	VersionEntity findByCode(Integer code);
	
	List<VersionEntity> findByOrderByCodeDesc();
	
	Iterable<VersionEntity> findByIdIn(List<Long> versionIds);

}

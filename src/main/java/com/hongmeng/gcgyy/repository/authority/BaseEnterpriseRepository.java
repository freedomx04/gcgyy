package com.hongmeng.gcgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;

public interface BaseEnterpriseRepository extends PagingAndSortingRepository<BaseEnterpriseEntity, Long> {
	
	BaseEnterpriseEntity findByName(String name);

	List<BaseEnterpriseEntity> findByAreaId(Long areaId);
	
	List<BaseEnterpriseEntity> findByProductTypeId(Long productTypeId);
	
	List<BaseEnterpriseEntity> findByPointStatus(Integer pointStatus);
	
	List<BaseEnterpriseEntity> findByNameContaining(String name);
	
}

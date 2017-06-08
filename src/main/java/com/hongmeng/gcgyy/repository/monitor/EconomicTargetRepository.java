package com.hongmeng.gcgyy.repository.monitor;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.monitor.EconomicTargetEntity;

public interface EconomicTargetRepository extends PagingAndSortingRepository<EconomicTargetEntity, Long> {
	
	Iterable<EconomicTargetEntity> findByIdIn(List<Long> economicTargetIds);	
	
	Iterable<EconomicTargetEntity> findByEnterpriseId(Long enterpriseId);
	
	EconomicTargetEntity findByEnterpriseIdAndYear(Long enterpriseId, String year);
	
}

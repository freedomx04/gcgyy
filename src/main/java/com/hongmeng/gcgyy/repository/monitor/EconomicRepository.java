package com.hongmeng.gcgyy.repository.monitor;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicEntity;

public interface EconomicRepository extends PagingAndSortingRepository<EconomicEntity, Long> {
	
	Iterable<EconomicEntity> findByIdIn(List<Long> economicIds);	
	
	Iterable<EconomicEntity> findByEnterpriseId(Long enterpriseId);
	
	List<EconomicEntity> findByMonthly(String monthly);
	
	Page<EconomicEntity> findByMonthly(String monthly, Pageable pageable);
	
	List<EconomicEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId);
	
	Page<EconomicEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId, Pageable pageable);
	
	EconomicEntity findByMonthlyAndEnterpriseId(String monthly, Long enterpriseId);
	
	List<EconomicEntity> findByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list);
	
	List<EconomicEntity> findByMonthlyInAndEnterpriseId(List<String> monthlyList, Long enterpriseId);

}

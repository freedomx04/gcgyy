package com.hongmeng.gcgyy.repository.monitor;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;

public interface EnergyRepository extends PagingAndSortingRepository<EnergyEntity, Long> {
	
	Iterable<EnergyEntity> findByIdIn(List<Long> energyIds);	
	
	Iterable<EnergyEntity> findByEnterpriseId(Long enterpriseId);
	
	List<EnergyEntity> findByMonthly(String monthly);
	
	Page<EnergyEntity> findByMonthly(String monthly, Pageable pageable);
	
	List<EnergyEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId);
	
	Page<EnergyEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId, Pageable pageable);
	
	EnergyEntity findByMonthlyAndEnterpriseId(String monthly, Long enterpriseId);
	
	List<EnergyEntity> findByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list);
	
	List<EnergyEntity> findByMonthlyInAndEnterpriseId(List<String> monthlyList, Long enterpriseId);

}

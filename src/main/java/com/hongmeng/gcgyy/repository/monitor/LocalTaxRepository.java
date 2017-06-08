package com.hongmeng.gcgyy.repository.monitor;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;

public interface LocalTaxRepository extends PagingAndSortingRepository<LocalTaxEntity, Long> {

	Iterable<LocalTaxEntity> findByIdIn(List<Long> localTaxIds);
	
	Iterable<LocalTaxEntity> findByEnterpriseId(Long enterpriseId);

	LocalTaxEntity findByMonthlyAndEnterpriseId(String monthly, Long enterpriseId);

	List<LocalTaxEntity> findByMonthlyBetween(String startMonthly, String endMonthly);

	Page<LocalTaxEntity> findByMonthlyBetween(String startMonthly, String endMonthly, Pageable pageable);

	List<LocalTaxEntity> findByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list);

	List<LocalTaxEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId);

	Page<LocalTaxEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId, Pageable pageable);
}

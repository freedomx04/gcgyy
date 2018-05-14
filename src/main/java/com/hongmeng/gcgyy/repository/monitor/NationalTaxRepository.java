package com.hongmeng.gcgyy.repository.monitor;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;

public interface NationalTaxRepository extends PagingAndSortingRepository<NationalTaxEntity, Long> {

	Iterable<NationalTaxEntity> findByIdIn(List<Long> nationalTaxIds);
	
	Iterable<NationalTaxEntity> findByEnterpriseId(Long enterpriseId);

	NationalTaxEntity findByMonthlyAndEnterpriseId(String monthly, Long enterpriseId);

	List<NationalTaxEntity> findByMonthlyBetween(String startMonthly, String endMonthly);

	Page<NationalTaxEntity> findByMonthlyBetween(String startMonthly, String endMonthly, Pageable pageable);

	List<NationalTaxEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId);

	Page<NationalTaxEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId, Pageable pageable);

	List<NationalTaxEntity> findByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list);
}

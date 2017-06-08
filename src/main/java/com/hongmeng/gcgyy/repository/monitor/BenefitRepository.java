package com.hongmeng.gcgyy.repository.monitor;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.BenefitEntity;

public interface BenefitRepository extends PagingAndSortingRepository<BenefitEntity, Long> {

	Iterable<BenefitEntity> findByIdIn(List<Long> benefitIds);
	
	Iterable<BenefitEntity> findByEnterpriseId(Long enterpriseId);

	List<BenefitEntity> findByMonthly(String monthly);

	Page<BenefitEntity> findByMonthly(String monthly, Pageable pageable);

	List<BenefitEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId);

	Page<BenefitEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId, Pageable pageable);

	BenefitEntity findByMonthlyAndEnterpriseId(String monthly, Long enterpriseId);

	List<BenefitEntity> findByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list);

}

package com.hongmeng.gcgyy.repository.industryService;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.industryService.HireEntity;

public interface HireRepository extends PagingAndSortingRepository<HireEntity, Long> {

	Iterable<HireEntity> findByIdIn(List<Long> hireIds);

	Iterable<HireEntity> findByEnterpriseId(Long enterpriseId);

	Page<HireEntity> findAllByOrderByCreateTimeDesc(Pageable pageable);

	Page<HireEntity> findAllByEnterpriseIdOrderByCreateTimeDesc(Long enterpriseId, Pageable pageable);

}

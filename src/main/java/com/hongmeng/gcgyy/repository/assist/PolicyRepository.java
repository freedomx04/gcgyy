package com.hongmeng.gcgyy.repository.assist;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.assist.PolicyEntity;

public interface PolicyRepository extends PagingAndSortingRepository<PolicyEntity, Long> {
	
	Iterable<PolicyEntity> findByIdIn(List<Long> policyIds);
	
	List<PolicyEntity> findAllByOrderByCreateTimeDesc();
	
	Page<PolicyEntity> findAllByOrderByCreateTimeDesc(Pageable pageable);

}

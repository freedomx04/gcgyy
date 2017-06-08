package com.hongmeng.gcgyy.repository.assist;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.assist.UrgeEntity;

public interface UrgeRepository extends PagingAndSortingRepository<UrgeEntity, Long> {
	
	List<UrgeEntity> findByAppealIdOrderByCreateTimeDesc(Long appealId);
	
	Page<UrgeEntity> findByAppealIdOrderByCreateTimeDesc(Long appealId, Pageable pageable);

	List<UrgeEntity> findByUserId(Long userId);
	
}

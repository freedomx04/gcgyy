package com.hongmeng.gcgyy.repository.common;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.common.PushEntity;

public interface PushRepository extends PagingAndSortingRepository<PushEntity, Long> {
	
	Iterable<PushEntity> findByIdIn(List<Long> pushIds);
	
	List<PushEntity> findByUserIdOrderByCreateTimeDesc(Long userId);
	
	Page<PushEntity> findByUserIdOrderByCreateTimeDesc(Long userId, Pageable pageable);

}

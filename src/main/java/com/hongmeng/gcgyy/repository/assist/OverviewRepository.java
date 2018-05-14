package com.hongmeng.gcgyy.repository.assist;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.assist.OverviewEntity;

public interface OverviewRepository extends PagingAndSortingRepository<OverviewEntity, Long> {
	
	Iterable<OverviewEntity> findByIdIn(List<Long> overviewIds);
	
	List<OverviewEntity> findAllByOrderByCreateTimeDesc();
	
	Page<OverviewEntity> findAllByOrderByCreateTimeDesc(Pageable pageable);

}

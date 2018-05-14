package com.hongmeng.gcgyy.repository.assist;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.assist.AnnounceEntity;

public interface AnnounceRepository extends PagingAndSortingRepository<AnnounceEntity, Long> {

	Iterable<AnnounceEntity> findByIdIn(List<Long> announceIds);
	
	List<AnnounceEntity> findAllByOrderByCreateTimeDesc();
	
	Page<AnnounceEntity> findAllByOrderByCreateTimeDesc(Pageable pageable);

}

package com.hongmeng.gcgyy.repository.industryService;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.industryService.DeclareEntity;

public interface DeclareRepository extends PagingAndSortingRepository<DeclareEntity, Long> {

	Iterable<DeclareEntity> findByIdIn(List<Long> declareIds);
	
	List<DeclareEntity> findAllByOrderByCreateTimeDesc();
	
	Page<DeclareEntity> findAllByOrderByCreateTimeDesc(Pageable pageable);
	
	List<DeclareEntity> findByUserIdOrderByCreateTimeDesc(Long userId);
	
	Page<DeclareEntity> findByUserIdOrderByCreateTimeDesc(Long userId, Pageable pageable);
	
	List<DeclareEntity> findByStatusOrderByCreateTimeDesc(Integer status);
	
	Page<DeclareEntity> findByStatusOrderByCreateTimeDesc(Integer status, Pageable pageable);
	
}

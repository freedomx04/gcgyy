package com.hongmeng.gcgyy.repository.setting;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.setting.DynamicEntity;

public interface DynamicRepository extends PagingAndSortingRepository<DynamicEntity, Long> {
	
	Iterable<DynamicEntity> findByIdIn(List<Long> dynamicIds);
	
	List<DynamicEntity> findAllByOrderByCreateTimeDesc();
	
	Page<DynamicEntity> findAllByOrderByCreateTimeDesc(Pageable pageable);
	
	List<DynamicEntity> findByTypeOrderByCreateTimeDesc(Integer type);
	
	Page<DynamicEntity> findByTypeOrderByCreateTimeDesc(Integer type, Pageable pageable);

}

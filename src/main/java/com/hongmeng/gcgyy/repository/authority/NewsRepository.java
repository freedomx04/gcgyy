package com.hongmeng.gcgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.NewsEntity;

public interface NewsRepository extends PagingAndSortingRepository<NewsEntity, Long> {

	List<NewsEntity> findAllByEnterpriseId(Long enterpriseId);
	
	Page<NewsEntity> findAllByEnterpriseId(Long enterpriseId, Pageable pageable);

	Iterable<NewsEntity> findByIdIn(List<Long> newsIds);

	List<NewsEntity> findByEnterpriseIdIn(List<Long> enterpriseIds);
	
}

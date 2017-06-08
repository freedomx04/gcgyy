package com.hongmeng.gcgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.ProductEntity;

public interface ProductRepository extends PagingAndSortingRepository<ProductEntity, Long> {
	
	List<ProductEntity> findAllByEnterpriseId(Long enterpriseId);
	
	Page<ProductEntity> findAllByEnterpriseId(Long enterpriseId, Pageable pageable);

	Iterable<ProductEntity> findByIdIn(List<Long> productIds);
	
	List<ProductEntity> findByEnterpriseIdIn(List<Long> enterpriseIds);
	
	List<ProductEntity> findByNameContaining(String name);
}

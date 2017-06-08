package com.hongmeng.gcgyy.repository.baseData;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;

public interface ProductTypeRepository extends CrudRepository<ProductTypeEntity, Long> {
	
	Iterable<ProductTypeEntity> findByIdIn(List<Long> productTypeIds);
	
	ProductTypeEntity findByName(String name);

}

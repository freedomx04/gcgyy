package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;

public interface ProductTypeService {
	
	ProductTypeEntity findOne(Long productTypeId);
	
	ProductTypeEntity findByName(String name);
	
	void save(ProductTypeEntity productType);
	
	void update(ProductTypeEntity productType, String name);
	
	void delete(List<Long> productTypeIds);
	
	List<ProductTypeEntity> list();

}

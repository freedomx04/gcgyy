package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.repository.baseData.ProductTypeRepository;

@Service
public class ProductTypeServiceImpl implements ProductTypeService {
	
	@Autowired
	ProductTypeRepository productTypeRepository;

	@Override
	public ProductTypeEntity findOne(Long productTypeId) {
		return productTypeRepository.findOne(productTypeId);
	}
	
	@Override
	public ProductTypeEntity findByName(String name) {
		return productTypeRepository.findByName(name);
	}

	@Override
	public void save(ProductTypeEntity productType) {
		productTypeRepository.save(productType);
	}

	@Override
	public void update(ProductTypeEntity productType, String name) {
		productType.setName(name);
		productTypeRepository.save(productType);
	}

	@Override
	public void delete(List<Long> productTypeIds) {
		Iterable<ProductTypeEntity> it = productTypeRepository.findByIdIn(productTypeIds);
		productTypeRepository.delete(it);
	}

	@Override
	public List<ProductTypeEntity> list() {
		return (List<ProductTypeEntity>) productTypeRepository.findAll();
	}

}
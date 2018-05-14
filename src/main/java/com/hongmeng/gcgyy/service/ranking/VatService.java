package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import com.hongmeng.gcgyy.entity.ranking.VatEntity;

public interface VatService {
	
	VatEntity findOne(Long vatId);
	
	VatEntity findOne(String monthly, Long countyId);
	
	void save(VatEntity vat);
	
	void delete(List<Long> vatIds);
	
	List<VatEntity> listByMonthly(String monthly);

}

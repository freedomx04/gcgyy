package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import com.hongmeng.gcgyy.entity.ranking.ProfitTaxEntity;

public interface ProfitTaxService {
	
	ProfitTaxEntity findOne(Long taxId);
	
	ProfitTaxEntity findOne(String monthly, Long countyId);
	
	void save(ProfitTaxEntity tax);
	
	void delete(List<Long> taxIds);
	
	List<ProfitTaxEntity> listByMonthly(String monthly);

}

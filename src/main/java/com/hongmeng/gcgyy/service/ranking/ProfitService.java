package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import com.hongmeng.gcgyy.entity.ranking.ProfitEntity;

public interface ProfitService {
	
	ProfitEntity findOne(Long profitId);
	
	ProfitEntity findOne(String monthly, Long countyId);
	
	void save(ProfitEntity profit);
	
	void delete(List<Long> profitIds);
	
	List<ProfitEntity> listByMonthly(String monthly);

}

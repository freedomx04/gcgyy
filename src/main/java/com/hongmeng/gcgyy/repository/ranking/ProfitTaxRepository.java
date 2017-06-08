package com.hongmeng.gcgyy.repository.ranking;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.ranking.ProfitTaxEntity;

public interface ProfitTaxRepository extends CrudRepository<ProfitTaxEntity, Long> {
	
	Iterable<ProfitTaxEntity> findByIdIn(List<Long> taxIds);
	
	ProfitTaxEntity findByMonthlyAndCountyId(String monthly, Long countyId);
	
	Iterable<ProfitTaxEntity> findByCountyId(Long countyId);
	
	List<ProfitTaxEntity> findByMonthly(String monthly);

}

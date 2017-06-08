package com.hongmeng.gcgyy.repository.ranking;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.ranking.VatEntity;

public interface VatRepository extends CrudRepository<VatEntity, Long> {
	
	Iterable<VatEntity> findByIdIn(List<Long> vatIds);
	
	VatEntity findByMonthlyAndCountyId(String monthly, Long countyId);
	
	Iterable<VatEntity> findByCountyId(Long countyId);
	
	List<VatEntity> findByMonthly(String monthly);

}

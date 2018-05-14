package com.hongmeng.gcgyy.repository.baseData;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.baseData.ReportEntity;

public interface ReportRepository extends CrudRepository<ReportEntity, Long> {
	
	Iterable<ReportEntity> findByIdIn(List<Long> reportEntityIds);
	
	ReportEntity findByType(Integer type);

}

package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import com.hongmeng.gcgyy.entity.baseData.ReportEntity;

public interface ReportService {
	
	ReportEntity findOne(Long reportId);
	
	ReportEntity findOne(Integer type);
	
	void save(ReportEntity report);
	
	void update(ReportEntity report, Integer days);
	
	void delete(List<Long> reportIds);
	
	List<ReportEntity> list();

}

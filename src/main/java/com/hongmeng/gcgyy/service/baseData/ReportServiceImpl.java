package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.baseData.ReportEntity;
import com.hongmeng.gcgyy.repository.baseData.ReportRepository;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportRepository reportRepository;

	@Override
	public ReportEntity findOne(Long reportId) {
		return reportRepository.findOne(reportId);
	}

	@Override
	public ReportEntity findOne(Integer type) {
		return reportRepository.findByType(type);
	}

	@Override
	public void save(ReportEntity report) {
		reportRepository.save(report);
	}

	@Override
	public void update(ReportEntity report, Integer days) {
		report.setDays(days);
		reportRepository.save(report);
	}

	@Override
	public void delete(List<Long> reportIds) {
		Iterable<ReportEntity> it = reportRepository.findByIdIn(reportIds);
		reportRepository.delete(it);
	}

	@Override
	public List<ReportEntity> list() {
		return (List<ReportEntity>) reportRepository.findAll();
	}

}
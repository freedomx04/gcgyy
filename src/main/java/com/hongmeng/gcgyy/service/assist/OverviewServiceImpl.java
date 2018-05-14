package com.hongmeng.gcgyy.service.assist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.assist.OverviewEntity;
import com.hongmeng.gcgyy.entity.baseData.OverviewTypeEntity;
import com.hongmeng.gcgyy.repository.assist.OverviewRepository;

@Service
public class OverviewServiceImpl implements OverviewService {
	
	@Autowired
	OverviewRepository overviewRepository;

	@Override
	public OverviewEntity findOne(Long overviewId) {
		return overviewRepository.findOne(overviewId);
	}

	@Override
	public void save(OverviewEntity overview) {
		overviewRepository.save(overview);
	}

	@Override
	public void update(OverviewEntity overview, String title, OverviewTypeEntity overviewType, String linkPath) {
		overview.setTitle(title);
		overview.setOverviewType(overviewType);
		overview.setLinkPath(linkPath);
		overviewRepository.save(overview);
	}

	@Override
	public void delete(List<Long> overviewIds) {
		Iterable<OverviewEntity> it = overviewRepository.findByIdIn(overviewIds);
		overviewRepository.delete(it);
	}

	@Override
	public List<OverviewEntity> list() {
		return overviewRepository.findAllByOrderByCreateTimeDesc();
	}

	@Override
	public List<OverviewEntity> listPaging(int page, int size) {
		Page<OverviewEntity> overviewPage = overviewRepository.findAllByOrderByCreateTimeDesc(new PageRequest(page, size));
		return overviewPage.getContent();
	}

}

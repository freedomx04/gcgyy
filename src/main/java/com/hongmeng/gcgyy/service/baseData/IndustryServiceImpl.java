package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.baseData.IndustryEntity;
import com.hongmeng.gcgyy.repository.baseData.IndustryRepository;

@Service
public class IndustryServiceImpl implements IndustryService {
	
	@Autowired
	IndustryRepository industryRepository;

	@Override
	public IndustryEntity findOne(Long industryId) {
		return industryRepository.findOne(industryId);
	}

	@Override
	public void save(IndustryEntity industry) {
		industryRepository.save(industry);
	}

	@Override
	public void update(IndustryEntity industry, String name) {
		industry.setName(name);
		industryRepository.save(industry);
	}

	@Override
	public void delete(List<Long> industryIds) {
		Iterable<IndustryEntity> it = industryRepository.findByIdIn(industryIds);
		industryRepository.delete(it);
	}

	@Override
	public List<IndustryEntity> list() {
		return (List<IndustryEntity>) industryRepository.findAll();
	}
}
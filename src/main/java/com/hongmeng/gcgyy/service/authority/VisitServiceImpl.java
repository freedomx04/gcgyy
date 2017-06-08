package com.hongmeng.gcgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.authority.VisitEntity;
import com.hongmeng.gcgyy.repository.authority.VisitRepository;

@Service
public class VisitServiceImpl implements VisitService {
	
	@Autowired
	VisitRepository visitRepository;

	@Override
	public void save(VisitEntity visit) {
		visitRepository.save(visit);
	}

	@Override
	public List<?> listByDate() {
		return visitRepository.listByDate();
	}

}

package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.ranking.VatEntity;
import com.hongmeng.gcgyy.repository.ranking.VatRepository;

@Service
public class VatServiceImpl implements VatService {
	
	@Autowired
	VatRepository vatRepository;

	@Override
	public VatEntity findOne(Long vatId) {
		return vatRepository.findOne(vatId);
	}

	@Override
	public VatEntity findOne(String monthly, Long countyId) {
		return vatRepository.findByMonthlyAndCountyId(monthly, countyId);
	}

	@Override
	public void save(VatEntity vat) {
		vatRepository.save(vat);
	}

	@Override
	public void delete(List<Long> vatIds) {
		Iterable<VatEntity> it = vatRepository.findByIdIn(vatIds);
		vatRepository.delete(it);
	}

	@Override
	public List<VatEntity> listByMonthly(String monthly) {
		return vatRepository.findByMonthly(monthly);
	}

}

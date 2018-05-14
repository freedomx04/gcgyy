package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.ranking.ProfitTaxEntity;
import com.hongmeng.gcgyy.repository.ranking.ProfitTaxRepository;

@Service
public class ProfitTaxServiceImpl implements ProfitTaxService {
	
	@Autowired
	ProfitTaxRepository taxRepository;

	@Override
	public ProfitTaxEntity findOne(Long taxId) {
		return taxRepository.findOne(taxId);
	}

	@Override
	public ProfitTaxEntity findOne(String monthly, Long countyId) {
		return taxRepository.findByMonthlyAndCountyId(monthly, countyId);
	}

	@Override
	public void save(ProfitTaxEntity tax) {
		taxRepository.save(tax);
	}

	@Override
	public void delete(List<Long> taxIds) {
		Iterable<ProfitTaxEntity> it = taxRepository.findByIdIn(taxIds);
		taxRepository.delete(it);
	}

	@Override
	public List<ProfitTaxEntity> listByMonthly(String monthly) {
		return taxRepository.findByMonthly(monthly);
	}

}

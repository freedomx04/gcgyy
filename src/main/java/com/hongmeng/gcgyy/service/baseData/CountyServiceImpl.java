package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.baseData.CountyEntity;
import com.hongmeng.gcgyy.entity.ranking.ElectricityEntity;
import com.hongmeng.gcgyy.entity.ranking.IndustryAdditionEntity;
import com.hongmeng.gcgyy.entity.ranking.IndustryOutputEntity;
import com.hongmeng.gcgyy.entity.ranking.MainBusinessEntity;
import com.hongmeng.gcgyy.entity.ranking.ProfitTaxEntity;
import com.hongmeng.gcgyy.entity.ranking.VatEntity;
import com.hongmeng.gcgyy.repository.baseData.CountyRepository;
import com.hongmeng.gcgyy.repository.ranking.ElectricityRepository;
import com.hongmeng.gcgyy.repository.ranking.IndustryAdditionRepository;
import com.hongmeng.gcgyy.repository.ranking.IndustryOutputRepository;
import com.hongmeng.gcgyy.repository.ranking.MainBusinessRepository;
import com.hongmeng.gcgyy.repository.ranking.ProfitTaxRepository;
import com.hongmeng.gcgyy.repository.ranking.VatRepository;

@Service
public class CountyServiceImpl implements CountyService {
	
	@Autowired
	CountyRepository countyRepository;
	
	@Autowired
	IndustryAdditionRepository additionRepository;
	
	@Autowired
	MainBusinessRepository businessRepository;
	
	@Autowired
	ProfitTaxRepository taxRepository;
	
	@Autowired
	ElectricityRepository electricityRepository;
	
	@Autowired
	IndustryOutputRepository outputRepository;
	
	@Autowired
	VatRepository vatRepository;

	@Override
	public CountyEntity findOne(Long countyId) {
		return countyRepository.findOne(countyId);
	}

	@Override
	public CountyEntity findByName(String name) {
		return countyRepository.findByName(name);
	}

	@Override
	public void save(CountyEntity county) {
		countyRepository.save(county);
	}

	@Override
	public void delete(List<Long> countyIds) {
		Iterable<CountyEntity> it = countyRepository.findByIdIn(countyIds);
		
		for (CountyEntity county: it) {
			Long countyId = county.getId();
			
			Iterable<IndustryAdditionEntity> additionList = additionRepository.findByCountyId(countyId);
			additionRepository.delete(additionList);
			
			Iterable<MainBusinessEntity> businessList = businessRepository.findByCountyId(countyId);
			businessRepository.delete(businessList);
			
			Iterable<ProfitTaxEntity> taxList = taxRepository.findByCountyId(countyId);
			taxRepository.delete(taxList);
			
			Iterable<ElectricityEntity> electricityList = electricityRepository.findByCountyId(countyId);
			electricityRepository.delete(electricityList);
			
			Iterable<IndustryOutputEntity> outputList = outputRepository.findByCountyId(countyId);
			outputRepository.delete(outputList);
			
			Iterable<VatEntity> vatList = vatRepository.findByCountyId(countyId);
			vatRepository.delete(vatList);
			
			countyRepository.delete(county);
		}
	}

	@Override
	public List<CountyEntity> list() {
		return (List<CountyEntity>) countyRepository.findAllByOrderBySortAsc();
	}

}
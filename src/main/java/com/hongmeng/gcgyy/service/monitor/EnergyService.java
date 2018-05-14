package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;

public interface EnergyService {
	
	EnergyEntity findOne(Long energyId);
	
	EnergyEntity findOne(String monthly, Long enterpriseId);
	
	void save(EnergyEntity energy);
	
	void update(EnergyEntity energy, String monthly, BaseEnterpriseEntity enterprise, float electricity, float gas);
	
	void delete(List<Long> energyIds);
	
	List<EnergyEntity> list(String monthly);
	
	List<EnergyEntity> list(String monthly, int page, int size);
	
	List<EnergyEntity> list(Long enterpriseId);
	
	List<EnergyEntity> list(Long enterpriseId, int page, int size);
	
	EnergyVO detail(EnergyEntity energy);
	
	EnergyVO detail(String monthly, BaseEnterpriseEntity enterprise);
	
	List<EnergyEntity> listByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list);
	
	List<EnergyEntity> listByMonthlyInAndEnterpriseId(List<String> monthlyList, Long enterpriseId);
	
	EnergyVO sumEnterpriseEnergy(String monthly, List<BaseEnterpriseEntity> enterpriseList);

}

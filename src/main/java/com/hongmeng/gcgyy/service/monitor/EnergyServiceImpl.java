package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;
import com.hongmeng.gcgyy.repository.monitor.EnergyRepository;

@Service
public class EnergyServiceImpl implements EnergyService {

	@Autowired
	EnergyRepository energyRepository;

	@Override
	public EnergyEntity findOne(Long energyId) {
		return energyRepository.findOne(energyId);
	}

	@Override
	public EnergyEntity findOne(String monthly, Long enterpriseId) {
		return energyRepository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);
	}

	@Override
	public void save(EnergyEntity energy) {
		energyRepository.save(energy);
	}

	@Override
	public void update(EnergyEntity energy, String monthly, BaseEnterpriseEntity enterprise, float electricity,
			float gas) {
		energy.setMonthly(monthly);
		energy.setEnterprise(enterprise);
		energy.setElectricity(electricity);
		energy.setGas(gas);
		energyRepository.save(energy);
	}

	@Override
	public void delete(List<Long> energyIds) {
		Iterable<EnergyEntity> it = energyRepository.findByIdIn(energyIds);
		energyRepository.delete(it);
	}

	@Override
	public List<EnergyEntity> list(String monthly) {
		return energyRepository.findByMonthly(monthly);
	}

	@Override
	public List<EnergyEntity> list(String monthly, int page, int size) {
		Page<EnergyEntity> energyPage = energyRepository.findByMonthly(monthly, new PageRequest(page, size));
		return energyPage.getContent();
	}

	@Override
	public List<EnergyEntity> list(Long enterpriseId) {
		return energyRepository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId);
	}

	@Override
	public List<EnergyEntity> list(Long enterpriseId, int page, int size) {
		Page<EnergyEntity> energyPage = energyRepository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId,
				new PageRequest(page, size));
		return energyPage.getContent();
	}

	@Override
	public EnergyVO detail(EnergyEntity energy) {
		EnergyEntity lastYearEnergy = getLastYearEnergy(energy);
		EnergyEntity lastMonthEnergy = getLastMonthEnergy(energy);
		EnergyVO ret = new EnergyVO(energy.getMonthly(), energy, lastYearEnergy, lastMonthEnergy);

		if (lastYearEnergy != null) {
			String electricity_yearGrowth = FormulaUtils.getGrowth(energy.getElectricity(),
					lastYearEnergy.getElectricity());
			ret.setElectricity_yearGrowth(electricity_yearGrowth);

			String gas_yearGrowth = FormulaUtils.getGrowth(energy.getGas(), lastYearEnergy.getGas());
			ret.setGas_yearGrowth(gas_yearGrowth);
		}

		if (lastMonthEnergy != null) {
			String electricity_monthGrowth = FormulaUtils.getGrowth(energy.getElectricity(),
					lastMonthEnergy.getElectricity());
			ret.setElectricity_monthGrowth(electricity_monthGrowth);

			String gas_monthGrowth = FormulaUtils.getGrowth(energy.getGas(), lastMonthEnergy.getGas());
			ret.setGas_monthGrowth(gas_monthGrowth);
		}

		return ret;
	}

	@Override
	public EnergyVO detail(String monthly, BaseEnterpriseEntity enterprise) {
		Long enterpriseId = enterprise.getId();

		EnergyEntity energy_current = energyRepository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		EnergyEntity energy_lastYear = energyRepository.findByMonthlyAndEnterpriseId(monthly_lastYear, enterpriseId);
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		EnergyEntity energy_lastMonth = energyRepository.findByMonthlyAndEnterpriseId(monthly_lastMonth, enterpriseId);

		EnergyVO ret = new EnergyVO(monthly, energy_current, energy_lastYear, energy_lastMonth);
		ret.setEnterprise(enterprise);

		if (energy_current != null && energy_lastYear != null) {
			ret.setElectricity_yearGrowth(
					FormulaUtils.getGrowth(energy_current.getElectricity(), energy_lastYear.getElectricity()));
			ret.setGas_yearGrowth(FormulaUtils.getGrowth(energy_current.getGas(), energy_lastYear.getGas()));
		}

		if (energy_current != null && energy_lastMonth != null) {
			ret.setElectricity_monthGrowth(
					FormulaUtils.getGrowth(energy_current.getElectricity(), energy_lastMonth.getElectricity()));
			ret.setGas_monthGrowth(FormulaUtils.getGrowth(energy_current.getGas(), energy_lastMonth.getGas()));
		}

		return ret;
	}

	public EnergyEntity getLastYearEnergy(EnergyEntity energy) {
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(energy.getMonthly());
		return energyRepository.findByMonthlyAndEnterpriseId(monthly_lastYear, energy.getEnterprise().getId());
	}

	public EnergyEntity getLastMonthEnergy(EnergyEntity energy) {
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(energy.getMonthly());
		return energyRepository.findByMonthlyAndEnterpriseId(monthly_lastMonth, energy.getEnterprise().getId());
	}

	@Override
	public List<EnergyEntity> listByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list) {
		return energyRepository.findByMonthlyAndEnterpriseIn(monthly, list);
	}

	@Override
	public List<EnergyEntity> listByMonthlyInAndEnterpriseId(List<String> monthlyList, Long enterpriseId) {
		return energyRepository.findByMonthlyInAndEnterpriseId(monthlyList, enterpriseId);
	}

	@Override
	public EnergyVO sumEnterpriseEnergy(String monthly, List<BaseEnterpriseEntity> enterpriseList) {
		// current
		float electricity_current_totle = 0;
		float gas_current_totle = 0;
		List<EnergyEntity> energyList = listByMonthlyAndEnterpriseIn(monthly, enterpriseList);
		for (EnergyEntity energy : energyList) {
			electricity_current_totle += energy.getElectricity();
			gas_current_totle += energy.getGas();
		}
		EnergyEntity energy_current_totle = new EnergyEntity(monthly, null, electricity_current_totle,
				gas_current_totle);

		// last year
		String lastYearMonthly = FormulaUtils.getLastYearMonthly(monthly);
		float electricity_lastYear_totle = 0;
		float gas_lastYear_totle = 0;
		List<EnergyEntity> energyList_lastYear = listByMonthlyAndEnterpriseIn(lastYearMonthly, enterpriseList);
		for (EnergyEntity energy : energyList_lastYear) {
			electricity_lastYear_totle += energy.getElectricity();
			gas_lastYear_totle += energy.getGas();
		}
		EnergyEntity energy_lastYear_totle = new EnergyEntity(lastYearMonthly, null, electricity_lastYear_totle,
				gas_lastYear_totle);

		// last month
		String lastMonthMonthly = FormulaUtils.getLastMonthMonthly(monthly);
		float electricity_lastMonth_totle = 0;
		float gas_lastMonth_totle = 0;
		List<EnergyEntity> energyList_lastMonth = listByMonthlyAndEnterpriseIn(lastMonthMonthly, enterpriseList);
		for (EnergyEntity energy : energyList_lastMonth) {
			electricity_lastMonth_totle += energy.getElectricity();
			gas_lastMonth_totle += energy.getGas();
		}
		EnergyEntity energy_lastMonth_totle = new EnergyEntity(lastMonthMonthly, null, electricity_lastMonth_totle,
				gas_lastMonth_totle);

		EnergyVO ret = new EnergyVO(monthly, energy_current_totle, energy_lastYear_totle, energy_lastMonth_totle);

		// 同比
		ret.setElectricity_yearGrowth(
				FormulaUtils.getGrowth(energy_current_totle.getElectricity(), energy_lastYear_totle.getElectricity()));
		ret.setGas_yearGrowth(FormulaUtils.getGrowth(energy_current_totle.getGas(), energy_lastYear_totle.getGas()));

		// 环比
		ret.setElectricity_monthGrowth(
				FormulaUtils.getGrowth(energy_current_totle.getElectricity(), energy_lastMonth_totle.getElectricity()));
		ret.setGas_monthGrowth(FormulaUtils.getGrowth(energy_current_totle.getGas(), energy_lastMonth_totle.getGas()));

		return ret;
	}

}

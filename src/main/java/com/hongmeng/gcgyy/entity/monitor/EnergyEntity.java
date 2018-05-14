package com.hongmeng.gcgyy.entity.monitor;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;

@Entity
@Table(name = "monitor_energy", indexes = {
	@Index(name = "index_energy_monthly", columnList = "monthly"),
	@Index(name = "index_energy_enterprise", columnList = "enterprise_id"),
	@Index(name = "index_energy_monthly_enterprise", columnList = "monthly, enterprise_id") 
})
public class EnergyEntity extends BaseEntity {

	private String monthly; // 月报表时间

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private BaseEnterpriseEntity enterprise; // 企业

	private float electricity = 0; // 本月用电量 

	private float gas = 0; // 用水量

//	private Integer status = ApproveStatus.NEW; // 上报状态

	public EnergyEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public EnergyEntity(String monthly, BaseEnterpriseEntity enterprise) {
		this.monthly = monthly;
		this.enterprise = enterprise;
	}

	public EnergyEntity(String monthly, BaseEnterpriseEntity enterprise, float electricity, float gas) {
		this.monthly = monthly;
		this.enterprise = enterprise;
		this.electricity = electricity;
		this.gas = gas;
	}

	public String getMonthly() {
		return monthly;
	}

	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}

	public BaseEnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(BaseEnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public float getElectricity() {
		return electricity;
	}

	public void setElectricity(float electricity) {
		this.electricity = electricity;
	}

	public float getGas() {
		return gas;
	}

	public void setGas(float gas) {
		this.gas = gas;
	}

/*	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}*/

}
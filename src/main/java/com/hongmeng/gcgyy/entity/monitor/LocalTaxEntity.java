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
@Table(name = "monitor_local_tax", indexes = {
	@Index(name = "index_local_tax_monthly", columnList = "monthly"),
	@Index(name = "index_local_tax_enterprise", columnList = "enterprise_id"),
	@Index(name = "index_local_tax_monthly_enterprise", columnList = "monthly, enterprise_id") 
})
public class LocalTaxEntity extends BaseEntity {

	private String monthly; // 月份
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private BaseEnterpriseEntity enterprise; // 企业ID

	private String taxes = "0"; // 税收
	
	public LocalTaxEntity() {}
	
	public LocalTaxEntity(BaseEnterpriseEntity enterprise, String monthly) {
		super();
		this.enterprise = enterprise;
		this.monthly = monthly;
	}

	public LocalTaxEntity(BaseEnterpriseEntity enterprise, String monthly, String taxes) {
		super();
		this.enterprise = enterprise;
		this.monthly = monthly;
		this.taxes = taxes;
	}
	
	public BaseEnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(BaseEnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public String getMonthly() {
		return monthly;
	}

	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}

	public String getTaxes() {
		return taxes;
	}

	public void setTaxes(String taxes) {
		this.taxes = taxes;
	}

}
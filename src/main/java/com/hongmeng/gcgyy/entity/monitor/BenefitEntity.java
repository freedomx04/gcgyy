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
@Table(name = "monitor_benefit", indexes = { 
	@Index(name = "index_benefit_monthly", columnList = "monthly"),
	@Index(name = "index_benefit_enterprise", columnList = "enterprise_id"),
	@Index(name = "index_benefit_monthly_enterprise", columnList = "monthly, enterprise_id") 
})
public class BenefitEntity extends BaseEntity {

	private String monthly; // 月报表时间

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private BaseEnterpriseEntity enterprise; // 企业

	private float receivable = 0; // 应收账款

	private float inventory = 0; // 产存品存货

	private float flowAssets = 0; // 流动资产

	private float assets = 0; // 资产

	private float debt = 0; // 负债

	private float totleAssets = 0; // 两项资产

	//private Integer status = ApproveStatus.NEW; // 上报状态

	public BenefitEntity() {
		// TODO Auto-generated constructor stub
	}

	public BenefitEntity(String monthly, BaseEnterpriseEntity enterprise, float receivable, float inventory,
			float assets, float debt) {
		this.monthly = monthly;
		this.enterprise = enterprise;
		this.receivable = receivable;
		this.inventory = inventory;
		this.flowAssets = receivable + inventory;
		this.assets = assets;
		this.debt = debt;
		this.totleAssets = assets + debt;
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

	public float getReceivable() {
		return receivable;
	}

	public void setReceivable(float receivable) {
		this.receivable = receivable;
	}

	public float getInventory() {
		return inventory;
	}

	public void setInventory(float inventory) {
		this.inventory = inventory;
	}

	public float getFlowAssets() {
		return flowAssets;
	}

	public void setFlowAssets(float flowAssets) {
		this.flowAssets = flowAssets;
	}

	public float getAssets() {
		return assets;
	}

	public void setAssets(float assets) {
		this.assets = assets;
	}

	public float getDebt() {
		return debt;
	}

	public void setDebt(float debt) {
		this.debt = debt;
	}

	public float getTotleAssets() {
		return totleAssets;
	}

	public void setTotleAssets(float totleAssets) {
		this.totleAssets = totleAssets;
	}

/*	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}*/

}
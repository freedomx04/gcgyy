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
@Table(name = "monitor_economic", indexes = { 
	@Index(name = "index_economic_monthly", columnList = "monthly"),
	@Index(name = "index_economic_enterprise", columnList = "enterprise_id"),
	@Index(name = "index_economic_monthly_enterprise", columnList = "monthly, enterprise_id") 
})
public class EconomicEntity extends BaseEntity {

/*	public class ApproveStatus {
		public static final int REJECT = -1;
		public static final int NEW = 0;
		public static final int REPORT = 1;
		public static final int PASS = 2;
	}*/

	private String monthly; // 月报表时间

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private BaseEnterpriseEntity enterprise; // 企业

	private float industryAddition = 0; // 本月止工业总产值

	private float mainBusiness = 0; // 本月止主营业务收入

	private float profit = 0; // 本月止利润总额

	private float tax = 0; // 本月止税金总额

//	private Integer status = ApproveStatus.NEW; // 上报状态

	public EconomicEntity() {
		// TODO Auto-generated constructor stub
	}

	public EconomicEntity(String monthly, BaseEnterpriseEntity enterprise, float industryAddition, float mainBusiness) {
		this.monthly = monthly;
		this.enterprise = enterprise;
		this.industryAddition = industryAddition;
		this.mainBusiness = mainBusiness;
	}

	public EconomicEntity(String monthly, BaseEnterpriseEntity enterprise, float industryAddition, float mainBusiness,
			float profit, float tax) {
		this.monthly = monthly;
		this.enterprise = enterprise;
		this.industryAddition = industryAddition;
		this.mainBusiness = mainBusiness;
		this.profit = profit;
		this.tax = tax;
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

	public float getIndustryAddition() {
		return industryAddition;
	}

	public void setIndustryAddition(float industryAddition) {
		this.industryAddition = industryAddition;
	}

	public float getMainBusiness() {
		return mainBusiness;
	}

	public void setMainBusiness(float mainBusiness) {
		this.mainBusiness = mainBusiness;
	}

	public float getProfit() {
		return profit;
	}

	public void setProfit(float profit) {
		this.profit = profit;
	}

	public float getTax() {
		return tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

/*	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}*/

}
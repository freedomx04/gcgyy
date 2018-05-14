package com.hongmeng.gcgyy.entity.assist;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.baseData.PolicyTypeEntity;

@Entity
@Table(name = "assist_policy", indexes = {
	@Index(name = "INDEX_POLICY_CREATETIME", columnList = "createTime")
})
public class PolicyEntity extends BaseEntity {

	private String title; // 政策标题

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "type_id")
	private PolicyTypeEntity policyType; // 政策类型

	private String linkPath; // 图文链接

	public PolicyEntity() {
		// TODO Auto-generated constructor stub
	}

	public PolicyEntity(String title, PolicyTypeEntity policyType, String linkPath) {
		this.title = title;
		this.policyType = policyType;
		this.linkPath = linkPath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public PolicyTypeEntity getPolicyType() {
		return policyType;
	}

	public void setPolicyType(PolicyTypeEntity policyType) {
		this.policyType = policyType;
	}

	public String getLinkPath() {
		return linkPath;
	}

	public void setLinkPath(String linkPath) {
		this.linkPath = linkPath;
	}

}
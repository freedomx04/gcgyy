package com.hongmeng.gcgyy.entity.assist;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.baseData.OverviewTypeEntity;

@Entity
@Table(name = "assist_overview", indexes = {
	@Index(name = "INDEX_OVERVIEW_CREATETIME", columnList = "createTime")
})
public class OverviewEntity extends BaseEntity {

	private String title; // 工业快报标题

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "type_id")
	private OverviewTypeEntity overviewType; // 工业快报类型

	private String linkPath; // 图文链接

	public OverviewEntity() {
		// TODO Auto-generated constructor stub
	}

	public OverviewEntity(String title, OverviewTypeEntity overviewType, String linkPath) {
		this.title = title;
		this.overviewType = overviewType;
		this.linkPath = linkPath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public OverviewTypeEntity getOverviewType() {
		return overviewType;
	}

	public void setOverviewType(OverviewTypeEntity overviewType) {
		this.overviewType = overviewType;
	}

	public String getLinkPath() {
		return linkPath;
	}

	public void setLinkPath(String linkPath) {
		this.linkPath = linkPath;
	}

}
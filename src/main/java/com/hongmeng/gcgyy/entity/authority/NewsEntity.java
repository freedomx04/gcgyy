package com.hongmeng.gcgyy.entity.authority;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_enterprise_news")
public class NewsEntity extends BaseEntity {
	
	@Column(name = "enterprise_id")
	private Long enterpriseId; // 企业ID

	private String title; // 新闻标题

	private String linkPath; // 图文链接
	
	private String content; // 内容

	public NewsEntity() {
		// TODO Auto-generated constructor stub
	}

	public NewsEntity(Long enterpriseId, String title, String linkPath) {
		this.enterpriseId = enterpriseId;
		this.title = title;
		this.linkPath = linkPath;
	}

	public Long getEnterpriseId() {
		return enterpriseId;
	}

	public void setEnterpriseId(Long enterpriseId) {
		this.enterpriseId = enterpriseId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLinkPath() {
		return linkPath;
	}

	public void setLinkPath(String linkPath) {
		this.linkPath = linkPath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
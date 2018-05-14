package com.hongmeng.gcgyy.entity.assist;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "assist_announce", indexes = {
	@Index(name = "INDEX_ANNOUNCE_CREATETIME", columnList = "createTime")
})
public class AnnounceEntity extends BaseEntity {

	private String title; // 公告标题

	private String linkPath; // 公告链接

	public AnnounceEntity() {
		// TODO Auto-generated constructor stub
	}

	public AnnounceEntity(String title, String linkPath) {
		this.title = title;
		this.linkPath = linkPath;
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

}
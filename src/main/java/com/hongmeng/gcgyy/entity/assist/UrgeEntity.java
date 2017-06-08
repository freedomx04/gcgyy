package com.hongmeng.gcgyy.entity.assist;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;

@Entity
@Table(name = "assist_urge", indexes = {
	@Index(name = "index_urge_createTime", columnList = "createTime")	
})
public class UrgeEntity extends BaseEntity {
	
	@Column(name = "appeal_id")
	private Long appealId;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private BaseUserEntity user;
	
	@Column(length = 4000)
	private String content;
	
	public UrgeEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public UrgeEntity(Long appealId, BaseUserEntity user, String content) {
		this.appealId = appealId;
		this.user = user;
		this.content = content;
	}

	public Long getAppealId() {
		return appealId;
	}

	public void setAppealId(Long appealId) {
		this.appealId = appealId;
	}

	public BaseUserEntity getUser() {
		return user;
	}

	public void setUser(BaseUserEntity user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
package com.hongmeng.gcgyy.entity.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;

@Entity
@Table(name = "system_push", indexes = {
		@Index(name = "INDEX_PUSH_USER_CREATETIME", columnList = "user_id, createTime") })
public class PushEntity extends BaseEntity {

	public class SendType {
		public static final int ENTERPRISE = 1; // 企业
		public static final int DISPATCH = 2; // 派单
		public static final int MONITOR = 3; // 监督
		public static final int DEPARTMENT = 4; // 相关部门
		public static final int POINT = 5; // 挂点
	}

	public class PushType {
		public static final int APPEAL = 1; // 诉求
	}

	public class PushStatus {
		public static final int UNPUSH = 0; // 未推送
		public static final int PUSH = 1; // 已推送
	}

	@OneToOne
	@JoinColumn(name = "user_id")
	private BaseUserEntity user; // 推送人

	private String ticker; // 通知栏提示文字

	private String title; // 通知标题

	private String text; // 通知文字描述

	private Integer sendType; // 发送类别

	private Integer pushType; // 类别

	private Long pushTypeId; // id
	
	@Column(length = 2000)
	public String content;

	private Integer pushStatus = PushStatus.UNPUSH; // 推送状态

	public PushEntity() {
		// TODO Auto-generated constructor stub
	}

	public PushEntity(BaseUserEntity user, String title, String text, Integer sendType, Integer pushType, Long pushTypeId) {
		this.user = user;
		this.ticker = title;
		this.title = title;
		this.text = text;
		this.sendType = sendType;
		this.pushType = pushType;
		this.pushTypeId = pushTypeId;
	}

	public BaseUserEntity getUser() {
		return user;
	}

	public void setUser(BaseUserEntity user) {
		this.user = user;
	}

	public String getTicker() {
		return ticker;
	}

	public void setTicker(String ticker) {
		this.ticker = ticker;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getPushStatus() {
		return pushStatus;
	}

	public void setPushStatus(Integer pushStatus) {
		this.pushStatus = pushStatus;
	}

	public Integer getSendType() {
		return sendType;
	}

	public void setSendType(Integer sendType) {
		this.sendType = sendType;
	}

	public Integer getPushType() {
		return pushType;
	}

	public void setPushType(Integer pushType) {
		this.pushType = pushType;
	}

	public Long getPushTypeId() {
		return pushTypeId;
	}

	public void setPushTypeId(Long pushTypeId) {
		this.pushTypeId = pushTypeId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
package com.hongmeng.gcgyy.entity.assist;

import java.util.Date;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.assist.AppealEntity.AppealStatus;

public class BaseAppealEntity extends BaseEntity {

	private String title; // 诉求名称

	private String description; // 诉求描述

	private Integer status = AppealStatus.NEW; // 诉求状态
	
	private Date sendTime; // 发送时间
	
	private Date dispatchTime; // 派发时间

	private Date acceptTime; // 受理时间

	private Date handleTime; // 处理时间

	public BaseAppealEntity() {
		// TODO Auto-generated constructor stub
	}

	public BaseAppealEntity(String title, String description, Integer status) {
		this.title = title;
		this.description = description;
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Date getDispatchTime() {
		return dispatchTime;
	}

	public void setDispatchTime(Date dispatchTime) {
		this.dispatchTime = dispatchTime;
	}

	public Date getAcceptTime() {
		return acceptTime;
	}

	public void setAcceptTime(Date acceptTime) {
		this.acceptTime = acceptTime;
	}

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}
	
}

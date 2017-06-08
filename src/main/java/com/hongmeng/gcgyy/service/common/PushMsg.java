package com.hongmeng.gcgyy.service.common;

public class PushMsg {

	private Integer sendType; // 推送类别

	public Object data = new Object(); // 对象详情

	public PushMsg() {
		// TODO Auto-generated constructor stub
	}
	
	public PushMsg(Integer sendType, Object data) {
		this.sendType = sendType;
		this.data = data;
	}

	public PushMsg(Integer sendType, Integer msgType, Object data) {
		this.sendType = sendType;
		this.data = data;
	}

	public Integer getSendType() {
		return sendType;
	}

	public void setSendType(Integer sendType) {
		this.sendType = sendType;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
